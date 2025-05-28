export default class Kartya {
  #kerdesObj;
  #sorrend;
  constructor(pElem, kerdesObj) {
    this.pElem = pElem;
    this.#kerdesObj = kerdesObj;
    this.#sorrend = this.kever();
    this.megjelenit();
    this.gombok = this.pElem.querySelectorAll(".kerdes:last-child .valasz");
    this.joE = false;
    this.ellenoriz();
  }

  megjelenit() {
    let html = `
      <div class="card kerdes">
        <h1>${this.#kerdesObj.kerdes}</h1>
        <div class="card-font">
          ${this.#sorrend.map((valaszIdx, i) => `
            <button class="valasz" value="${i}">
              ${this.#kerdesObj.valaszok[valaszIdx].valasz}
            </button>
          `).join("")}
        </div>
        <div class="card-back">
          <p>${this.#kerdesObj.indoklas || ""}</p>
        </div>
      </div>
    `;
    this.pElem.insertAdjacentHTML("beforeend", html);
  }

  kever() {
    const n = this.#kerdesObj.valaszok.length;
    const tomb = [];
    while (tomb.length < n) {
      const i = Math.floor(Math.random() * n);
      if (!tomb.includes(i)) tomb.push(i);
    }
    return tomb;
  }

  ellenoriz() {
    this.gombok.forEach((gomb) => {
      gomb.addEventListener("click", () => {
        const valaszIndex = this.#sorrend[parseInt(gomb.value)];
        const valaszObj = this.#kerdesObj.valaszok[valaszIndex];

        this.joE = valaszObj.helyes === "1" || valaszObj.helyes === 1;

        this.gombok.forEach(g => {
          g.disabled = true;
          g.style.backgroundColor = "pink";
        });

        const helyesIndex = this.#sorrend.findIndex(
          idx => this.#kerdesObj.valaszok[idx].helyes === "1" || this.#kerdesObj.valaszok[idx].helyes === 1
        );
        if (helyesIndex !== -1) {
          this.gombok[helyesIndex].style.backgroundColor = "lightgreen";
        }

        const card = this.pElem.querySelector(".card");
        card.addEventListener("click", function () {
          card.classList.toggle("show");
        });

        window.dispatchEvent(new CustomEvent("counter", { detail: this.joE }));
      });
    });
  }
}
