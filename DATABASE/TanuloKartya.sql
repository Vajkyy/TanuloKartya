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

-- 1. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor adt�k ki az Aranybull�t?', N'Az Aranybull�t II. Andr�s adta ki 1222-ben, a nemess�g jogainak meger�s�t�s�re.', 1);
-- id = 1
INSERT INTO answers (question_id, answer, is_correct) VALUES
(1, N'1222', 1),
(1, N'1301', 0),
(1, N'1526', 0),
(1, N'1000', 0);

-- 2. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik csat�ban gy�zte le Hunyadi J�nos a t�r�k�ket 1456-ban?', N'1456-ban Hunyadi J�nos visszaverte a t�r�k ostromot N�ndorfeh�rv�rn�l.', 1);
-- id = 2
INSERT INTO answers (question_id, answer, is_correct) VALUES
(2, N'Moh�cs', 0),
(2, N'Pozsony', 0),
(2, N'N�ndorfeh�rv�r', 1),
(2, N'Temesv�r', 0);

-- 3. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor halt ki az �rp�d-h�z f�rfi�ga?', N'Az �rp�d-h�z 1301-ben halt ki f�rfi�gon, III. Andr�s hal�l�val.', 1);
-- id = 3
INSERT INTO answers (question_id, answer, is_correct) VALUES
(3, N'1000', 0),
(3, N'1241', 0),
(3, N'1301', 1),
(3, N'1526', 0);

-- 4. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Kinek az uralkod�sa alatt zajlott le a tat�rj�r�s?', N'A tat�rj�r�s 1241�42-ben t�rt�nt, IV. B�la uralkod�sa alatt.', 1);
-- id = 4
INSERT INTO answers (question_id, answer, is_correct) VALUES
(4, N'IV. B�la', 1),
(4, N'K�roly R�bert', 0),
(4, N'I. Lajos', 0),
(4, N'III. Andr�s', 0);

-- 5. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik magyar kir�lyt v�lasztott�k n�met-r�mai cs�sz�rr� is?', N'Luxemburgi Zsigmond magyar kir�ly 1433-ban n�met-r�mai cs�sz�rr� koron�zt�k.', 1);
-- id = 5
INSERT INTO answers (question_id, answer, is_correct) VALUES
(5, N'I. L�szl�', 0),
(5, N'K�roly R�bert', 0),
(5, N'Zsigmond', 1),
(5, N'II. Ul�szl�', 0);

-- 6. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik �vben egyes�lt Erd�ly �s Magyarorsz�g v�glegesen?', N'1699-ben a karl�cai b�ke ut�n Erd�ly hivatalosan is a Habsburg Birodalom r�sze lett.', 1);
-- id = 6
INSERT INTO answers (question_id, answer, is_correct) VALUES
(6, N'1526', 0),
(6, N'1699', 1),
(6, N'1867', 0),
(6, N'1918', 0);

-- 7. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mit jelent a ''Tripartitum'' a magyar t�rt�nelemben?', N'A Tripartitum Werb�czy Istv�n 1517-ben megjelent jogk�nyve volt.', 1);
-- id = 7
INSERT INTO answers (question_id, answer, is_correct) VALUES
(7, N'H�rom r�szre szakadt orsz�g', 0),
(7, N'H�romszoros ad�', 0),
(7, N'Werb�czy t�rv�nyk�nyve', 1),
(7, N'H�rom kir�ly sz�vets�ge', 0);

-- 8. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki volt a magyar korm�nyz� 1920 �s 1944 k�z�tt?', N'Horthy Mikl�s 1920-t�l 1944-ig volt Magyarorsz�g korm�nyz�ja.', 1);
-- id = 8
INSERT INTO answers (question_id, answer, is_correct) VALUES
(8, N'Bethlen Istv�n', 0),
(8, N'Horthy Mikl�s', 1),
(8, N'K�rolyi Mih�ly', 0),
(8, N'Teleki P�l', 0);

-- 9. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor zajlott az �szir�zs�s forradalom?', N'Az �szir�zs�s forradalom 1918 okt�ber�ben zajlott, K�rolyi Mih�ly vezet�s�vel.', 1);
-- id = 9
INSERT INTO answers (question_id, answer, is_correct) VALUES
(9, N'1918', 1),
(9, N'1848', 0),
(9, N'1956', 0),
(9, N'1945', 0);

-- 10. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik magyar kir�ly h�res ''t�rv�nyes rendet'' teremt� uralkod�s�r�l?', N'Hunyadi M�ty�s er�s k�zponti hatalmat �s szigor� rendet hozott l�tre uralkod�sa alatt.', 1);
-- id = 10
INSERT INTO answers (question_id, answer, is_correct) VALUES
(10, N'K�roly R�bert', 0),
(10, N'Hunyadi M�ty�s', 1),
(10, N'I. Lajos', 0),
(10, N'IV. B�la', 0);



-- 1. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki volt az els� magyar kir�ly?', N'Szent Istv�nt 1000-ben koron�zt�k kir�lly�, � volt az els� magyar kir�ly.', 2);
-- id = 11
INSERT INTO answers (question_id, answer, is_correct) VALUES
(11, N'Szent Istv�n', 1),
(11, N'M�ty�s kir�ly', 0),
(11, N'IV. B�la', 0),
(11, N'Kopp�ny', 0);

-- 2. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor t�rt ki az 1848�49-es forradalom?', N'Az 1848�49-es forradalom 1848. m�rcius 15-�n kezd�d�tt Pesten.', 2);
-- id = 12
INSERT INTO answers (question_id, answer, is_correct) VALUES
(12, N'1848. m�rcius 15.', 1),
(12, N'1849. okt�ber 6.', 0),
(12, N'1956. okt�ber 23.', 0),
(12, N'1789. j�lius 14.', 0);

-- 3. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mi t�rt�nt 1956. okt�ber 23-�n Magyarorsz�gon?', N'1956. okt�ber 23-�n kezd�d�tt a magyar forradalom a szovjet uralom ellen.', 2);
-- id = 13
INSERT INTO answers (question_id, answer, is_correct) VALUES
(13, N'�llamalap�t�s', 0),
(13, N'Forradalom kezdete', 1),
(13, N'Honfoglal�s', 0),
(13, N'M�ty�s tr�nra l�p�se', 0);

-- 4. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mi volt a honfoglal�s ideje?', N'A magyarok 896-ban foglalt�k el a K�rp�t-medenc�t.', 2);
-- id = 14
INSERT INTO answers (question_id, answer, is_correct) VALUES
(14, N'896', 1),
(14, N'1000', 0),
(14, N'1526', 0),
(14, N'1848', 0);

-- 5. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor volt a moh�csi csata?', N'A moh�csi csata 1526. augusztus 29-�n volt.', 2);
-- id = 15
INSERT INTO answers (question_id, answer, is_correct) VALUES
(15, N'1514', 0),
(15, N'1526', 1),
(15, N'1703', 0),
(15, N'1848', 0);

-- 6. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki volt M�ty�s kir�ly apja?', N'M�ty�s kir�ly apja Hunyadi J�nos volt, a h�res hadvez�r.', 2);
-- id = 16
INSERT INTO answers (question_id, answer, is_correct) VALUES
(16, N'Kossuth Lajos', 0),
(16, N'Hunyadi J�nos', 1),
(16, N'�rp�d fejedelem', 0),
(16, N'Szent L�szl�', 0);

-- 7. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik v�ros lett f�v�ros 1873-ban?', N'Budapest 1873-ban j�tt l�tre Buda, Pest �s �buda egyes�t�s�vel.', 2);
-- id = 17
INSERT INTO answers (question_id, answer, is_correct) VALUES
(17, N'Kassa', 0),
(17, N'Pozsony', 0),
(17, N'Budapest', 1),
(17, N'Debrecen', 0);

-- 8. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Melyik n�p vez�re volt Attila?', N'Attila a hunok vez�re volt az 5. sz�zadban.', 2);
-- id = 18
INSERT INTO answers (question_id, answer, is_correct) VALUES
(18, N'Hun', 1),
(18, N'Magyar', 0),
(18, N'Germ�n', 0),
(18, N'R�mai', 0);

-- 9. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Ki vezette a magyarokat a honfoglal�s idej�n?', N'�rp�d fejedelem vezette a magyar t�rzseket a K�rp�t-medenc�be 896 k�r�l.', 2);
-- id = 19
INSERT INTO answers (question_id, answer, is_correct) VALUES
(19, N'Szent Istv�n', 0),
(19, N'Kopp�ny', 0),
(19, N'�rp�d', 1),
(19, N'IV. B�la', 0);

-- 10. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES (N'Mikor koron�zt�k kir�lly� Szent Istv�nt?', N'Szent Istv�nt 1000 kar�csony�n vagy 1001. janu�r 1-j�n koron�zt�k kir�lly�.', 2);
-- id = 20
INSERT INTO answers (question_id, answer, is_correct) VALUES
(20, N'896', 0),
(20, N'1000', 1),
(20, N'1222', 0),
(20, N'1301', 0);


