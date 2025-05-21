export default class Kartya {
  #lista;
  #sorrend;
  constructor(pElem, lista) {
    this.pElem = pElem;
    this.#lista = lista;
    this.#sorrend = this.kever();
    this.megjelenit();
    this.id = null;
    this.gombok = this.pElem.querySelectorAll(".kerdes:last-child .valasz");
    this.joE = false;
    this.ellenoriz();
  }

  megjelenit() {
    let html = `
                <div class="card kerdes">
                    <h1>${this.#lista.kerdes}</h1>
                    <div class="card-font">
                        <button class="valasz" value=0>${
                          this.#lista.valaszok[this.#sorrend[0]]
                        }</button>
                        <button class="valasz" value=1>${
                          this.#lista.valaszok[this.#sorrend[1]]
                        }</button>
                        <button class="valasz" value=2>${
                          this.#lista.valaszok[this.#sorrend[2]]
                        }</button>
                        <button class="valasz" value=3>${
                          this.#lista.valaszok[this.#sorrend[3]]
                        }</button>
                    </div>
                    <div class="card-back">
                        <p>${this.#lista.magyarazat}</p>
                    </div>
                </div>
        `;
    this.pElem.insertAdjacentHTML("beforeend", html);
  }

  kever() {
    let tomb = [];
    while (tomb.length < this.#lista.valaszok.length) {
      const i = Math.floor(Math.random() * this.#lista.valaszok.length);
      if (!tomb.includes(i)) {
        tomb.push(i);
      }
    }

    return tomb;
  }

  ellenoriz() {
    this.gombok.forEach((gomb) => {
      gomb.addEventListener("click", () => {
        this.id = parseInt(gomb.value);

        if (this.#sorrend[this.id] === this.#lista.helyesek[0]) {
          this.joE = true;
        }

        this.gombok.forEach(
          (g) => ((g.disabled = true), (g.style.backgroundColor = "pink"))
        );

        const helyesIndex = this.#sorrend.findIndex(
          (valaszIndex) => valaszIndex === this.#lista.helyesek[0]
        );

        this.gombok[helyesIndex].style.backgroundColor = "lightgreen";

        const card = document.querySelector(".card");
        card.addEventListener("click", function () {
          card.classList.toggle("show");
        });

        window.dispatchEvent(new CustomEvent("counter", { detail: this.joE }));
      });
    });
  }
}
