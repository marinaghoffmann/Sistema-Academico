CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Aluno (
    Id_Aluno INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Sexo CHAR(1) CHECK (Sexo IN ('M','F')),
    Idade INT CHECK (Idade >= 16),
    Num INT,
    CEP VARCHAR(9),
    Rua VARCHAR(255),	
    Media DECIMAL(4,2),
    Frequencia DECIMAL(5,2) DEFAULT 100 CHECK (Frequencia BETWEEN 0 AND 100),
    Monitor INT NULL,
    Monitorado INT NULL,
    FOREIGN KEY (Monitor) REFERENCES Aluno(Id_Aluno)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (Monitorado) REFERENCES Aluno(Id_Aluno)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Professor (
    Id_Prof INT PRIMARY KEY AUTO_INCREMENT,
    CPF VARCHAR(14) UNIQUE,
    Nome VARCHAR(255) NOT NULL,
    Rua VARCHAR(255),
    Num INT,
    CEP VARCHAR(9)
);

CREATE TABLE Turma (
    Id_Turma INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Ano INT NOT NULL
);

CREATE TABLE Disciplina (
    Id_Disc INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Carga_Horaria INT DEFAULT 40 CHECK (Carga_Horaria BETWEEN 20 AND 120),
    Id_Aluno INT,
    Id_Turma INT,
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
        ON DELETE SET NULL,
    FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma)
        ON DELETE SET NULL
);

INSERT INTO Aluno (Nome, Idade, Sexo, Media, Frequencia, Rua, Num, CEP, Monitor, Monitorado) 
VALUES ('Marina Hoffmann', 19, 'F', 8.2, 94.49, 'Avenida Presidente Kennedy', 263, '54420-050', NULL, NULL),
       ('Maria Julia Gomes', 20, 'F', 9.0, 70.0, 'Rua Dom Pedro II', 765, '05032-110', NULL, NULL);
       ('Tiago Cavalcanti', 43, 'M', 8.0, 100.0, 'Rua Benjamin Constant', 248, '08112-890', NULL, NULL),
       ('Julia Moscariello Câmara', 19, 'F', 9.0, 95.0, 'Rua São Pedro', 214, '04012-030', NULL, NULL),
       ('Júlia Araújo', 19, 'F', 8.0, 100.0, 'Rua Amendoim', 505, '29257-450', NULL, NULL),
       ('Manuela Pitanga', 19, 'F', 8.0, 88.0, 'Avenida Brasil', 1032, '51020-450', NULL, NULL),
       ('João Mafra', 19, 'M', 9.0, 100.0, 'Rua Frei Caneca', 512, '10134-020', NULL, NULL),
       ('Wilson Lourenco Fraga Filho', 19, 'M', 7.0, 80.0, 'Rua Padre Cícero', 640, '10012-620', NULL, NULL),
       ('Alana Vitória', 21, 'F', 7.0, 80.0, 'Rua José Bonifácio', 987, '07056-330', NULL, NULL),
       ('Sara Paterson', 20, 'F', 8.5, 100.0, 'Avenida Independência', 120, '08078-410', NULL, NULL),
       ('Catarina', 20, 'F', 8.0, 60.0, 'Avenida Getúlio Vargas', 820, '03156-340', NULL, NULL),
       ('Artur da Fonte', 18, 'M', 8.6, 98.84, 'Avenida Santo Antônio', 374, '09123-910', NULL, NULL),
       ('Gustavo Ferreira Oliveira', 20, 'M', 7.0, 100.0, 'Rua Santo Amaro', 667, '30147-560', NULL, NULL),
       ('Carlos Augusto', 20, 'M', 9.0, 95.0, 'Rua São João', 502, '06189-670', NULL, NULL),
       ('Beatriz Amaral', 24, 'F', 8.0, 90.0, 'Rua das Acácias', 157, '04167-450', NULL, NULL),
       ('Maria Helena', 21, 'F', 10.0, 70.0, 'Rua da Aurora', 305, '29136-450', NULL, NULL),
       ('Lavínia Silva', 22, 'F', 7.95, 93.77, 'Avenida Recife', 484, '24189-410', NULL, NULL),
       ('Lucas Campos Rodrigues', 20, 'M', 7.0, 90.0, 'Rua Projetada Leste', 595, '25190-520', NULL, NULL),
       ('João Astle', 20, 'M', 8.0, 90.0, 'Rua Joaquim Nabuco', 74, '50070-030', NULL, NULL),
       ('Lucas', 18, 'M', 8.9, 100.0, 'Avenida Norte Miguel Arraes', 3555, '52040-002', NULL, NULL),
       ('Rafael Araùjo Nóbrega', 16, 'M', 6.0, 10.0, 'Rua das Andorinhas', 412, '27115-230', NULL, NULL),
       ('Fernanda Alvarez Castro Bené Assis', 18, 'F', 9.0, 70.0, 'Rua das Flores', 582, '54715-120', NULL, NULL),
       ('Luanne Fernandes', 19, 'F', 9.0, 100.0, 'Rua da Liberdade', 430, '06045-220', NULL, NULL),
       ('Mateus Henrique', 19, 'M', 7.0, 100.0, 'Rua Joaquim Nabuco', 133, '07190-780', NULL, NULL),
       ('Maria Fernanda', 22, 'F', 7.0, 100.0, 'Rua Santa Cruz', 311, '09089-500', NULL, NULL),
       ('Adrian Michael', 20, 'M', 8.0, 97.0, 'Rua Monte Castelo', 121, '21156-080', NULL, NULL),
       ('Julia', 18, 'F', 7.0, 96.0, 'Rua Marechal Deodoro', 299, '05178-560', NULL, NULL),
       ('Miguel Arcanjo', 19, 'M', 7.0, 95.0, 'Avenida Tiradentes', 928, '28125-340', NULL, NULL),
       ('João Henrique', 20, 'M', 7.0, 100.0, 'Rua Sete de Setembro', 242, '22167-190', NULL, NULL),
       ('Marcus', 19, 'M', 8.0, 97.0, 'Rua das Palmeiras', 195, '01135-070', NULL, NULL),
       ('Neto', 19, 'M', 6.0, 99.0, 'Rua Frei Cassimiro', 189, '53130-180', NULL, NULL),
       ('Pedro Vinícius Cordeiro Monteiro', 19, 'M', 8.0, 100.0, 'Rua do Sossego', 221, '50050-080', NULL, NULL),
       ('Davi', 20, 'M', 7.0, 60.0, 'Rua General Abreu e Lima', 37, '53120-220', NULL, NULL),
       ('Thiago', 20, 'M', 7.0, 85.0, 'Rua Dom Pedro II', 450, '50060-120', NULL, NULL),
       ('Luiz Gustavo', 20, 'M', 9.0, 85.0, 'Avenida Boa Viagem', 908, '51021-300', NULL, NULL),
       ('Luiz Cláudio', 21, 'M', 7.21, 93.33, 'Rua das Flores', 112, '52031-045', NULL, NULL),
       ('Vítor César Santos Andrade', 19, 'M', 8.45, 95.0, 'Rua XV de Novembro', 411, '02145-230', NULL, NULL),
       ('Maria Alice Escobar', 19, 'F', 8.0, 75.0, 'Rua Bela Vista', 726, '26101-630', NULL, NULL),
       ('Guilherme Mourão', 22, 'M', 8.0, 92.0, 'Rua Floriano Peixoto', 363, '23178-300', NULL, NULL);


INSERT INTO Professor (CPF, Nome, Rua, Num, CEP)
VALUES ('123.456.789-01', 'Izabel Malheiros', 'Rua das Acácias', 415, '31045-210'),
       ('234.567.890-12', 'Walter Santos', 'Avenida Brasil', 782, '32056-430');


INSERT INTO Turma (Nome, Ano)
VALUES ('Turma A', 2023), ('Turma B', 2023);

INSERT INTO Disciplina (Nome, Carga_Horaria, Id_Aluno, Id_Turma)
VALUES ('Matemática', 60, 1, 1), 
       ('Física', 45, 2, 2);

DELETE FROM Aluno WHERE Id_Aluno = 2;

UPDATE Aluno SET Media = 9.0 WHERE Nome = 'Marina Hoffmann';

SELECT * FROM Aluno;

SELECT Nome, CPF FROM Professor;

SELECT Nome, Media FROM Aluno WHERE Media >= 8;

SELECT A.Nome AS Aluno, D.Nome AS Disciplina, T.Nome AS Turma
FROM Aluno A
JOIN Disciplina D ON A.Id_Aluno = D.Id_Aluno
JOIN Turma T ON D.Id_Turma = T.Id_Turma;