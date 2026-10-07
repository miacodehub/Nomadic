const locationInput = document.getElementById("location") as HTMLInputElement;
const vibeInput = document.getElementById("vibe") as HTMLInputElement;
const leastKnownBox = document.getElementById("leastKnown") as HTMLInputElement;
const button = document.getElementById("searchBtn") as HTMLButtonElement;

const resultsList = document.getElementById("results") as HTMLUListElement;

const userId = 1;

function renderPlaces(places: any[]) {
  resultsList.innerHTML = "";
  for (const p of places) {
    const li = document.createElement("li");
    li.className = "place-card";

    const info = document.createElement("div");
    info.className = "place-info";

    const name = document.createElement("span");
    name.className = "place-name";
    name.textContent = p.name;

    const match = document.createElement("span");
    match.className = "place-match";
    match.textContent = `match: ${((p.match ?? 0) * 100).toFixed(0)}%`;

    info.appendChild(name);
    info.appendChild(match);

    const btnGroup = document.createElement("div");
    btnGroup.style.display = "flex";
    btnGroup.style.gap = "6px";

    const likeBtn = document.createElement("button");
    likeBtn.className = "like-btn";
    likeBtn.textContent = "👍";

    const dislikeBtn = document.createElement("button");
    dislikeBtn.className = "dislike-btn";
    dislikeBtn.textContent = "👎";

    async function sendFeedback(liked: boolean) {
      await fetch("http://localhost:3000/feedback", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId, placeId: p.id, liked }),
      });
      likeBtn.classList.remove("liked");
      dislikeBtn.classList.remove("disliked");
      if (liked) {
        likeBtn.classList.add("liked");
      } else {
        dislikeBtn.classList.add("disliked");
      }
    }

    likeBtn.addEventListener("click", () => sendFeedback(true));
    dislikeBtn.addEventListener("click", () => sendFeedback(false));

    btnGroup.appendChild(likeBtn);
    btnGroup.appendChild(dislikeBtn);
        btnGroup.appendChild(likeBtn);
    btnGroup.appendChild(dislikeBtn);

    li.addEventListener("click", (e) => {
      if ((e.target as HTMLElement).tagName === "BUTTON") return;
      resultsList.innerHTML = '<li class="loading">searching...</li>';
      fetch("http://localhost:3000/view", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId, placeId: p.id }),
      });
    });

    

    li.appendChild(info);
    li.appendChild(btnGroup);
    resultsList.appendChild(li);
  }
}

button.addEventListener("click", async () => {
  const loc = locationInput.value;
  const q = vibeInput.value;
  const leastKnown = leastKnownBox.checked;

  const url = `http://localhost:3000/search?location=${encodeURIComponent(loc)}&q=${encodeURIComponent(q)}&leastKnown=${leastKnown}`;
  const res = await fetch(url);
  const places = await res.json();
  renderPlaces(places);
});

