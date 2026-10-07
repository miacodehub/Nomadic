import { pipeline } from "@xenova/transformers";
import { Pool } from "pg";

const pool = new Pool({
  user: "mia_nomad",
  password: "mia_nomad",
  host: "localhost",
  port: 5432,
  database: "mia_nomad_db",
});

async function run() {
  const embedder = await pipeline("feature-extraction", "Xenova/all-MiniLM-L6-v2");
  // get an embedder model
  
  const places = await pool.query("SELECT id, name, description FROM places");

  for (const p of places.rows) {
    const text = `${p.name}. ${p.description}`;
    const output = await embedder(text, { pooling: "mean", normalize: true });
    const vector = Array.from(output.data);
    await pool.query("UPDATE places SET embedding = $1 WHERE id = $2", [
      JSON.stringify(vector),
      p.id,
    ]);
    console.log(`embedded: ${p.name}`);
  }
  await pool.end();
}

run();