import Kartyak from "./COMPONENTS/Kartyak.js";
import Szamlalo from "./COMPONENTS/Szamlalo.js";
import TemaValto from "./THEMES/temaValto.js";

const konnyuGomb = document.querySelector("#konnyuGomb");
const nehezGomb = document.querySelector("#nehezGomb");
const pElem = document.querySelector(".kartya");
const pontMezo = document.querySelector(".pontok");

new TemaValto();
const szamlalo = new Szamlalo(pontMezo);

async function kerdeseketBetolt(listaNev) {
    konnyuGomb.disabled = true;
    nehezGomb.disabled = true;
    pElem.innerHTML = "<div class='betoltes'>Kérdések betöltése...</div>";

    try {
        const response = await fetch(`BACKEND/kerdesek.php?lista=${encodeURIComponent(listaNev)}`);
        if (!response.ok) {
            const hibauzenet = await response.text();
            throw new Error(`HTTP ${response.status}: ${hibauzenet}`);
        }
        const adatok = await response.json();

        if (adatok.hiba) {
            throw new Error(adatok.hiba);
        }
        if (!Array.isArray(adatok) || adatok.length === 0) {
            throw new Error("Nincs elérhető kérdés ebben a listában");
        }

        new Kartyak(pElem, adatok, {
            onVege: () => {
                konnyuGomb.style.display = "block";
                nehezGomb.style.display = "block";
                konnyuGomb.disabled = false;
                nehezGomb.disabled = false;
            },
            szamlalo
        });

        konnyuGomb.style.display = "none";
        nehezGomb.style.display = "none";
    } catch (error) {
        console.error("Hiba történt:", error);
        pElem.innerHTML = `
            <div class="hiba">
                <p>${error.message}</p>
                <button onclick="location.reload()">Újrapróbálom</button>
            </div>
        `;
        konnyuGomb.disabled = false;
        nehezGomb.disabled = false;
    }
}

konnyuGomb.addEventListener("click", () => kerdeseketBetolt("konnyuLista"));
nehezGomb.addEventListener("click", () => kerdeseketBetolt("nehezLista"));
