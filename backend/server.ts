
import express from "express";
import { Pool } from "pg";
import cors from "cors";


const app = express();
app.use(cors());
app.use(express.json());

const pool = new Pool({
  user: "mia_nomad",
  password: "mia_nomad",
  host: "localhost",
  port: 5432,
  database: "mia_nomad_db",
});


// the RECOMMENDATION engine so to speak
import { pipeline } from "@xenova/transformers";

let embedder: any;


async function getEmbedder() {
  if (!embedder) embedder = await pipeline("feature-extraction", "Xenova/all-MiniLM-L6-v2");
  return embedder;
}
async function geocode(placeName: string) {
  const res = await fetch(
    `https://nominatim.openstreetmap.org/search?q=${encodeURIComponent(placeName)}&format=json&limit=1`,
    { headers: { "User-Agent": "nomad-app" } }
  );
  const data = await res.json();
  if (data.length === 0) throw new Error("place not found");
  return { lat: parseFloat(data[0].lat), lng: parseFloat(data[0].lon) };
}

app.get("/search", async (req, res) => {
  const location = String(req.query.location ?? "");
  const q = String(req.query.q ?? "");
  const leastKnown = req.query.leastKnown === "true";
  const userId = 1; // hardcoded for now, same as frontend

  let latFilter = "";
  let params: any[] = [];

  if (location) {
    const { lat, lng } = await geocode(location);
    const degrees = 2;
    latFilter = "WHERE lat BETWEEN $2 AND $3 AND lng BETWEEN $4 AND $5";
    params = [lat - degrees, lat + degrees, lng - degrees, lng + degrees];
  }

  const embed = await getEmbedder();
  const output = await embed(q, { pooling: "mean", normalize: true });
  let queryVector = Array.from(output.data) as number[];

  // blend in user's like history, if any
  const liked = await pool.query(
  `SELECT embedding, liked, signal_type FROM user_feedback f
   JOIN places p ON p.id = f.place_id
   WHERE f.user_id = $1`,
  [userId]
);

if (liked.rows.length > 0) {
  const weightedVectors = liked.rows
    .filter((r) => r.liked !== false) // skip dislikes for now
    .map((r) => {
      const weight = r.signal_type === "view" ? 0.3 : 1.0; // views count less
      return { vector: JSON.parse(r.embedding), weight };
    });

  if (weightedVectors.length > 0) {
    const totalWeight = weightedVectors.reduce((sum, w) => sum + w.weight, 0);
    const avgLiked = queryVector.map(
      (_, i) =>
        weightedVectors.reduce((sum, w) => sum + w.vector[i] * w.weight, 0) / totalWeight
    );
    queryVector = queryVector.map((v, i) => v * 0.7 + avgLiked[i] * 0.3);
  }
}

  const vectorParam = JSON.stringify(queryVector);
  params.unshift(vectorParam);

  const orderBy = leastKnown ? "popularity ASC" : "embedding <=> $1";

  const result = await pool.query(
    `SELECT id, name, description, lat, lng, popularity, 1 - (embedding <=> $1) AS match
     FROM places ${latFilter} ORDER BY ${orderBy} LIMIT 10`,
    params
  );

  res.json(result.rows);
});





// feedback endpoint
//enter feedback into places/user table
app.post("/feedback", async (req, res) => {
  const { userId, placeId, liked } = req.body;
  await pool.query(
    "INSERT INTO user_feedback (user_id, place_id, liked) VALUES ($1, $2, $3)",
    [userId, placeId, liked]
  );
  res.json({ ok: true });
});

app.post("/view", async (req, res) => {
  const { userId, placeId } = req.body;
  await pool.query(
    "INSERT INTO user_feedback (user_id, place_id, liked, signal_type) VALUES ($1, $2, NULL, 'view')",
    [userId, placeId]
  );
  res.json({ ok: true });
});



// return saved places
app.get("/profile/:userId", async (req, res) => {
  const userId = req.params.userId;

  const liked = await pool.query(
    `SELECT p.name, p.description FROM user_feedback f
     JOIN places p ON p.id = f.place_id
     WHERE f.user_id = $1 AND f.liked = true`,
    [userId]
  );

  res.json({ liked: liked.rows });
});

app.get("/recommendations/:userId", async (req, res) => {
  const userId = req.params.userId;

  const liked = await pool.query(
    `SELECT embedding FROM user_feedback f
     JOIN places p ON p.id = f.place_id
     WHERE f.user_id = $1 AND f.liked = true`,
    [userId]
  );

  if (liked.rows.length === 0) {
    return res.json({ message: "no liked places yet" });
  }

  const vectors = liked.rows.map((r) => JSON.parse(r.embedding));
  const avg = vectors[0].map(
    (_: number, i: number) => vectors.reduce((sum, v) => sum + v[i], 0) / vectors.length
  );

  const result = await pool.query(
    `SELECT name, description, popularity, 1 - (embedding <=> $1) AS match
     FROM places ORDER BY embedding <=> $1 LIMIT 10`,
    [JSON.stringify(avg)]
  );

  res.json(result.rows);
});


app.listen(3000, () => console.log("running on http://localhost:3000"));


