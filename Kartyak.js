import Kartya from "./Kartya.js";

export default class Kartyak {
  #lista;
  constructor(pElem, lista) {
    this.pElem = pElem;
    this.#lista = lista;
    this.ellenorizGomb = document.querySelector(".ellenoriz");
    this.megjelenit();
    this.szamlalo = 0;
    this.kerdesIndex = 1;
    this.gomb = document.querySelector(".ellenoriz");
    this.pontMezo = document.querySelector(".pontok");
    this.counter();
    this.ellenorzes();
    this.tabla = document.querySelector(".leaderboard");
  }
  megjelenit() {
    this.pElem.innerHTML = "";
    new Kartya(this.pElem, this.#lista[0]);
    this.ellenorizGomb.style.display = "block";
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
    this.pontMezo.innerHTML = `Pontjaid: <br> ${this.#lista.length} / ${
      this.szamlalo
    }`;
    this.gomb.addEventListener("click", () => {
      this.pontMezo.innerHTML = `Pontjaid: <br>${this.#lista.length} / ${
        this.szamlalo
      }`;
      console.log(`Pontjaid: ${this.#lista.length} / ${this.szamlalo}`);
      if (this.kerdesIndex >= this.#lista.length) {
        this.form();
      } else {
        this.pElem.innerHTML = "";
        new Kartya(this.pElem, this.#lista[this.kerdesIndex]);
        this.kerdesIndex++;
      }
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
            Pontjaid: ${this.#lista.length} / ${this.szamlalo}
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
        let pont = this.szamlalo;
        pontok.push({ nev: nev, pont: pont, maxpont: maxpont });

        localStorage.setItem("pontszamok", JSON.stringify(pontok));

        this.adatBetoltes();
        window.location.reload();
      }
    });
  }

  adatBetoltes() {
    let pontok = JSON.parse(localStorage.getItem("pontszamok")) || [];

    pontok.forEach((item) => {
      console.log(`${item.nev}: ${item.pont} pont`);
      let html = `${item.nev}: ${item.pont} / ${item.maxpont} pont`;
      this.tabla.insertAdjacentHTML("beforeend", html);
    });
  }
}
