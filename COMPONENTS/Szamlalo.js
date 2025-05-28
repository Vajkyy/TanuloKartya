export default class Szamlalo {
  constructor(pElem) {
    this.pElem = pElem;
    this.szamlalo = 0;
    this.pontMezo = document.querySelector(".pontok");
    this.gomb = document.querySelector(".ellenoriz");
    this.tabla = document.querySelector(".leaderboard");
    this.listaHossz = 0;
    this.counter();
    this.megjelenit();
    this.getSzamlalo();
  }
  counter() {
    window.addEventListener("joValasz", (event) => {
      console.log(event.detail);
      if (event.detail === true) {
        this.szamlalo++;
      }
    });
  }
  megjelenit() {
    window.addEventListener("listaHossz", (event) => {
      this.listaHossz = event.detail;
    });
    this.pontMezo.innerHTML = `Pontjaid: <br> ${this.listaHossz} / ${this.szamlalo}`;
    this.gomb.addEventListener("click", () => {
      this.pontMezo.innerHTML = `Pontjaid: <br> ${this.listaHossz} / ${this.szamlalo}`;
      window.dispatchEvent(
        new CustomEvent("szamlalo", { detail: this.szamlalo })
      );
      //console.log(this.szamlalo);
    });

    let pontok = JSON.parse(localStorage.getItem("pontszamok")) || [];
    let sortores = "<br>";

    pontok.forEach((item) => {
      console.log(`${item.nev}: ${item.pont} pont`);
      let html = `${sortores} ${item.nev}: ${item.pont} pont`;
      this.tabla.insertAdjacentHTML("beforeend", html);
    });
  }
  getSzamlalo() {
    return this.szamlalo;
  }
}
