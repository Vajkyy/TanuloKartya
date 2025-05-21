import Kartyak from "./Kartyak.js";
import { konnyuLista } from "./konnyuLista.js";
import { nehezLista } from "./nehezLista.js";

let konnyuGomb = document.querySelector("#konnyuGomb");
let nehezGomb = document.querySelector("#nehezGomb");
let pElem = document.querySelector(".kartya");

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
