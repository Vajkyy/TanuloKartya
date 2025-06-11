-- Adatbázis létrehozása és kiválasztása
CREATE DATABASE IF NOT EXISTS TanuloKartya CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
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
 
-- Nehéz kérdések
INSERT INTO questions (question, explanation, question_set_id) VALUES
('Mikor adták ki az Aranybullát?', 'Az Aranybullát II. András adta ki 1222-ben, a nemesség jogainak megerősítésére.', 1),
('Melyik csatában győzte le Hunyadi János a törököket 1456-ban?', '1456-ban Hunyadi János visszaverte a török ostromot Nándorfehérvárnál.', 1),
('Mikor halt ki az Árpád-ház férfiága?', 'Az Árpád-ház 1301-ben halt ki férfiágon, III. András halálával.', 1),
('Kinek az uralkodása alatt zajlott le a tatárjárás?', 'A tatárjárás 1241–42-ben történt, IV. Béla uralkodása alatt.', 1),
('Melyik magyar királyt választották német-római császárrá is?', 'Luxemburgi Zsigmond magyar királyt 1433-ban német-római császárrá koronázták.', 1),
('Melyik évben egyesült Erdély és Magyarország véglegesen?', '1699-ben a karlócai béke után Erdély hivatalosan is a Habsburg Birodalom része lett.', 1),
('Mit jelent a "Tripartitum" a magyar történelemben?', 'A Tripartitum Werbőczy István 1517-ben megjelent jogkönyve volt.', 1),
('Ki volt a magyar kormányzó 1920 és 1944 között?', 'Horthy Miklós 1920-tól 1944-ig volt Magyarország kormányzója.', 1),
('Mikor zajlott az Őszirózsás forradalom?', 'Az Őszirózsás forradalom 1918 októberében zajlott, Károlyi Mihály vezetésével.', 1),
('Melyik magyar király híres "törvényes rendet" teremtő uralkodásáról?', 'Hunyadi Mátyás erős központi hatalmat és szigorú rendet hozott létre uralkodása alatt.', 1);
 
-- Válaszok a nehéz kérdésekhez
INSERT INTO answers (question_id, answer, is_correct) VALUES
(1, '1222', TRUE), (1, '1301', FALSE), (1, '1526', FALSE), (1, '1000', FALSE),
(2, 'Mohács', FALSE), (2, 'Pozsony', FALSE), (2, 'Nándorfehérvár', TRUE), (2, 'Temesvár', FALSE),
(3, '1000', FALSE), (3, '1241', FALSE), (3, '1301', TRUE), (3, '1526', FALSE),
(4, 'IV. Béla', TRUE), (4, 'Károly Róbert', FALSE), (4, 'I. Lajos', FALSE), (4, 'III. András', FALSE),
(5, 'I. László', FALSE), (5, 'Károly Róbert', FALSE), (5, 'Zsigmond', TRUE), (5, 'II. Ulászló', FALSE),
(6, '1526', FALSE), (6, '1699', TRUE), (6, '1867', FALSE), (6, '1918', FALSE),
(7, 'Három részre szakadt ország', FALSE), (7, 'Háromszoros adó', FALSE), (7, 'Werbőczy törvénykönyve', TRUE), (7, 'Három király szövetsége', FALSE),
(8, 'Bethlen István', FALSE), (8, 'Horthy Miklós', TRUE), (8, 'Károlyi Mihály', FALSE), (8, 'Teleki Pál', FALSE),
(9, '1918', TRUE), (9, '1848', FALSE), (9, '1956', FALSE), (9, '1945', FALSE),
(10, 'Károly Róbert', FALSE), (10, 'Hunyadi Mátyás', TRUE), (10, 'I. Lajos', FALSE), (10, 'IV. Béla', FALSE);
 
-- Könnyű kérdések
INSERT INTO questions (question, explanation, question_set_id) VALUES
('Ki volt az első magyar király?', 'Szent Istvánt 1000-ben koronázták királlyá, ő volt az első magyar király.', 2),
('Mikor tört ki az 1848–49-es forradalom?', 'Az 1848–49-es forradalom 1848. március 15-én kezdődött Pesten.', 2),
('Mi történt 1956. október 23-án Magyarországon?', '1956. október 23-án kezdődött a magyar forradalom a szovjet uralom ellen.', 2),
('Mi volt a honfoglalás ideje?', 'A magyarok 896-ban foglalták el a Kárpát-medencét.', 2),
('Mikor volt a mohácsi csata?', 'A mohácsi csata 1526. augusztus 29-én volt.', 2),
('Ki volt Mátyás király apja?', 'Mátyás király apja Hunyadi János volt, a híres hadvezér.', 2);
 
-- Válaszok a könnyű kérdésekhez
INSERT INTO answers (question_id, answer, is_correct) VALUES
(11, 'Szent István', TRUE), (11, 'Mátyás király', FALSE), (11, 'IV. Béla', FALSE), (11, 'Koppány', FALSE),
(12, '1848. március 15.', TRUE), (12, '1849. október 6.', FALSE), (12, '1956. október 23.', FALSE), (12, '1789. július 14.', FALSE),
(13, 'Államalapítás', FALSE), (13, 'Forradalom kezdete', TRUE), (13, 'Honfoglalás', FALSE), (13, 'Mátyás trónra lépése', FALSE),
(14, '896', TRUE), (14, '1000', FALSE), (14, '1526', FALSE), (14, '1848', FALSE),
(15, '1514', FALSE), (15, '1526', TRUE), (15, '1703', FALSE), (15, '1848', FALSE),
(16, 'Kossuth Lajos', FALSE), (16, 'Hunyadi János', TRUE), (16, 'Árpád fejedelem', FALSE), (16, 'Géza fejedelem', FALSE);

-- Új könnyű kérdések beszúrása
INSERT INTO questions (question, explanation, question_set_id) VALUES
('Melyik város volt Magyarország fővárosa a középkorban?', 'Budapest a középkorban is fontos város volt, de Pozsony volt a főváros egy ideig.', 2),
('Ki volt az első magyar király felesége?', 'Szent István felesége Gizella volt.', 2),
('Mikor volt a magyar reformkor?', 'A magyar reformkor a 19. század első felében zajlott.', 2),
('Melyik évben lett Magyarország az Európai Unió tagja?', 'Magyarország 2004-ben csatlakozott az Európai Unióhoz.', 2);
 
-- Új válaszok beszúrása
INSERT INTO answers (question_id, answer, is_correct) VALUES
(17, 'Pozsony', TRUE), (17, 'Buda', FALSE), (17, 'Debrecen', FALSE), (17, 'Szeged', FALSE),
(18, 'Gizella', TRUE), (18, 'Ilona', FALSE), (18, 'Erzsébet', FALSE), (18, 'Anna', FALSE),
(19, '19. század első fele', TRUE), (19, '18. század vége', FALSE), (19, '20. század eleje', FALSE), (19, '17. század', FALSE),
(20, '2004', TRUE), (20, '1999', FALSE), (20, '2010', FALSE), (20, '2000', FALSE);