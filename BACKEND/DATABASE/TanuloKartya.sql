-- Adatb�zis l�trehoz�sa �s kiv�laszt�sa
CREATE DATABASE IF NOT EXISTS TanuloKartya;
USE TanuloKartya;

-- T�bl�k l�trehoz�sa
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

-- Adatok besz�r�sa
INSERT INTO question_sets (name) VALUES ('nehezLista'), ('konnyuLista');

-- 1. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor adt�k ki az Aranybull�t?', 'Az Aranybull�t II. Andr�s adta ki 1222-ben, a nemess�g jogainak meger�s�t�s�re.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(1, '1222', TRUE),
(1, '1301', FALSE),
(1, '1526', FALSE),
(1, '1000', FALSE);

-- 2. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik csat�ban gy�zte le Hunyadi J�nos a t�r�k�ket 1456-ban?', '1456-ban Hunyadi J�nos visszaverte a t�r�k ostromot N�ndorfeh�rv�rn�l.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(2, 'Mohács', FALSE),
(2, 'Pozsony', FALSE),
(2, 'N�ndorfeh�rv�r', TRUE),
(2, 'Temesv�r', FALSE);

-- 3. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor halt ki az �rp�d-h�z f�rfi�ga?', 'Az �rp�d-h�z 1301-ben halt ki f�rfi�gon, III. Andr�s hal�l�val.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(3, '1000', FALSE),
(3, '1241', FALSE),
(3, '1301', TRUE),
(3, '1526', FALSE);

-- 4. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Kinek az uralkod�sa alatt zajlott le a tat�rj�r�s?', 'A tat�rj�r�s 1241�42-ben t�rt�nt, IV. B�la uralkod�sa alatt.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(4, 'IV. B�la', TRUE),
(4, 'K�roly R�bert', FALSE),
(4, 'I. Lajos', FALSE),
(4, 'III. Andr�s', FALSE);

-- 5. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik magyar kir�lyt v�lasztott�k n�met-r�mai cs�sz�rr� is?', 'Luxemburgi Zsigmond magyar kir�ly 1433-ban n�met-r�mai cs�sz�rr� koron�zt�k.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(5, 'I. L�szl�', FALSE),
(5, 'K�roly R�bert', FALSE),
(5, 'Zsigmond', TRUE),
(5, 'II. Ul�szl�', FALSE);

-- 6. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik �vben egyes�lt Erd�ly �s Magyarorsz�g v�glegesen?', '1699-ben a karl�cai b�ke ut�n Erd�ly hivatalosan is a Habsburg Birodalom r�sze lett.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(6, '1526', FALSE),
(6, '1699', TRUE),
(6, '1867', FALSE),
(6, '1918', FALSE);

-- 7. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mit jelent a ''Tripartitum'' a magyar t�rt�nelemben?', 'A Tripartitum Werb�czy Istv�n 1517-ben megjelent jogk�nyve volt.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(7, 'H�rom r�szre szakadt orsz�g', FALSE),
(7, 'H�romszoros ad�', FALSE),
(7, 'Werb�czy t�rv�nyk�nyve', TRUE),
(7, 'H�rom kir�ly sz�vets�ge', FALSE);

-- 8. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki volt a magyar korm�nyz� 1920 �s 1944 k�z�tt?', 'Horthy Mikl�s 1920-t�l 1944-ig volt Magyarorsz�g korm�nyz�ja.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(8, 'Bethlen Istv�n', FALSE),
(8, 'Horthy Mikl�s', TRUE),
(8, 'K�rolyi Mih�ly', FALSE),
(8, 'Teleki P�l', FALSE);

-- 9. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor zajlott az �szir�zs�s forradalom?', 'Az �szir�zs�s forradalom 1918 okt�ber�ben zajlott, K�rolyi Mih�ly vezet�s�vel.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(9, '1918', TRUE),
(9, '1848', FALSE),
(9, '1956', FALSE),
(9, '1945', FALSE);

-- 10. k�rd�s
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik magyar kir�ly h�res ''t�rv�nyes rendet'' teremt� uralkod�s�r�l?', 'Hunyadi M�ty�s er�s k�zponti hatalmat �s szigor� rendet hozott l�tre uralkod�sa alatt.', 1);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(10, 'K�roly R�bert', FALSE),
(10, 'Hunyadi M�ty�s', TRUE),
(10, 'I. Lajos', FALSE),
(10, 'IV. B�la', FALSE);

-- 1. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki volt az els� magyar kir�ly?', 'Szent Istv�nt 1000-ben koron�zt�k kir�lly�, � volt az els� magyar kir�ly.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(11, 'Szent Istv�n', TRUE),
(11, 'M�ty�s kir�ly', FALSE),
(11, 'IV. B�la', FALSE),
(11, 'Kopp�ny', FALSE);

-- 2. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor t�rt ki az 1848�49-es forradalom?', 'Az 1848�49-es forradalom 1848. m�rcius 15-�n kezd�d�tt Pesten.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(12, '1848. m�rcius 15.', TRUE),
(12, '1849. okt�ber 6.', FALSE),
(12, '1956. okt�ber 23.', FALSE),
(12, '1789. j�lius 14.', FALSE);

-- 3. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mi t�rt�nt 1956. okt�ber 23-�n Magyarorsz�gon?', '1956. okt�ber 23-�n kezd�d�tt a magyar forradalom a szovjet uralom ellen.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(13, '�llamalap�t�s', FALSE),
(13, 'Forradalom kezdete', TRUE),
(13, 'Honfoglal�s', FALSE),
(13, 'M�ty�s tr�nra l�p�se', FALSE);

-- 4. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mi volt a honfoglal�s ideje?', 'A magyarok 896-ban foglalt�k el a K�rp�t-medenc�t.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(14, '896', TRUE),
(14, '1000', FALSE),
(14, '1526', FALSE),
(14, '1848', FALSE);

-- 5. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor volt a moh�csi csata?', 'A moh�csi csata 1526. augusztus 29-�n volt.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(15, '1514', FALSE),
(15, '1526', TRUE),
(15, '1703', FALSE),
(15, '1848', FALSE);

-- 6. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki volt M�ty�s kir�ly apja?', 'M�ty�s kir�ly apja Hunyadi J�nos volt, a h�res hadvez�r.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(16, 'Kossuth Lajos', FALSE),
(16, 'Hunyadi J�nos', TRUE),
(16, '�rp�d fejedelem', FALSE),
(16, 'Szent L�szl�', FALSE);

-- 7. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik v�ros lett f�v�ros 1873-ban?', 'Budapest 1873-ban j�tt l�tre Buda, Pest �s �buda egyes�t�s�vel.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(17, 'Kassa', FALSE),
(17, 'Pozsony', FALSE),
(17, 'Budapest', TRUE),
(17, 'Debrecen', FALSE);

-- 8. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Melyik n�p vez�re volt Attila?', 'Attila a hunok vez�re volt az 5. sz�zadban.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(18, 'Hun', TRUE),
(18, 'Magyar', FALSE),
(18, 'Germ�n', FALSE),
(18, 'R�mai', FALSE);

-- 9. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Ki vezette a magyarokat a honfoglal�s idej�n?', '�rp�d fejedelem vezette a magyar t�rzseket a K�rp�t-medenc�be 896 k�r�l.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(19, 'Szent Istv�n', FALSE),
(19, 'Kopp�ny', FALSE),
(19, '�rp�d', TRUE),
(19, 'IV. B�la', FALSE);

-- 10. k�rd�s (konnyuLista)
INSERT INTO questions (question, explanation, question_set_id)
VALUES ('Mikor koron�zt�k kir�lly� Szent Istv�nt?', 'Szent Istv�nt 1000 kar�csony�n vagy 1001. janu�r 1-j�n koron�zt�k kir�lly�.', 2);
INSERT INTO answers (question_id, answer, is_correct) VALUES
(20, '896', FALSE),
(20, '1000', TRUE),
(20, '1222', FALSE),
(20, '1301', FALSE);
