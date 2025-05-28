create database TanuloKartya

use TanuloKartya

CREATE TABLE question_sets (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE questions (
  id INT IDENTITY(1,1) PRIMARY KEY,
  question NVARCHAR(MAX) NOT NULL,
  explanation NVARCHAR(MAX) NOT NULL,
  question_set_id INT NOT NULL,
  FOREIGN KEY (question_set_id) REFERENCES question_sets(id)
);

CREATE TABLE answers (
  id INT IDENTITY(1,1) PRIMARY KEY,
  question_id INT NOT NULL,
  answer NVARCHAR(MAX) NOT NULL,
  is_correct BIT NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO question_sets (name) VALUES ('nehezLista'), ('konnyuLista');
-- nehezLista id = 1, konnyuLista id = 2 lesz

-- 1. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor adták ki az Aranybullát?', N'Az Aranybullát II. András adta ki 1222-ben, a nemesség jogainak megerõsítésére.', 1);
-- id = 1
INSERT INTO answers (question_id, answer, is_correct) VALUES
(1, N'1222', 1),
(1, N'1301', 0),
(1, N'1526', 0),
(1, N'1000', 0);

-- 2. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik csatában gyõzte le Hunyadi János a törököket 1456-ban?', N'1456-ban Hunyadi János visszaverte a török ostromot Nándorfehérvárnál.', 1);
-- id = 2
INSERT INTO answers (question_id, answer, is_correct) VALUES
(2, N'Mohács', 0),
(2, N'Pozsony', 0),
(2, N'Nándorfehérvár', 1),
(2, N'Temesvár', 0);

-- 3. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor halt ki az Árpád-ház férfiága?', N'Az Árpád-ház 1301-ben halt ki férfiágon, III. András halálával.', 1);
-- id = 3
INSERT INTO answers (question_id, answer, is_correct) VALUES
(3, N'1000', 0),
(3, N'1241', 0),
(3, N'1301', 1),
(3, N'1526', 0);

-- 4. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Kinek az uralkodása alatt zajlott le a tatárjárás?', N'A tatárjárás 1241–42-ben történt, IV. Béla uralkodása alatt.', 1);
-- id = 4
INSERT INTO answers (question_id, answer, is_correct) VALUES
(4, N'IV. Béla', 1),
(4, N'Károly Róbert', 0),
(4, N'I. Lajos', 0),
(4, N'III. András', 0);

-- 5. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik magyar királyt választották német-római császárrá is?', N'Luxemburgi Zsigmond magyar király 1433-ban német-római császárrá koronázták.', 1);
-- id = 5
INSERT INTO answers (question_id, answer, is_correct) VALUES
(5, N'I. László', 0),
(5, N'Károly Róbert', 0),
(5, N'Zsigmond', 1),
(5, N'II. Ulászló', 0);

-- 6. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik évben egyesült Erdély és Magyarország véglegesen?', N'1699-ben a karlócai béke után Erdély hivatalosan is a Habsburg Birodalom része lett.', 1);
-- id = 6
INSERT INTO answers (question_id, answer, is_correct) VALUES
(6, N'1526', 0),
(6, N'1699', 1),
(6, N'1867', 0),
(6, N'1918', 0);

-- 7. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mit jelent a ''Tripartitum'' a magyar történelemben?', N'A Tripartitum Werbõczy István 1517-ben megjelent jogkönyve volt.', 1);
-- id = 7
INSERT INTO answers (question_id, answer, is_correct) VALUES
(7, N'Három részre szakadt ország', 0),
(7, N'Háromszoros adó', 0),
(7, N'Werbõczy törvénykönyve', 1),
(7, N'Három király szövetsége', 0);

-- 8. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki volt a magyar kormányzó 1920 és 1944 között?', N'Horthy Miklós 1920-tól 1944-ig volt Magyarország kormányzója.', 1);
-- id = 8
INSERT INTO answers (question_id, answer, is_correct) VALUES
(8, N'Bethlen István', 0),
(8, N'Horthy Miklós', 1),
(8, N'Károlyi Mihály', 0),
(8, N'Teleki Pál', 0);

-- 9. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor zajlott az õszirózsás forradalom?', N'Az õszirózsás forradalom 1918 októberében zajlott, Károlyi Mihály vezetésével.', 1);
-- id = 9
INSERT INTO answers (question_id, answer, is_correct) VALUES
(9, N'1918', 1),
(9, N'1848', 0),
(9, N'1956', 0),
(9, N'1945', 0);

-- 10. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik magyar király híres ''törvényes rendet'' teremtõ uralkodásáról?', N'Hunyadi Mátyás erõs központi hatalmat és szigorú rendet hozott létre uralkodása alatt.', 1);
-- id = 10
INSERT INTO answers (question_id, answer, is_correct) VALUES
(10, N'Károly Róbert', 0),
(10, N'Hunyadi Mátyás', 1),
(10, N'I. Lajos', 0),
(10, N'IV. Béla', 0);



-- 1. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki volt az elsõ magyar király?', N'Szent Istvánt 1000-ben koronázták királlyá, õ volt az elsõ magyar király.', 2);
-- id = 11
INSERT INTO answers (question_id, answer, is_correct) VALUES
(11, N'Szent István', 1),
(11, N'Mátyás király', 0),
(11, N'IV. Béla', 0),
(11, N'Koppány', 0);

-- 2. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor tört ki az 1848–49-es forradalom?', N'Az 1848–49-es forradalom 1848. március 15-én kezdõdött Pesten.', 2);
-- id = 12
INSERT INTO answers (question_id, answer, is_correct) VALUES
(12, N'1848. március 15.', 1),
(12, N'1849. október 6.', 0),
(12, N'1956. október 23.', 0),
(12, N'1789. július 14.', 0);

-- 3. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mi történt 1956. október 23-án Magyarországon?', N'1956. október 23-án kezdõdött a magyar forradalom a szovjet uralom ellen.', 2);
-- id = 13
INSERT INTO answers (question_id, answer, is_correct) VALUES
(13, N'Államalapítás', 0),
(13, N'Forradalom kezdete', 1),
(13, N'Honfoglalás', 0),
(13, N'Mátyás trónra lépése', 0);

-- 4. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mi volt a honfoglalás ideje?', N'A magyarok 896-ban foglalták el a Kárpát-medencét.', 2);
-- id = 14
INSERT INTO answers (question_id, answer, is_correct) VALUES
(14, N'896', 1),
(14, N'1000', 0),
(14, N'1526', 0),
(14, N'1848', 0);

-- 5. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor volt a mohácsi csata?', N'A mohácsi csata 1526. augusztus 29-én volt.', 2);
-- id = 15
INSERT INTO answers (question_id, answer, is_correct) VALUES
(15, N'1514', 0),
(15, N'1526', 1),
(15, N'1703', 0),
(15, N'1848', 0);

-- 6. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki volt Mátyás király apja?', N'Mátyás király apja Hunyadi János volt, a híres hadvezér.', 2);
-- id = 16
INSERT INTO answers (question_id, answer, is_correct) VALUES
(16, N'Kossuth Lajos', 0),
(16, N'Hunyadi János', 1),
(16, N'Árpád fejedelem', 0),
(16, N'Szent László', 0);

-- 7. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik város lett fõváros 1873-ban?', N'Budapest 1873-ban jött létre Buda, Pest és Óbuda egyesítésével.', 2);
-- id = 17
INSERT INTO answers (question_id, answer, is_correct) VALUES
(17, N'Kassa', 0),
(17, N'Pozsony', 0),
(17, N'Budapest', 1),
(17, N'Debrecen', 0);

-- 8. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik nép vezére volt Attila?', N'Attila a hunok vezére volt az 5. században.', 2);
-- id = 18
INSERT INTO answers (question_id, answer, is_correct) VALUES
(18, N'Hun', 1),
(18, N'Magyar', 0),
(18, N'Germán', 0),
(18, N'Római', 0);

-- 9. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki vezette a magyarokat a honfoglalás idején?', N'Árpád fejedelem vezette a magyar törzseket a Kárpát-medencébe 896 körül.', 2);
-- id = 19
INSERT INTO answers (question_id, answer, is_correct) VALUES
(19, N'Szent István', 0),
(19, N'Koppány', 0),
(19, N'Árpád', 1),
(19, N'IV. Béla', 0);

-- 10. kérdés
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor koronázták királlyá Szent Istvánt?', N'Szent Istvánt 1000 karácsonyán vagy 1001. január 1-jén koronázták királlyá.', 2);
-- id = 20
INSERT INTO answers (question_id, answer, is_correct) VALUES
(20, N'896', 0),
(20, N'1000', 1),
(20, N'1222', 0),
(20, N'1301', 0);


