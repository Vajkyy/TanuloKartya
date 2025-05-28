-- Adatbázis létrehozása és kiválasztása
CREATE DATABASE IF NOT EXISTS TanuloKartya;
USE TanuloKartya;

-- Táblák létrehozása
CREATE TABLE question_sets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  question VARCHAR(1000) NOT NULL,
  explanation VARCHAR(1000) NOT NULL,
  question_set_id INT NOT NULL,
  FOREIGN KEY (question_set_id) REFERENCES question_sets(id)
) ENGINE=InnoDB;

CREATE TABLE answers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  question_id INT NOT NULL,
  answer VARCHAR(1000) NOT NULL,
  is_correct BOOLEAN NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id)
) ENGINE=InnoDB;

-- Adatok beszúrása
INSERT INTO question_sets (name) VALUES ('nehezLista'), ('konnyuLista');

-- 1. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor adták ki az Aranybullát?', 'Az Aranybullát II. András adta ki 1222-ben, a nemesség jogainak megerõsítésére.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(1, '1222', TRUE),
(1, '1301', FALSE),
(1, '1526', FALSE),
(1, '1000', FALSE);

-- 2. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik csatában gyõzte le Hunyadi János a törököket 1456-ban?', '1456-ban Hunyadi János visszaverte a török ostromot Nándorfehérvárnál.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(2, 'Mohács', FALSE),
(2, 'Pozsony', FALSE),
(2, 'Nándorfehérvár', TRUE),
(2, 'Temesvár', FALSE);

-- 3. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor halt ki az Árpád-ház férfiága?', 'Az Árpád-ház 1301-ben halt ki férfiágon, III. András halálával.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(3, '1000', FALSE),
(3, '1241', FALSE),
(3, '1301', TRUE),
(3, '1526', FALSE);

-- 4. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Kinek az uralkodása alatt zajlott le a tatárjárás?', 'A tatárjárás 1241–42-ben történt, IV. Béla uralkodása alatt.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(4, 'IV. Béla', TRUE),
(4, 'Károly Róbert', FALSE),
(4, 'I. Lajos', FALSE),
(4, 'III. András', FALSE);

-- 5. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik magyar királyt választották német-római császárrá is?', 'Luxemburgi Zsigmond magyar király 1433-ban német-római császárrá koronázták.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(5, 'I. László', FALSE),
(5, 'Károly Róbert', FALSE),
(5, 'Zsigmond', TRUE),
(5, 'II. Ulászló', FALSE);

-- 6. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik évben egyesült Erdély és Magyarország véglegesen?', '1699-ben a karlócai béke után Erdély hivatalosan is a Habsburg Birodalom része lett.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(6, '1526', FALSE),
(6, '1699', TRUE),
(6, '1867', FALSE),
(6, '1918', FALSE);

-- 7. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mit jelent a ''Tripartitum'' a magyar történelemben?', 'A Tripartitum Werbõczy István 1517-ben megjelent jogkönyve volt.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(7, 'Három részre szakadt ország', FALSE),
(7, 'Háromszoros adó', FALSE),
(7, 'Werbõczy törvénykönyve', TRUE),
(7, 'Három király szövetsége', FALSE);

-- 8. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki volt a magyar kormányzó 1920 és 1944 között?', 'Horthy Miklós 1920-tól 1944-ig volt Magyarország kormányzója.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(8, 'Bethlen István', FALSE),
(8, 'Horthy Miklós', TRUE),
(8, 'Károlyi Mihály', FALSE),
(8, 'Teleki Pál', FALSE);

-- 9. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor zajlott az õszirózsás forradalom?', 'Az õszirózsás forradalom 1918 októberében zajlott, Károlyi Mihály vezetésével.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(9, '1918', TRUE),
(9, '1848', FALSE),
(9, '1956', FALSE),
(9, '1945', FALSE);

-- 10. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik magyar király híres ''törvényes rendet'' teremtõ uralkodásáról?', 'Hunyadi Mátyás erõs központi hatalmat és szigorú rendet hozott létre uralkodása alatt.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(10, 'Károly Róbert', FALSE),
(10, 'Hunyadi Mátyás', TRUE),
(10, 'I. Lajos', FALSE),
(10, 'IV. Béla', FALSE);

-- 1. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki volt az elsõ magyar király?', 'Szent Istvánt 1000-ben koronázták királlyá, õ volt az elsõ magyar király.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(11, 'Szent István', TRUE),
(11, 'Mátyás király', FALSE),
(11, 'IV. Béla', FALSE),
(11, 'Koppány', FALSE);

-- 2. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor tört ki az 1848–49-es forradalom?', 'Az 1848–49-es forradalom 1848. március 15-én kezdõdött Pesten.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(12, '1848. március 15.', TRUE),
(12, '1849. október 6.', FALSE),
(12, '1956. október 23.', FALSE),
(12, '1789. július 14.', FALSE);

-- 3. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mi történt 1956. október 23-án Magyarországon?', '1956. október 23-án kezdõdött a magyar forradalom a szovjet uralom ellen.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(13, 'Államalapítás', FALSE),
(13, 'Forradalom kezdete', TRUE),
(13, 'Honfoglalás', FALSE),
(13, 'Mátyás trónra lépése', FALSE);

-- 4. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mi volt a honfoglalás ideje?', 'A magyarok 896-ban foglalták el a Kárpát-medencét.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(14, '896', TRUE),
(14, '1000', FALSE),
(14, '1526', FALSE),
(14, '1848', FALSE);

-- 5. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor volt a mohácsi csata?', 'A mohácsi csata 1526. augusztus 29-én volt.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(15, '1514', FALSE),
(15, '1526', TRUE),
(15, '1703', FALSE),
(15, '1848', FALSE);

-- 6. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki volt Mátyás király apja?', 'Mátyás király apja Hunyadi János volt, a híres hadvezér.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(16, 'Kossuth Lajos', FALSE),
(16, 'Hunyadi János', TRUE),
(16, 'Árpád fejedelem', FALSE),
(16, 'Szent László', FALSE);

-- 7. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik város lett fõváros 1873-ban?', 'Budapest 1873-ban jött létre Buda, Pest és Óbuda egyesítésével.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(17, 'Kassa', FALSE),
(17, 'Pozsony', FALSE),
(17, 'Budapest', TRUE),
(17, 'Debrecen', FALSE);

-- 8. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik nép vezére volt Attila?', 'Attila a hunok vezére volt az 5. században.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(18, 'Hun', TRUE),
(18, 'Magyar', FALSE),
(18, 'Germán', FALSE),
(18, 'Római', FALSE);

-- 9. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki vezette a magyarokat a honfoglalás idején?', 'Árpád fejedelem vezette a magyar törzseket a Kárpát-medencébe 896 körül.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(19, 'Szent István', FALSE),
(19, 'Koppány', FALSE),
(19, 'Árpád', TRUE),
(19, 'IV. Béla', FALSE);

-- 10. kérdés (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor koronázták királlyá Szent Istvánt?', 'Szent Istvánt 1000 karácsonyán vagy 1001. január 1-jén koronázták királlyá.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(20, '896', FALSE),
(20, '1000', TRUE),
(20, '1222', FALSE),
(20, '1301', FALSE);
