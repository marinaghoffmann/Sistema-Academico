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
       ('Maria Julia Gomes', 20, 'F', 9.0, 70.0, 'Rua Dom Pedro II', 765, '05032-110', NULL, NULL),
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
       ('234.567.890-12', 'Walter Santos', 'Avenida Brasil', 782, '32056-430'),
       ('345.678.901-23', 'Diogo Vieira', 'Rua Floriano Peixoto', 156, '33067-540'),
       ('456.789.012-34', 'Mário Mazullo', 'Rua Dom Pedro II', 921, '34078-650'),
       ('567.890.123-45', 'Luciana Santos', 'Rua Marechal Deodoro', 348, '35089-760'),
       ('678.901.234-56', 'Wellington Estima', 'Rua da Aurora', 507, '36090-870'),
       ('789.012.345-67', 'Nísia Aragão', 'Avenida Recife', 113, '37012-980'),
       ('890.123.456-78', 'Paulo Wendel', 'Rua das Palmeiras', 664, '38023-090'),
       ('901.234.567-89', 'Davi Morato', 'Rua Frei Caneca', 275, '39034-200'),
       ('012.345.678-90', 'Ulisses Muliterno', 'Rua Santa Cruz', 842, '40045-310'),
       ('135.246.356-91', 'Luiza Xavier', 'Rua Monte Castelo', 129, '41056-420'),
       ('246.437.468-02', 'Marina Yanes', 'Rua Sete de Setembro', 903, '42067-530'),
       ('357.468.579-13', 'Natan Zico', 'Rua José Bonifácio', 311, '43078-640'),
       ('468.579.680-24', 'Otavio Alves', 'Rua Benjamin Constant', 742, '44089-750'),
       ('579.680.791-35', 'Patricia Borges', 'Rua Santo Antônio', 258, '45090-860'),
       ('680.791.802-46', 'Rubens Castro', 'Rua Joaquim Nabuco', 634, '46012-970'),
       ('791.802.913-57', 'Sonia Duarte', 'Avenida Independência', 487, '47023-080'),
       ('802.913.024-68', 'Tiago Esteves', 'Rua Padre Cícero', 322, '48034-190'),
       ('913.024.135-79', 'Ursula Fonseca', 'Rua Bela Vista', 759, '49045-200'),
       ('024.135.246-80', 'Vitor Guimarães', 'Rua Dom Bosco', 188, '50056-310'),
       ('135.246.357-91', 'Wanda Henriques', 'Rua São João', 594, '51067-420'),
       ('246.357.468-02', 'Xena Igor', 'Rua Projetada Leste', 401, '52078-530'),
       ('357.468.579-17', 'Yasmin Jorge', 'Rua Getúlio Vargas', 222, '53089-640'),
       ('487.579.680-24', 'Zeze Kilber', 'Rua das Flores', 845, '54090-750'),
       ('579.770.791-35', 'Alana Lopes', 'Rua Padre Anchieta', 503, '55012-860'),
       ('660.791.102-46', 'Bianca Mendes', 'Rua São Pedro', 310, '56023-970'),
       ('791.982.913-57', 'Carlos Nogueira', 'Avenida Tiradentes', 775, '57034-080'),
       ('802.934.024-68', 'Dora Ornelas', 'Rua José do Patrocínio', 492, '58045-190'),
       ('913.454.135-79', 'Eduardo Pires', 'Rua da Liberdade', 156, '59056-200'),
       ('024.345.246-80', 'Fatima Queiroz', 'Rua Marechal Hermes', 689, '60067-310');



INSERT INTO Turma (Nome, Ano)
VALUES ('Turma A', 2023), 
       ('Turma B', 2023),
       ('Turma C', 2023),
       ('Turma D', 2023),
       ('Turma E', 2023),
       ('Turma F', 2023),
       ('Turma G', 2023),
       ('Turma H', 2023),
       ('Turma I', 2023),
       ('Turma J', 2023),
       ('Turma K', 2024),
       ('Turma L', 2024),
       ('Turma M', 2024),
       ('Turma N', 2024),
       ('Turma O', 2024),
       ('Turma P', 2024),
       ('Turma Q', 2024),
       ('Turma R', 2024),
       ('Turma S', 2024),
       ('Turma T', 2024),
       ('Turma U', 2024),
       ('Turma V', 2024),
       ('Turma W', 2024),
       ('Turma X', 2024),
       ('Turma Y', 2024),
       ('Turma Z', 2024),
       ('Turma A1', 2025),
       ('Turma B1', 2025),
       ('Turma C1', 2025),
       ('Turma D1', 2025);



INSERT INTO Disciplina (Nome, Carga_Horaria, Id_Aluno, Id_Turma)
VALUES ('Matemática', 60, 1, 1), 
       ('Física', 45, 2, 2),
       ('Química', 50, 3, 3), 
       ('Biologia', 60, 4, 4),
       ('História', 40, 5, 5), 
       ('Geografia', 40, 6, 6), 
       ('Português', 80, 7, 7), 
       ('Inglês', 40, 8, 8),
       ('Artes', 30, 9, 9), 
       ('Educação Física', 30, 10, 10), 
       ('Sociologia', 45, 11, 11), 
       ('Filosofia', 45, 12, 12),
       ('Literatura', 60, 13, 13), 
       ('Redação', 40, 14, 14), 
       ('Programação', 80, 15, 15), 
       ('Banco de Dados', 60, 16, 16),
       ('Sistemas Operacionais', 60, 17, 17), 
       ('Redes de Computadores', 45, 18, 18), 
       ('Cálculo', 90, 19, 19), 
       ('Geometria', 60, 20, 20),
       ('Física Moderna', 50, 21, 21), 
       ('Genética', 50, 22, 22), 
       ('Microeconomia', 45, 23, 23), 
       ('Macroeconomia', 45, 24, 24),
       ('Estatística', 60, 25, 25), 
       ('Introdução ao Direito', 40, 26, 26), 
       ('Psicologia', 50, 27, 27), 
       ('Contabilidade', 60, 28, 28),
       ('Marketing Digital', 45, 29, 29), 
       ('Gestão de Projetos', 60, 30, 30); 


DELETE FROM Aluno WHERE Id_Aluno = 13;

DELETE FROM Professor WHERE Id_Prof = 15;

UPDATE Aluno SET Media = 9.0 WHERE Nome = 'Marina Hoffmann';

UPDATE Disciplina SET Carga_Horaria = 100 WHERE Nome = 'Cálculo';

SELECT * FROM Aluno;

SELECT Nome, CPF FROM Professor;

SELECT Nome, Media FROM Aluno WHERE Media >= 8;

SELECT A.Nome AS Aluno, D.Nome AS Disciplina, T.Nome AS Turma
FROM Aluno A
JOIN Disciplina D ON A.Id_Aluno = D.Id_Aluno
JOIN Turma T ON D.Id_Turma = T.Id_Turma;