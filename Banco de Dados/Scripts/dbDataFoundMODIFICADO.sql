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
    maxSetor INT NOT NULL,
    fkEmpresa INT, CONSTRAINT fkIdEmpresaSetor
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipoSensor CHAR(2) NOT NULL, CONSTRAINT chktipoSensor CHECK (tipoSensor IN('EN','PR')),
    statusSensor VARCHAR(25) NOT NULL, CONSTRAINT chkSensor CHECK (statusSensor IN('Ativo','Inativo','Manutenção')),
    dtInclusao DATE NOT NULL,
    prateleira VARCHAR(25),
    fkSetor INT, CONSTRAINT fkIdSetor FOREIGN KEY (fkSetor) REFERENCES Setor(idSetor)
);

CREATE TABLE Leitura(
	idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    movimento BIT,
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

INSERT INTO Setor (nomeSetor, maxSetor, fkEmpresa) VALUES
('Eletrodomésticos',11,1), ('Vestuário',24,2), ('Alimentos',12,3), ('Calçados',17,4), ('Têxtil',16,5), 
('Móveis',26,6), ('Eletrônicos',10,7), ('Brinquedos',14,8), ('Linha lar',18,9), ('Colchões',23,10);

INSERT INTO Sensor (tipoSensor, statusSensor, dtInclusao, prateleira, fkSetor) VALUES
('EN','Ativo','2022-10-01','11-A',1),('PR','Inativo','2022-10-10','13-B',2),('EN','Ativo','2022-10-05','14-C',3),('PR','Inativo','2022-10-30','15-E',6),('EN','Ativo','2022-10-09','17-G',5),
('PR','Inativo','2022-10-28','20-A',2), ('PR','Ativo','2022-10-20','25-B', 10),('EN','Ativo','2022-10-17','F23',5),('PR','Inativo','2022-10-11','G-29',8),('EN','Inativo','2022-05-05','Z-14',9);

-- LEITURA dos sensores de setores
INSERT INTO Leitura (movimento, dtLeitura, fkSensor) VALUES
(1,'2022-10-01',1),(0,'2022-10-02',2),(1,'2022-10-03',3),(0,'2022-10-01',4),(1,'2022-10-02',5),(0,'2022-10-03',6),(0,'2022-10-04',7),(1,'2022-10-05',8),(1,'2022-10-06',9),(1,'2022-10-07',10);

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
    
-- EMPRESA E SENSOR
SELECT * FROM Empresa 
	JOIN Setor ON idEmpresa = fkEmpresa;
    
-- SETORES E SENSORES
SELECT * FROM Setor 
	JOIN Sensor ON idSetor = fkSetor;

-- TODOS OS DADOS DOS SETORES, SENSORES E LEITURA
SELECT * FROM Setor
	JOIN Sensor ON idSetor = fkSetor
		JOIN Leitura ON idSensor = fkSensor;
        
-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's
SELECT seto.nomeSetor AS 'Setor', seto.prateleira AS 'Prateleira',
	sens.statusSensor AS 'On/Off', sens.dtInclusao AS 'Data da Instalação',
    lei.movimentEntrada AS 'Entrada do Setor', lei.movimentSetor AS 'Leitura das Prateleiras', lei.dtLeitura as 'Registro'
    FROM Setor AS seto
		JOIN Sensor AS sens ON seto.idSetor = sens.fkSetor
			JOIN Leitura AS lei ON sens.idSensor = lei.fkSensor;
            
-- SENSORES DE UMA EMPRESA
SELECT emp.razaoSocial AS 'Empresa', seto.nomeSetor AS 'Setor', seto.prateleira AS 'Prateleira',
lei.movimentEntrada AS 'Entrada do Setor', lei.movimentSetor AS 'Leitura das Prateleiras', lei.dtLeitura AS 'Registro'
    FROM Empresa AS emp
		JOIN Setor AS seto ON emp.idEmpresa = fkEmpresa
			JOIN Sensor AS sens ON seto.idSetor = fkSetor
				JOIN Leitura AS lei ON sens.idSensor = lei.fkSensor
					where idEmpresa = 9; -- ID DA EMPRESA QUE QUERO VER
            
-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's e DATAS DE INSTALAÇÃO
SELECT seto.nomeSetor AS 'Setor', seto.prateleira AS 'Prateleira',
	sens.statusSensor AS 'Conexão',
    lei.movimentEntrada AS 'Entrada do Setor', lei.movimentSetor AS 'Leitura das Prateleiras', lei.dtLeitura as 'Registro'
    FROM Setor AS seto
		JOIN Sensor AS sens ON seto.idSetor = sens.fkSetor
			JOIN Leitura AS lei ON sens.idSensor = lei.fkSensor;            
        
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