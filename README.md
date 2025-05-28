## Osztályok: Kartya, Kartyak

### Kartya osztály metódusai

- **megjelenit()**  
  Létrehoz egy DOM elemet, amely tartalmazza a kérdést és a válaszlehetőségeket, majd ezt hozzáadja a megadott `pElem` szülőelemhez.

- **kever()**  
  Létrehoz egy új tömböt, amelybe a konstruktorban megkapott válaszokat véletlenszerű sorrendben keveri, majd ezt a tömböt visszaadja.

- **ellenoriz()**  
  Az összes válasz gombhoz eseménykezelőt rendel, amely beállítja az "id" paramétert a kiválasztott válasz értékére, majd ellenőrzi, hogy a válasz helyes-e.
