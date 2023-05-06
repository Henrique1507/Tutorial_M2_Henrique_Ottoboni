BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Curriculo" (
	"NUM_Curriculo"	NUMERIC NOT NULL,
	"Nome"	TEXT,
	"NUM_Formacao"	NUMERIC,
	"NUM_Experiencia"	NUMERIC,
	"NUM_Realizacoes"	NUMERIC,
	"NUM_SobreMim"	NUMERIC,
	PRIMARY KEY("NUM_Curriculo")
);
CREATE TABLE IF NOT EXISTS "Experiencia" (
	"NUM_Experiencia"	NUMERIC NOT NULL,
	"Empresa"	TEXT,
	"DataDeInicio"	TEXT,
	"DataDeTermino"	TEXT,
	PRIMARY KEY("NUM_Experiencia"),
	FOREIGN KEY("NUM_Experiencia") REFERENCES "Curriculo"("NUM_Experiencia")
);
CREATE TABLE IF NOT EXISTS "Realizacoes" (
	"NUM_Realizacoes"	NUMERIC NOT NULL,
	"TrabalhoAgregado"	TEXT,
	"DataDeInicio"	TEXT,
	"DataDeTermino"	TEXT,
	PRIMARY KEY("NUM_Realizacoes"),
	FOREIGN KEY("NUM_Realizacoes") REFERENCES "Curriculo"("NUM_Realizacoes")
);
CREATE TABLE IF NOT EXISTS "SobreMim" (
	"NUM_SobreMim"	NUMERIC NOT NULL,
	"Descricao"	TEXT,
	"Telefone"	TEXT,
	"Email"	TEXT,
	"Endereco"	TEXT,
	PRIMARY KEY("NUM_SobreMim"),
	FOREIGN KEY("NUM_SobreMim") REFERENCES "Curriculo"("NUM_SobreMim")
);
CREATE TABLE IF NOT EXISTS "Habilidades" (
	"NUM_Habilidades"	NUMERIC NOT NULL,
	"Photoshop"	TEXT,
	"Illustrator"	TEXT,
	"CorelDraw"	TEXT,
	"DreamWeaver"	TEXT,
	"HTML"	TEXT,
	"NUM_SobreMim"	NUMERIC,
	PRIMARY KEY("NUM_Habilidades"),
	FOREIGN KEY("NUM_SobreMim") REFERENCES "SobreMim"("NUM_SobreMim")
);
CREATE TABLE IF NOT EXISTS "Personalidade" (
	"NUM_Personalidade"	NUMERIC NOT NULL,
	"LoremIpsum"	TEXT,
	"Loremlpsum"	TEXT,
	"LoremIpsun"	TEXT,
	"Loremlpsun"	TEXT,
	"LorenIpsum"	TEXT,
	"NUM_SobreMim"	NUMERIC,
	PRIMARY KEY("NUM_Personalidade"),
	FOREIGN KEY("NUM_SobreMim") REFERENCES "SobreMim"("NUM_SobreMim")
);
CREATE TABLE IF NOT EXISTS "Formacao" (
	"NUM_Formacao"	INTEGER NOT NULL,
	"Curso"	TEXT NOT NULL,
	"DataDeInicio"	TEXT NOT NULL,
	"DataDeTermino"	TEXT NOT NULL,
	PRIMARY KEY("NUM_Formacao" AUTOINCREMENT),
	FOREIGN KEY("NUM_Formacao") REFERENCES "Curriculo"("NUM_Formacao")
);
INSERT INTO "Curriculo" VALUES (1,'Henrique Ottoboni Magalhães',1,1,1,1);
INSERT INTO "Curriculo" VALUES (2,'Marcelo Pinto Magalhães',2,2,2,2);
INSERT INTO "Curriculo" VALUES (3,'Maria Cristina Ottoboni',3,3,3,3);
INSERT INTO "Experiencia" VALUES (1,'Colégio Embraer','30/01/2020','01/05/2021');
INSERT INTO "Experiencia" VALUES (2,'Embraer','01/01/1999','Até o momento');
INSERT INTO "Experiencia" VALUES (3,'Casa de Repouso - Maria Emaculada','01/01/2015','Até o momento');
INSERT INTO "Realizacoes" VALUES (1,'Participei de um grupo de oração na igreja e fiz bastante trabalho voluntário, como arrecadação de alimentos','01/01/2018','10/07/2020');
INSERT INTO "Realizacoes" VALUES (2,'Participou de campeonatos de futebol pela Embraer que arrecadava alimentos e brinquedos para crianças ','01/01/2007','01/12/2015');
INSERT INTO "Realizacoes" VALUES (3,'Ajudava na organização de campeonatos de corrida de rua','01/01/2007','01/12/2015');
INSERT INTO "SobreMim" VALUES (1,'Me chamo Henrique, tenho 17 anos e faço faculdade de Engenharia de Software. Estou aprendendo JavaScript e banco de dados','(12)997322005','ottobonihenrique12@gmail.com','Rua Enseada,35. Jardim Satélite - SJC');
INSERT INTO "SobreMim" VALUES (2,'Me chamo Marcelo, tenho 50 anos e sou engenheiro eletricista. Trabalhei em inúmeras áreas da engenharia e sou apaixonado por futebol','(12)981238405','marcelo.magalhaes@embraer.com.br','Rua Enseada, 35. Jardim Satélite - SJC');
INSERT INTO "SobreMim" VALUES (3,'Sou a Maria Cristina Ottoboni, tenho 50 anos e sou terapueta ocupacional. Trabalho em uma casa de repouso com idosos e sou apaixonada pela minha família.','(12)997033837','crisottobonimaga@gmail.com','Rua Enseada, 35. Jardim Satélite - SJC');
INSERT INTO "Habilidades" VALUES (1,'5/10','7/10','6/10','6/10','9/10',NULL);
INSERT INTO "Habilidades" VALUES (2,'4/10','8/10','9/10','6/10','10/10',NULL);
INSERT INTO "Habilidades" VALUES (3,'6/10','6/10','8/10','5/10','7/10',NULL);
INSERT INTO "Personalidade" VALUES (1,'4/10','5/10','6/10','7/10','8/10',NULL);
INSERT INTO "Personalidade" VALUES (2,'3/10','7/10','8/10','6/10','5/10',NULL);
INSERT INTO "Personalidade" VALUES (3,'4/10','7/10','5/10','9/10','7/10',NULL);
INSERT INTO "Formacao" VALUES (1,'Engenharia de Software','30/01/2023','01/12/2026');
INSERT INTO "Formacao" VALUES (2,'Engenharia Elétrica','30/01/1995','01/12/1998');
INSERT INTO "Formacao" VALUES (3,'Terapia Ocupacional','30/01/1995','01/12/1997');
CREATE UNIQUE INDEX IF NOT EXISTS "unq_Curriculo_NUM_Formacao" ON "Curriculo" (
	"NUM_Formacao"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_Curriculo_NUM_Experiencia" ON "Curriculo" (
	"NUM_Experiencia"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_Curriculo_NUM_Realizacoes" ON "Curriculo" (
	"NUM_Realizacoes"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_Curriculo_NUM_SobreMim" ON "Curriculo" (
	"NUM_SobreMim"
);
COMMIT;
