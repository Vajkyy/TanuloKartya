export default class Kartya {
  #lista;
  constructor(pElem, lista) {
    this.pElem = pElem;
    this.#lista = lista;
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
                          this.#lista.valaszok[0]
                        }</button>
                        <button class="valasz" value=1>${
                          this.#lista.valaszok[1]
                        }</button>
                        <button class="valasz" value=2>${
                          this.#lista.valaszok[2]
                        }</button>
                        <button class="valasz" value=3>${
                          this.#lista.valaszok[3]
                        }</button>
                    </div>
                    <div class="card-back">
                        <p>${this.#lista.magyarazat}</p>
                    </div>
                </div>
        `;
    this.pElem.insertAdjacentHTML("beforeend", html);
  }
  ellenoriz() {
    this.gombok.forEach((gomb) => {
      gomb.addEventListener("click", () => {
        this.id = parseInt(gomb.value);
        console.log(this.id);
        if (this.id === this.#lista.helyesek[0]) {
          this.joE = true;
        }
        this.gombok.forEach((g) => (g.disabled = true));
        const card = document.querySelector(".card");

        card.addEventListener("click", function () {
          card.classList.toggle("show");
        });
        // let html = `<p>${this.#lista.magyarazat}</p>`;
        // this.pElem.insertAdjacentHTML("beforeend", html);
        window.dispatchEvent(new CustomEvent("counter", { detail: this.joE }));
      });
    });
  }
}
