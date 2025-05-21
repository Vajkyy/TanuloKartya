import Kartyak from "./Kartyak.js";
import { konnyuLista } from "./konnyuLista.js";
import { nehezLista } from "./nehezLista.js";

let konnyuGomb = document.querySelector("#konnyuGomb");
let nehezGomb = document.querySelector("#nehezGomb");
let pElem = document.querySelector(".kartya");
let tabla = document.querySelector(".leaderboard");

console.log(konnyuGomb);
konnyuGomb.addEventListener("click", () => {
  new Kartyak(pElem, konnyuLista);
  konnyuGomb.style.display = "none";
  nehezGomb.style.display = "none";
});

nehezGomb.addEventListener("click", () => {
  new Kartyak(pElem, nehezLista);
  konnyuGomb.style.display = "none";
  nehezGomb.style.display = "none";
});

let pontok = JSON.parse(localStorage.getItem("pontszamok")) || [];
let sortores = "<br>";

pontok.forEach((item) => {
  console.log(`${item.nev}: ${item.pont} pont`);
  let html = `${sortores} ${item.nev}: ${item.pont} pont`;
  tabla.insertAdjacentHTML("beforeend", html);
});
