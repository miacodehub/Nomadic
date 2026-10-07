const vibe = document.getElementById("vibe");
const button = document.getElementById("searchBtn");
const resultsList = document.getElementById("results");
button.addEventListener("click", async () => {
    const q = vibe.value;
    const res = await fetch(`http://localhost:3000/search?q=${encodeURIComponent(q)}`);
    const places = await res.json();
    resultsList.innerHTML = "";
    for (const p of places) {
        const li = document.createElement("li");
        li.textContent = `${p.name} — match: ${(p.match * 100).toFixed(0)}%`;
        resultsList.appendChild(li);
    }
});
export {};
//# sourceMappingURL=app.js.map