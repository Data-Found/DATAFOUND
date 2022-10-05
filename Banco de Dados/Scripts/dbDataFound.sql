CREATE DATABASE dataFound;
USE dataFound;

-- CREATE TABLE --
CREATE TABLE Estado(
	idEstado INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstado VARCHAR(45) NOT NULL, CONSTRAINT chkNomeEstado 
		CHECK (nomeEstado IN('Acre','Alagoas','Amazonas','Amapá','Bahia','Ceará','Distrito Federal','Espirito Santo'
		,'Goiás','Maranhão','Mato Grosso','Mato Grosso do Sul','Minas Gerais','Pará','Paraiba','Paraná','Pernambuco','Piauí'
		,'Rio de Janeiro','Rio Grande do Norte','Rio Grande do Sul','Rondônia','Roraima','Santa Catarina','São Paulo','Sergipe','Tocantins')),
    sigla CHAR(2) NOT NULL, CONSTRAINT chkSiglaEstado 
		CHECK (sigla IN('AC','AL','AM','AP','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR'
		,'PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'))
);

CREATE TABLE Endereco(
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL, 
    numero VARCHAR(7) NOT NULL,
    fkEstado INT, CONSTRAINT fkIdEstado 
    FOREIGN KEY (fkEstado) REFERENCES Estado(idEstado)
);

CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(75) NOT NULL,
    nomeFantasia VARCHAR(75) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    responsavel VARCHAR(100) NOT NULL,
    celular CHAR(9) NOT NULL,
    ddd VARCHAR(3) NOT NULL,
    fkEndereco INT, CONSTRAINT fkIdEndereco 
    FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE Usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(75) NOT NULL,
    email VARCHAR(256) NOT NULL, CONSTRAINT chkEmailusuario CHECK (email LIKE '%@%'), 
    senha VARCHAR(15) NOT NULL, CONSTRAINT chkSenha CHECK (length(senha) > 5),
    fkEmpresa INT, CONSTRAINT fkIdEmpresa 
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Setor(
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
    nomeSetor VARCHAR(45) NOT NULL,
    prateleira VARCHAR(25) NOT NULL,
    fkEmpresa INT, CONSTRAINT fkIdEmpresaSetor
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(25) NOT NULL, CONSTRAINT chkSensor CHECK (statusSensor IN('Ativo','Inativo','Manutenção')),
    dtInclusao DATE NOT NULL,
    fkSetor INT, CONSTRAINT fkIdSetor FOREIGN KEY (fkSetor) REFERENCES Setor(idSetor)
);

CREATE TABLE Leitura(
	idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    movimentEntrada BIT NOT NULL,
    movimentSetor BIT NOT NULL,
    dtLeitura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fkSensor INT, CONSTRAINT fkIdSensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor)
);

-- INSERTS  --
INSERT INTO Estado (nomeEstado, sigla) VALUES
('Acre','AC'), ('Alagoas','AL'), ('Amazonas','AM'), ('Amapá','AP'), ('Bahia','BA'), ('Ceará','CE'), ('Distrito Federal','DF'), ('Espirito Santo','ES'),
('Goiás','GO'), ('Maranhão','MA'), ('Mato Grosso','MT'), ('Mato Grosso do Sul','MS'), ('Minas Gerais','MG'), ('Pará','PA'), ('Paraiba','PB'), 
('Paraná','PR'), ('Pernambuco','PE'), ('Piauí', 'PI'), ('Rio de Janeiro','RJ'), ('Rio Grande do Norte','RN'), ('Rio Grande do Sul','RS'), 
('Rondônia','RO'), ('Roraima','RR'), ('Santa Catarina','SC'), ('São Paulo','SP'), ('Sergipe','SE'), ('Tocantins','TO');

INSERT INTO Endereco (cep, numero, fkEstado) VALUES
('33902110','10',13), ('72255524','13/15',7), ('69315685','55',23), ('78051902','103','11'),
('07177038','502','25'), ('69088746','200','3'), ('69305070','23','23'), ('41205185','100','5'), ('78550017','H-1','11');

INSERT INTO Empresa (razaoSocial, nomeFantasia, cnpj, responsavel, celular, ddd, fkEndereco) VALUES
('Diogo e Laura Entregas Expressas Ltda','Diogo e Laura Entregas Expressas','39892768000152','Laura','998974997','11', 5), 
('Benedito e Filipe Informática ME','Benedito e Filipe Informática','28136753000148','Benedito','991304235','31', 1), 
('Luiz e Sophie Entregas Expressas Ltda','Luiz e Sophie Entregas Expressas','09838199000104','Luiz','985879052','61', 2), 
('Eliane e Danilo Financeira Ltda','Eliane e Danilo Financeira','14762677000171','Eliane','998369200','95', 3), 
('Daiane e Vera Contábil Ltda','Daiane e Vera Contábil','22505301000100','Vera','982527340','65', 4),
('Stella e Hadassa Filmagens Ltda','Stella e Hadassa Filmagens','57512408000160','Stella','982722635','92', 6), 
('Jennifer e Sophie Telas ME','Jennifer e Sophie Telas','09426710000152','Sophie','992325442','95',7), 
('Emanuel e Isabella Publicidade e Propaganda Ltda','Emanuel e Isabella Publicidade e Propaganda','59342482000100','Isabella','992608945','71',8), 
('Hugo e Isaac Filmagens ME','Hugo e Isaac Filmagens','34154793000115','Hugo','984721212','65',9), 
('Ester e Eduarda Contábil Ltda','Ester e Eduarda Contábil','56218837000166','Eduarda','992964117','65', 9);

INSERT INTO Usuario (nomeUsuario, email, senha, fkEmpresa) VALUES
('Milena Bianca Castro','milena_castro@redhouse.com.br','Yy6gFuIcPy',1), 
('Sara Brenda Alice Assunção','sarabrendaassuncao@arteche.com.br','0X6FOfBHOc',2), 
('Carlos Eduardo José Mateus da Mota','carlos-damota98@vitalliimoveis.com','3wAhoel7PB',3), 
('Nicolas Sérgio Gabriel Melo','nicolas.sergio.melo@origamieventos.com.br','8qtQDhHGnF',4),
('Gabriela Helena Laís Pires','gabriela-pires84@infouai.com','aGm2jw8MU8',5),
('Elisa Hadassa Allana da Luz','elisa.hadassa.daluz@vianetfone.com.br','3JOU4X1WyI',6), 
('Louise Isadora Silva','louise_isadora_silva@prohaska.com.br','B4t1O6tel9',7), 
('Edson Thales Porto','edson-porto97@zoomfoccus.com.br','5fxnfuZqba',8), 
('Regina Stella Dias','regina.stella.dias@recoferindustria.com.br','pXY9s15HB0',9), 
('Iago Carlos Eduardo Cavalcanti','iagocarloscavalcanti@dsladvogados.adv.br','CcsGOiLdAN',10);

INSERT INTO Setor (nomeSetor, prateleira, fkEmpresa) VALUES
('Eletrodomésticos','11-A',1), ('Vestuário','13-B',2), ('Alimentos','14-C',3), ('Calçados','15-E',4), ('Têxtil','17-G',5), 
('Móveis','20-A', 6), ('Eletrônicos','25-B',7), ('Brinquedos','F23',8), ('Linha lar','G-29',9), ('Colchões','Z-14',10);

INSERT INTO Sensor (statusSensor, dtInclusao, fkSetor) VALUES
('Ativo','2022-10-01',1),('Inativo','2022-10-10',2),('Ativo','2022-10-05',3),('Inativo','2022-10-30',6),('Ativo','2022-10-09',5),
('Inativo','2022-10-28',2), ('Ativo','2022-10-20', 10),('Ativo','2022-10-17',5),('Inativo','2022-10-11',8),('Inativo','2022-05-05',9);

INSERT INTO Leitura (movimentEntrada, movimentSetor, fkSensor) VALUES
(0,1,1),(0,0,2),(1,1,3),(1,0,4),(1,1,5),(0,0,6),(0,1,7),(1,1,8),(1,0,9),(1,1,10);

-- SELECTS --
SELECT * FROM Endereco;
SELECT * FROM Estado;
SELECT * FROM Endereco 
	JOIN Estado ON fkEstado = idEstado; 
    
SELECT * FROM Empresa;
SELECT * FROM Empresa 
	JOIN Endereco ON fkEndereco = idEndereco;
    
SELECT * FROM Usuario;
SELECT * FROM Usuario 
	JOIN Empresa ON fkEmpresa = idEmpresa;
    
SELECT * FROM Setor;
SELECT * FROM Setor 
	JOIN Empresa ON fkEmpresa = idEmpresa;
    
SELECT * FROM Sensor;
SELECT * FROM Sensor 
	JOIN Setor ON fkSetor = idSetor;
    
SELECT * FROM Leitura;
SELECT * FROM Leitura 
	JOIN Sensor ON fkSensor = idSensor;
    
SELECT * FROM Leitura 
	JOIN Sensor ON fkSensor = idSensor
    JOIN Setor ON fkSetor = idSetor;
    
SELECT * FROM Estado AS est
	JOIN Endereco AS endco ON endco.fkEstado = est.idEstado
		JOIN Empresa AS emp ON emp.fkEndereco = endco.idEndereco
			JOIN Usuario AS usu ON usu.fkEmpresa = emp.idEmpresa
				JOIN Setor AS setor ON setor.fkEmpresa = emp.idEmpresa
					JOIN Sensor AS sens ON sens.fkSetor = setor.idSetor
						JOIN Leitura AS ler ON ler.fkSensor = sens.idSensor;  
                        
SELECT emp.nomeFantasia AS 'Nome da Empresa', emp.responsavel AS 'Responsável', 
		endco.cep AS 'CEP', endco.numero AS 'Número', 
		est.nomeEstado AS 'Estado',
        usu.nomeUsuario AS 'Usuário', usu.email AS 'E-mail', 
        setor.nomeSetor AS 'Setor', setor.prateleira AS 'Prateleira',
        sens.statusSensor AS 'Status sensor',
        ler.movimentEntrada AS 'Movimento entrada', ler.movimentSetor AS 'Movimento setor', ler.dtLeitura AS 'Data leitura' 
        FROM empresa AS emp
			JOIN Endereco AS endco ON  emp.fkEndereco = endco.idEndereco
				JOIN Estado AS est ON endco.fkEstado = est.idEstado
					JOIN Usuario AS usu ON usu.fkEmpresa = emp.idEmpresa
						JOIN Setor AS setor ON setor.fkEmpresa = emp.idEmpresa
							JOIN Sensor AS sens ON sens.fkSetor = setor.idSetor
								JOIN Leitura AS ler ON ler.fkSensor = sens.idSensor;

-- Todos as empresas e o seu maior fluxo de pessoas em algum setor
/*
SELECT emp.nomeFantasia AS 'Nome da Empresa', 
		setor.nomeSetor AS 'Nome setor',
		MAX(ler.movimentSetor) AS 'Movimento setor' FROM empresa AS emp
			JOIN Setor AS setor ON setor.fkEmpresa = emp.idEmpresa
				JOIN Sensor AS sens ON sens.fkSetor = setor.idSetor
					JOIN Leitura AS ler ON ler.fkSensor = sens.idSensor;       
*/