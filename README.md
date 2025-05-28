## Osztályok: Kartya, Kartyak, Szamlalo, TemaValto

### Kartya osztály metódusai

- **megjelenit()**  
  Létrehoz egy DOM elemet, amely tartalmazza a kérdést és a válaszlehetőségeket, majd ezt hozzáadja a megadott `pElem` szülőelemhez.

- **kever()**  
  Létrehoz egy új tömböt, amelybe a konstruktorban megkapott válaszokat véletlenszerű sorrendben keveri, majd ezt a tömböt visszaadja.

- **ellenoriz()**  
  Az összes válasz gombhoz eseménykezelőt rendel, amely beállítja az "id" paramétert a kiválasztott válasz értékére, majd ellenőrzi, hogy a válasz helyes-e és ezt CustomEvent-el tovább küldi.

### Kartyak osztály metódusai

- **megjelenit()**  
  Példányosít egy Kartya-t és megjeleníti a `Következő` gombot

- **ellenorzes()**  
  `Következő` gombra tesz egy eseménykezelőt, ami ellenőrzi hogy hányadik kérdésnél jár, ha az utolsónál, meghívja a `form()` metódust, ellenkező esetben új kérdést jelenít meg.

- **form()**  
  Meghívásakor megjeleníti a formot ahol nevet lehet megadni, majd beküldeni ezt. Végül meghívja az `adatMentes()` metódust.

- **adatMentes()**  
  "Küldés" gombra eseménykezelőt tesz, ami kattintásra beküldi a storage-ba az adatokat (pontok, név), ha a név mező üres alertet küld.

### Szamlalo osztály metódusai

- **counter()**  
  Fogadja Kartya osztályból a CustomEvent-et (boolean) majd ha ez `true` akkor növeli a számlálót 1-el.

- **megjelenit()**  
  Pontok mezőbe illeszti az eddigi elért és maximális pontokat, emellett a Leaderboard-ra is kiírja az eddigi eredményeket

### TemaValto osztály metódusai

- **szinValto()**  
  Amint teljesen betöltött az oldal, minden téma váltó gombra eseménykezelőt tesz, és az alapján állítja a CSS-t.
