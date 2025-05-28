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

- **szamlaloEvent()**  
  Megkapja a Szamlalo CustomEventjéből a szamlalo értékét, majd eltárolja.

- **form()**  
  Meghívásakor megjeleníti a formot ahol nevet lehet megadni, majd beküldeni ezt. Végül meghívja az `adatMentes()` metódust.

- **adatMentes()**  
  "Küldés" gombra eseménykezelőt tesz, ami kattintásra beküldi a storage-ba az adatokat (pontok, név), ha a név mező üres alertet küld.

### Szamlalo osztály metódusai

- **counter()**  
  Fogadja Kartya osztályból a CustomEvent-et (boolean) majd ha ez `true` akkor növeli a számlálót 1-el.

- **megjelenit()**  
  CustomEventtel továbbküldi a szamlalo értékét, pontok mezőbe illeszti az eddigi elért és maximális pontokat, emellett a Leaderboard-ra is kiírja az eddigi eredményeket

### TemaValto osztály metódusai

- **szinValto()**  
  Amint teljesen betöltött az oldal, minden téma váltó gombra eseménykezelőt tesz, és az alapján állítja a CSS-t.

# TanulóKártya - Kérdés API

Ez az API egy oktató alkalmazás backend része, amely MySQL adatbázisból kérdéseket és válaszokat szolgáltat JSON formátumban.

## 📁 Fájlok

### `Database.php`

Ez az osztály az adatbázis-kapcsolatot kezeli.

#### Metódusok

- **`getConnection(): PDO`**
  - Létrehoz és visszaad egy PDO kapcsolatot a `TanuloKartya` nevű adatbázishoz.
  - Beállítja:
    - Karakterkódolás: UTF-8
    - Hibakezelés: kivételdobás
    - Alapértelmezett fetch mód: asszociatív tömb
  - Hiba esetén JSON formátumú hibaüzenettel áll le.

---

### `Kerdes.php`

Ez az osztály a kérdések és válaszok lekérdezéséért felelős.

#### Metódusok

- **`__construct(PDO $db)`**

  - Inicializálja az objektumot egy PDO adatbázis-kapcsolattal.

- **`listaAlapjan(string $listaNev): array`**
  - Lekéri az adott kérdéslista nevű `question_set` kérdéseit és válaszait.
  - Több táblából kapcsol össze adatokat:
    - `question_sets` (kérdéslista)
    - `questions` (kérdések)
    - `answers` (válaszlehetőségek)
  - Az eredmény egy tömb:
    - `kerdes`: a kérdés szövege
    - `indoklas`: magyarázat
    - `valaszok`: tömb, amely tartalmazza a válaszokat és hogy helyesek-e (`'helyes' => '1'` vagy `'0'`)

---

### `kerdesek.php`

Ez az API belépési pont.

#### Működés

- Betölti a `Database` és `Kerdes` osztályokat.
- Létrehoz egy adatbázis-kapcsolatot és egy `Kerdes` objektumot.
- Ha az URL `GET` paramétere tartalmazza a `lista` kulcsot:
  - Meghívja a `listaAlapjan()` metódust.
  - Az eredményt JSON formátumban visszaküldi.
- Ha a `lista` paraméter hiányzik:
  - Hibát küld vissza.
- Ha kivétel történik:
  - 500-as státuszkóddal JSON hibaüzenetet ad vissza.

---

## 🔗 API használata

### Kérés
