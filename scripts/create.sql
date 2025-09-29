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

CREATE TABLE Pesquisa (
    Id_Pesquisa INT PRIMARY KEY AUTO_INCREMENT,
    Freq_Recurso INT DEFAULT 0,
    Nvl_Estresse VARCHAR(255) CHECK (Nvl_Estresse IN ('Nenhum','Baixo','Moderado','Alto','Muito alto'))
    Qtd_Disciplinas INT CHECK (Qtd_Disciplinas >= 1),
    Freq_Estudo INT,
    Id_Aluno INT,
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
        ON DELETE SET NULL
);

CREATE TABLE Professor (
    Id_Prof INT PRIMARY KEY AUTO_INCREMENT,
    CPF VARCHAR(14) UNIQUE,
    Nome VARCHAR(255) NOT NULL,
    Rua VARCHAR(255),
    Num INT,
    CEP VARCHAR(9)
);

CREATE TABLE Efetivado (
    Id_Prof INT PRIMARY KEY,
    Salario DECIMAL(10, 2) NOT NULL,
    Data_Concurso DATE,
    Regime VARCHAR(50),
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Temporario (
    Id_Prof INT PRIMARY KEY,
    Remuneracao DECIMAL(10, 2),
    Inicio DATE,
    Fim DATE,
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Turma (
    Id_Turma INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Ano INT NOT NULL
);

CREATE TABLE Recurso (
    Id_Recurso INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(100) DEFAULT 'Geral',
    Localizacao VARCHAR(255)
);

CREATE TABLE Matricula (
    Id_Matricula INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE,
    Id_Aluno INT,
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
        ON DELETE SET NULL
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

CREATE TABLE Ministra (
    Id_Prof INT,
    Id_Disc INT,
    PRIMARY KEY (Id_Prof, Id_Disc),
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON DELETE CASCADE,
    FOREIGN KEY (Id_Disc) REFERENCES Disciplina(Id_Disc)
        ON DELETE CASCADE
);

CREATE TABLE Avaliacao (
    Id_Avalia INT PRIMARY KEY AUTO_INCREMENT,
    Valor DECIMAL(4, 2) CHECK (Valor >= 0 AND Valor <= 10),
    Data DATE,
    Id_Aluno INT,
    Id_Disc INT,
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
        ON DELETE SET NULL,
    FOREIGN KEY (Id_Disc) REFERENCES Disciplina(Id_Disc)
        ON DELETE SET NULL
);

CREATE TABLE Utiliza (
    Id_Turma INT,
    Id_Recurso INT,
    Data DATE NOT NULL,
    Hora TIME,
    Observacao VARCHAR(255),
    PRIMARY KEY (Id_Turma, Id_Recurso, Data),
    FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma),
    FOREIGN KEY (Id_Recurso) REFERENCES Recurso(Id_Recurso)
);

CREATE TABLE Telefone (
    Numero VARCHAR(20),
    Id_Aluno INT,
    Id_Prof INT,
    PRIMARY KEY (Numero),
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
        ON DELETE CASCADE ,
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON DELETE CASCADE 
);

CREATE TABLE Email (
    Email VARCHAR(255) PRIMARY KEY,
    Id_Aluno INT,
    Id_Prof INT,
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
        ON DELETE CASCADE,
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON DELETE CASCADE 	
);

CREATE TABLE Pagamento (
    Id_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
    Status VARCHAR(50) DEFAULT 'Pendente' CHECK (Status IN ('Pendente','Pago','Atrasado')),
    Valor DECIMAL(10, 2) CHECK (Valor >= 0),
    Data DATE,
    Id_Aluno INT,
    FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno)
        ON DELETE SET NULL
);

CREATE TABLE Proj_Extensao (
    Id_Proj INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255),
    Descricao VARCHAR(255),
    Id_Prof INT,
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON DELETE SET NULL
);

CREATE TABLE Atua (
    Id_Prof INT,
    Id_Proj INT,
    PRIMARY KEY (Id_Prof, Id_Proj),
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON DELETE CASCADE,
    FOREIGN KEY (Id_Proj) REFERENCES Proj_Extensao(Id_Proj)
        ON DELETE CASCADE
);

CREATE TABLE Conselho (
    Id_Conselho INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255),
    Data DATE,
    Id_Prof INT,
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON DELETE SET NULL
);

CREATE TABLE Participa (
    Id_Prof INT,
    Id_Conselho INT,
    PRIMARY KEY (Id_Prof, Id_Conselho),
    FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof)
        ON DELETE CASCADE,
    FOREIGN KEY (Id_Conselho) REFERENCES Conselho(Id_Conselho)
        ON DELETE CASCADE
);
