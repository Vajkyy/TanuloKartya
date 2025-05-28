import Kartya from "./Kartya.js";

export default class Kartyak {
  #lista;
  constructor(pElem, lista) {
    this.pElem = pElem;
    this.#lista = [...lista].sort(() => Math.random() - 0.5);
    this.ellenorizGomb = document.querySelector(".ellenoriz");
    this.pontMezo = document.querySelector(".pontok");
    this.pontok = 0;
    this.megjelenit();
    this.kerdesIndex = 1;

    this.szamlaloEvent();
    this.gomb = document.querySelector(".ellenoriz");
    this.ellenorzes();
    this.tabla = document.querySelector(".leaderboard");
  }
  megjelenit() {
    this.pElem.innerHTML = "";
    new Kartya(this.pElem, this.#lista[0]);
    this.ellenorizGomb.style.display = "block";
    this.pontMezo.innerHTML = `Pontjaid: <br> ${this.#lista.length} / ${
      this.pontok
    }`;
  }
  ellenorzes() {
    //console.log(this.#lista.length);
    this.gomb.addEventListener("click", () => {
      if (this.kerdesIndex >= this.#lista.length) {
        this.form();
      } else {
        this.pElem.innerHTML = "";
        new Kartya(this.pElem, this.#lista[this.kerdesIndex]);
        this.kerdesIndex++;
      }
    });
  }
  szamlaloEvent() {
    window.dispatchEvent(
      new CustomEvent("listaHossz", { detail: this.#lista.length })
    );

    window.addEventListener("szamlalo", (event) => {
      this.pontok = event.detail;
    });
  }
  form() {
    this.pElem.innerHTML = "";
    this.pontMezo.innerHTML = "";
    this.ellenorizGomb.style.display = "none";
    this.pontMezo.style.display = "none";
    let html = `
        <div class="mentes">
                <h3>Pontjaid mentése</h3>
            <label for="nev">Név:</label>
            <input type="text" id="pont" required/><br>
            Pontjaid: ${this.#lista.length} / ${this.pontok}
            <button id="kuld">Küldés</button>
        </div>
    `;
    this.pElem.insertAdjacentHTML("beforeend", html);
    this.adatMentes();
  }
  adatMentes() {
    let kuldGomb = document.querySelector("#kuld");
    kuldGomb.addEventListener("click", () => {
      let pontok = JSON.parse(localStorage.getItem("pontszamok")) || [];
      let maxpont = this.#lista.length;
      let nev = document.querySelector("#pont").value;

      if (!nev.trim()) {
        alert("Kérlek, add meg a neved!");
      } else {
        let pont = this.pontok;
        pontok.push({ nev: nev, pont: pont, maxpont: maxpont });

        localStorage.setItem("pontszamok", JSON.stringify(pontok));

        window.location.reload();
      }
    });
  }
}
