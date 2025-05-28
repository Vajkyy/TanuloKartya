import Szamlalo from "../COMPONENTS/Szamlalo.js";

function SzamlaloNovekedesTeszt() {
  //Szamlalo péld.
  const tesztSzamlalo = new Szamlalo();
  // True (eltalált válasz) érték beküldése
  window.dispatchEvent(new CustomEvent("counter", { detail: true }));

  console.assert(
    tesztSzamlalo.getSzamlalo() === 1,
    `Hiba! Nem növekedett a számláló.\n
     Várt: ${1}
     Kapott: ${tesztSzamlalo.getSzamlalo()}`
  );
  console.log("A teszt lefutott.");
}
SzamlaloNovekedesTeszt();
