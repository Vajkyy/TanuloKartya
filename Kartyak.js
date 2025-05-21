import Kartya from "./Kartya.js";

export default class Kartyak {
  #lista;
  constructor(pElem, lista) {
    this.pElem = pElem;
    this.#lista = lista;
    this.megjelenit();
    this.szamlalo = 0;
    this.kerdesIndex = 1;
    this.gomb = document.querySelector(".ellenoriz");
    this.counter();
    this.ellenorzes();
  }
  megjelenit() {
    new Kartya(this.pElem, this.#lista[0]);
  }
  counter() {
    window.addEventListener("counter", (event) => {
      console.log(event.detail);
      if (event.detail === true) {
        this.szamlalo++;
      }
    });
  }
  ellenorzes() {
    this.gomb.addEventListener("click", () => {
      console.log(`Pontjaid: ${this.#lista.length} / ${this.szamlalo}`);
      if (this.kerdesIndex >= this.#lista.length) {
        this.pElem.innerHTML = `${this.#lista.length} / ${this.szamlalo}`;
      } else {
        this.pElem.innerHTML = "";
        new Kartya(this.pElem, this.#lista[this.kerdesIndex]);
        this.kerdesIndex++;
      }
    });
  }
}
