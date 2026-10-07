async function geocode(placeName: string) {
    // get the latitude and longitude from a location name
    const res = await fetch(
        `https://nominatim.openstreetmap.org/search?q=${encodeURIComponent(placeName)}&format=json&limit=1`,
        { headers: { "User-Agent": "nomad-app" } }
    );
    const data = await res.json();
    if (data.length === 0) throw new Error("place not found");
    return { lat: parseFloat(data[0].lat), lng: parseFloat(data[0].lon) };
}


async function fetchNearbyPlaces(lat: number, lng: number, radiusMeters: number = 5000) {
    // fetch nearby places based on a vibe

    const query = `[out:json]
    node["historic"](around:${radiusMeters},${lat},${lng};
    node["tourism"="attraction"](around:${radiusMeters},${lat},${lng}););
    out body;`;
    const oql = ;
    const url = "https://overpass-api.de/api/interpreter?data=" + encodeURIComponent(query);
    const res = await fetch(url, {
    headers: {
      "User-Agent": "nomad-app (your-email@example.com)",
      "Accept": "*/*",
        },
     });
    const data = await res.json();
    return data.elements;
}

async function run() {
        // insert place variable name here
        // if place is not empty, continue here, else dont run anything
        // call run() from somewhere else; like the search button
    const { lat, lng } = await geocode("Bangalore");
    
    const places = await fetchNearbyPlaces(lat, lng, 5000);

}

run();