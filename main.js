import Kartyak from "./COMPONENTS/Kartyak.js";
import Szamlalo from "./COMPONENTS/Szamlalo.js";
import { konnyuLista } from "./LISTS/konnyuLista.js";
import { nehezLista } from "./LISTS/nehezLista.js";
import TemaValto from "./THEMES/temaValto.js";

let konnyuGomb = document.querySelector("#konnyuGomb");
let nehezGomb = document.querySelector("#nehezGomb");
let pElem = document.querySelector(".kartya");
let pontMezo = document.querySelector(".pontok");

// Téma váltás, és a számláló osztály példányosítása
new TemaValto();
new Szamlalo(pontMezo);

// Könnyű kérdések gombjára eventListener(click) & példányosítás
konnyuGomb.addEventListener("click", () => {
  new Kartyak(pElem, konnyuLista);
  konnyuGomb.style.display = "none";
  nehezGomb.style.display = "none";
});
// Nehéz kérdések gombjára eventListener(click) & példányosítás
nehezGomb.addEventListener("click", () => {
  new Kartyak(pElem, nehezLista);
  konnyuGomb.style.display = "none";
  nehezGomb.style.display = "none";
});
