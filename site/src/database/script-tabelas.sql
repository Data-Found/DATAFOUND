-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE aquatech;

USE aquatech;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);


/*
comando para sql server - banco remoto - ambiente de produção
*/

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
);

/*
comandos para sqlServer - banco nuvem - ambiente de produção
*/

CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY IDENTITY(1,1),
    nomeFantasia VARCHAR(75) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    responsavel VARCHAR(100) NOT NULL,
    fkMatriz INT, CONSTRAINT fkIdMatriz 
    FOREIGN KEY (fkMatriz) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Endereco(
	idEndereco INT IDENTITY(1,1),
    cep CHAR(8) NOT NULL, 
    numero VARCHAR(7) NOT NULL,
	fkEmpresa INT NOT NULL, CONSTRAINT fkIdEmpresa 
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    PRIMARY KEY(idEndereco, fkEmpresa)
);

CREATE TABLE Usuario(
	idUsuario INT IDENTITY(1,1),
    nomeUsuario VARCHAR(75) NOT NULL,
    email VARCHAR(256) NOT NULL, CONSTRAINT chkEmailusuario CHECK (email LIKE '%@%'), 
    senha VARCHAR(25) NOT NULL,
    fkEmpresa INT, CONSTRAINT ctfkIdEmpresa 
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    PRIMARY KEY(idUsuario, fkEmpresa)
);

CREATE TABLE Setor(
	idSetor INT PRIMARY KEY IDENTITY(1,1),
    nomeSetor VARCHAR(45) NOT NULL,
    maxSetor INT NOT NULL,
    fkEmpresa INT NOT NULL, CONSTRAINT fkIdEmpresaSetor
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
);

CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY IDENTITY(1,1),
    tipoSensor CHAR(2) NOT NULL, CONSTRAINT chktipoSensor CHECK (tipoSensor IN('EN','PR')),
    statusSensor VARCHAR(25) NOT NULL, CONSTRAINT chkSensor CHECK (statusSensor IN('Ativo','Inativo','Manutenção')),
    dtInclusao DATE NOT NULL,
    dtAtualizacao DATE,
    prateleira VARCHAR(25),
    fkSetor INT, CONSTRAINT fkIdSetor FOREIGN KEY (fkSetor) REFERENCES Setor(idSetor)
);

CREATE TABLE Leitura(
	idLeitura INT IDENTITY(1,1),
    movimento BIT,
    dtLeitura DATETIME DEFAULT GETDATE(),
    fkSensor INT, CONSTRAINT fkIdSensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY(idLeitura, fkSensor)
);

CREATE TABLE formContato(
	idFormContato int primary key IDENTITY(1,1) NOT NULL,
	nomeForm VARCHAR(75) NOT NULL,
	emailForm VARCHAR(256) NOT NULL,
		CONSTRAINT chkEmailusuarioForm CHECK (emailForm LIKE '%@%'),
	assunto VARCHAR(75) NOT NULL,
	mensagem VARCHAR(500) NOT NULL
);

-- INSERTS TABELAS
INSERT INTO Empresa (nomeFantasia, cnpj, responsavel, fkMatriz) VALUES
('Golden Honor LTDA','39892768000152','Brando', null), 
('WarNear Express','28136753000148','Fernandes', null);

INSERT INTO Endereco (cep, numero, fkEmpresa) VALUES
-- GOLDEN HONOR
('02550000','10',1), 
-- WARNEAR
('02660100','1285',2);

INSERT INTO Usuario (nomeUsuario, email, senha, fkEmpresa) VALUES
-- GOLDEN HONOR
('Fernando Duarte Brandão','fernando.brando@golden.com.br','Yy6gFuIcPy',1), 
-- WARNEAR
('Fernanda Caramico','caramicofernanda@nearexpress.com.br','0X6FOfBHOc',2);

INSERT INTO Setor (idSetor, nomeSetor, maxSetor, fkEmpresa) VALUES
-- GOLDEN HONOR
(1,'Eletrônicos',11,1), (2,'Vestuário',15,1), (3,'Brinquedos',10,1), (4,'Cosméticos',12,1), (5,'Alimentício',13,1),
-- WARNEAR
(6,'Moda',20,2), (7,'Higiene',10,2), (8,'Bebidas',14,2), (9,'Eletrodomésticos',18,2), (10'Eletrônicos',20,2);

INSERT INTO Sensor (tipoSensor, statusSensor, dtInclusao, prateleira, fkSetor) VALUES
-- GOLDEN HONOR ENTRADAS
('EN','Ativo','2022-10-01',null,1),('EN','Ativo','2022-10-01',null,2),('EN','Ativo','2022-10-01',null,3),('EN','Ativo','2022-10-01',null,4),('EN','Ativo','2022-10-01',null,5),
-- PRATELEIRAS
('PR','Ativo','2022-10-01','1',1),('PR','Ativo','2022-10-01','11',2),('PR','Ativo','2022-10-01','21',3),('PR','Ativo','2022-10-01','31',4),('PR','Ativo','2022-10-01','41',5),
('PR','Ativo','2022-10-01','2',1),('PR','Ativo','2022-10-01','12',2),('PR','Ativo','2022-10-01','22-C',3),('PR','Ativo','2022-10-01','32',4),('PR','Ativo','2022-10-01','42',5),

-- WARNEAR ENTRADAS
('EN','Ativo','2022-10-28',null,6), ('EN','Ativo','2022-10-28',null,7),('EN','Ativo','2022-10-28',null,8),('EN','Ativo','2022-10-28',null,9),('EN','Ativo','2022-10-28',null,10),
-- PRATELEIRAS
('PR','Ativo','2022-10-28','01-A',6), ('PR','Ativo','2022-10-28','01-B',7),('PR','Ativo','2022-10-28','3C',8),('PR','Ativo','2022-10-28','1D',9),('PR','Ativo','2022-10-28','01-E',10),
('PR','Ativo','2022-10-28','02-A',6), ('PR','Ativo','2022-10-28','02-B',7),('PR','Ativo','2022-10-28','5C',8),('PR','Ativo','2022-10-28','2D',9),('PR','Ativo','2022-10-28','02-E',10);

-- LEITURA dos sensores de setores
INSERT INTO Leitura (movimento, dtLeitura, fkSensor) VALUES
-- GOLDEN HONOR
(0,'2022-10-01 09:00:00',1),(1,'2022-10-01 09:00:00',2),(0,'2022-10-01 09:00:00',3),(1,'2022-10-01 09:00:00',4),(0,'2022-10-01 09:00:00',5),
(0,'2022-10-01 09:01:00',1),(0,'2022-10-01 09:01:00',2),(0,'2022-10-01 09:01:00',3),(0,'2022-10-01 09:01:00',4),(1,'2022-10-01 09:01:00',5),

(0,'2022-10-01 09:00:00',6),(0,'2022-10-01 09:00:00',7),(0,'2022-10-01 09:00:00',8),(0,'2022-10-01 09:00:00',9),(1,'2022-10-01 09:00:00',10),
(0,'2022-10-01 09:01:00',6),(1,'2022-10-01 09:01:00',7),(0,'2022-10-01 09:01:00',8),(1,'2022-10-01 09:01:00',9),(0,'2022-10-01 09:01:00',10),

(0,'2022-10-01 09:00:00',11),(0,'2022-10-01 09:00:00',12),(0,'2022-10-01 09:00:00',13),(0,'2022-10-01 09:00:00',14),(0,'2022-10-01 09:00:00',15),
(0,'2022-10-01 09:01:00',11),(0,'2022-10-01 09:01:00',12),(0,'2022-10-01 09:01:00',13),(1,'2022-10-01 09:01:00',14),(0,'2022-10-01 09:01:00',15),

-- WARNEAR
(1,'2022-10-29 10:00:00',16),(0,'2022-10-29 10:00:00',17),(0,'2022-10-29 10:00:00',18),(1,'2022-10-29 10:00:00',19),(0,'2022-10-29 10:00:00',20),
(1,'2022-10-29 10:01:00',16),(0,'2022-10-29 10:01:00',17),(1,'2022-10-29 10:01:00',18),(0,'2022-10-29 10:01:00',19),(1,'2022-10-29 10:01:00',20),

(1,'2022-10-29 10:00:00',21),(0,'2022-10-29 10:00:00',22),(1,'2022-10-29 10:00:00',23),(0,'2022-10-29 10:00:00',24),(1,'2022-10-29 10:00:00',25),
(1,'2022-10-29 10:00:00',21),(0,'2022-10-29 10:00:00',22),(0,'2022-10-29 10:00:00',23),(1,'2022-10-29 10:00:00',24),(1,'2022-10-29 10:00:00',25),

(1,'2022-10-29 10:00:00',26),(0,'2022-10-29 10:00:00',27),(0,'2022-10-29 10:00:00',28),(0,'2022-10-29 10:00:00',29),(1,'2022-10-29 10:00:00',30),
(1,'2022-10-29 10:01:00',26),(0,'2022-10-29 10:01:00',27),(0,'2022-10-29 10:01:00',28),(0,'2022-10-29 10:01:00',29),(1,'2022-10-29 10:01:00',30);


INSERT INTO formContato (nomeForm,emailForm,assunto,mensagem) VALUES
('Matheus Fernandes Rodrigues','fernandes@gmail.com','Dúvida','meu site está cheio de ondinhas, não consigo visualizar nada'),
('Matheus Leone','leone@gmail.com','Como Funciona','como eu faço pra baixar o sistema Datafound? Eu não achei o local'),
('Rebeca Lia','lia@gmail.com','Quero Fechar Negocio','olá, minha empresa gostaria de entender melhor sobre o negócio de vcs :)');



/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
