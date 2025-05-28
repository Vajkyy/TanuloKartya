export default class TemaValto {
  constructor() {
    this.gombok = document.querySelectorAll(".temaValtasGomb button");
    this.szinValto();
  }
  szinValto() {
    document.addEventListener("DOMContentLoaded", () => {
      this.gombok.forEach((gomb) => {
        gomb.addEventListener("click", () => {
          const szam = gomb.dataset.tema;
          document.body.className = `tema${szam}`;
        });
      });
    });
  }
}
