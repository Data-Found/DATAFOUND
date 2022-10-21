CREATE DATABASE dataFound;
USE dataFound;

-- CREATE TABLE --
CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(75) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    responsavel VARCHAR(100) NOT NULL,
    fkMatriz INT, CONSTRAINT fkIdMatriz 
    FOREIGN KEY (fkMatriz) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Endereco(
	idEndereco INT AUTO_INCREMENT,
    cep CHAR(8) NOT NULL, 
    numero VARCHAR(7) NOT NULL,
	fkEmpresa INT, CONSTRAINT fkIdEmpresa 
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    PRIMARY KEY(idEndereco, fkEmpresa)
);

CREATE TABLE Usuario(
	idUsuario INT AUTO_INCREMENT,
    nomeUsuario VARCHAR(75) NOT NULL,
    email VARCHAR(256) NOT NULL, CONSTRAINT chkEmailusuario CHECK (email LIKE '%@%'), 
    senha VARCHAR(25) NOT NULL, CONSTRAINT chkSenha CHECK (length(senha) > 5),
    fkEmpresa INT, CONSTRAINT ctfkIdEmpresa 
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    PRIMARY KEY(idUsuario, fkEmpresa)
);

CREATE TABLE Setor(
	idSetor INT AUTO_INCREMENT,
    nomeSetor VARCHAR(45) NOT NULL,
    maxSetor INT NOT NULL,
    fkEmpresa INT, CONSTRAINT fkIdEmpresaSetor
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    PRIMARY KEY(idSetor, fkEmpresa)
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
	idLeitura INT AUTO_INCREMENT,
    movimento BIT,
    dtLeitura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fkSensor INT, CONSTRAINT fkIdSensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY(idLeitura, fkSensor)
);

CREATE TABLE formContato(
	idFormContato int primary key AUTO_INCREMENT NOT NULL,
	nomeForm VARCHAR(75),
	emailForm VARCHAR(256),
	CONSTRAINT chkEmailusuarioForm CHECK (emailForm LIKE '%@%'),
	assunto VARCHAR(75),
	mensagem VARCHAR(500)
);

-- INSERTS  --

INSERT INTO Empresa (nomeFantasia, cnpj, responsavel, fkMatriz) VALUES
('Diogo e Laura Entregas Expressas','39892768000152','Laura', null), 
('Benedito e Filipe Informática','28136753000148','Benedito', null), 
('Hugo e Isaac Filmagens','34154793000115','Hugo', null), 
('Eliane e Danilo Financeira','14762677000171','Eliane', null), 
('Daiane e Vera Contábil','22505301000100','Vera', null),
('Benedito e Filipe Informática','28136753000148','Filipe', 2), 
('Jennifer e Sophie Telas','09426710000152','Sophie', null), 
('Emanuel e Isabella Publicidade e Propaganda','59342482000100','Isabella', null), 
('Hugo e Isaac Filmagens','34154793000115','Isaac', 4), 
('Ester e Eduarda Contábil','56218837000166','Eduarda', null);

INSERT INTO Endereco (cep, numero, fkEmpresa) VALUES
('33902110','10',1), ('72255524','13/15',2), ('69315685','55',3), ('78051902','103',4),
('07177038','502',5), ('69088746','200',6), ('69305070','23',7), ('41205185','100',8), ('78550017','H-1',9), ('02875100', 234, 10);

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

-- ADICIONANDO MAIS SETORES NUMA EMPRESA SÓ, PELO ID
INSERT INTO Setor (nomeSetor, maxSetor, fkEmpresa) VALUES
('Eletrônicos',14,1),('Instrumentos Musicais',10,1),('Presentes e Lembranças',10,1),('Jardinagem',10,1),('Quintal',12,1);

INSERT INTO Sensor (tipoSensor, statusSensor, dtInclusao, prateleira, fkSetor) VALUES
('EN','Ativo','2022-10-01','11-A',1),('PR','Inativo','2022-10-10','13-B',2),('EN','Ativo','2022-10-05','14-C',3),('PR','Inativo','2022-10-30','15-E',6),('EN','Ativo','2022-10-09','17-G',5),
('PR','Inativo','2022-10-28','20-A',2), ('PR','Ativo','2022-10-20','25-B', 10),('EN','Ativo','2022-10-17','F23',5),('PR','Inativo','2022-10-11','G-29',8),('EN','Inativo','2022-05-05','Z-14',9);

-- LEITURA dos sensores de setores
INSERT INTO Leitura (movimento, dtLeitura, fkSensor) VALUES
(1,'2022-10-01',1),(1,'2022-10-02',1),(1,'2022-10-03',1),(1,'2022-10-04',1),(1,'2022-10-05',1),(0,'2022-10-02',2),(1,'2022-10-03',3),
(0,'2022-10-01',4),(1,'2022-10-02',5),(0,'2022-10-03',6),(0,'2022-10-04',7),(1,'2022-10-05',8),(1,'2022-10-06',9),(1,'2022-10-07',10);

INSERT INTO formContato (nomeForm,emailForm,assunto,mensagem) VALUES
("Matheus Fernandes Rodrigues","Fernandes@gmail.com","Duvida","Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ab aperiam eligendi quis magnam dignissimos deserunt eveniet ex quo cumque recusandae!"),
("Matheus Leone","Leone@gmail.com","Como Funciona","Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore odit, aliquid a dolor aliquam quae perspiciatis eius, ut dolorum suscipit praesentium rem, excepturi magnam optio omnis. Rem praesentium enim repellendus quaerat, earum ipsum sint error nulla alias, ad fuga accusantium facilis recusandae ducimus architecto. Assumenda veniam voluptatem natus temporibus ipsa?"),
("Rebeca Lia","lia@gmail.com","Quero Fechar Negocio","Lorem ipsum dolor, sit amet consectetur adipisicing elit. Iure dolorem maxime iste ea quos officiis deserunt consequuntur inventore delectus perspiciatis, blanditiis doloremque, aut autem laboriosam vitae dolorum. Facilis consectetur necessitatibus ipsa perspiciatis voluptas ratione dignissimos iure vero harum earum. Minima commodi eveniet suscipit veniam id distinctio, eum odit voluptatibus porro sapiente eligendi earum maiores laboriosam corrupti quisquam incidunt dignissimos atque.");

-- SELECTS --
SHOW TABLES;
SELECT * FROM Empresa;
SELECT * FROM Endereco;
SELECT * FROM Leitura;
SELECT * FROM Sensor;
SELECT * FROM Setor;
SELECT * FROM Usuario;
SELECT * FROM formContato;

-- SELECTS COM JOINS --
-- EMPRESAS + ENDEREÇO --
SELECT * FROM Empresa 
	JOIN Endereco ON idEmpresa = fkEmpresa;
    
	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's --
	SELECT emp.idEmpresa AS 'ID da Empresa', emp.nomeFantasia AS 'Nome da Empresa', emp.cnpj AS 'CNPJ',  emp.responsavel AS 'Responsável', emp.fkMatriz as 'Filial da empresa:',
		endco.cep AS 'CEP', endco.numero AS 'Número' FROM Empresa AS emp
			JOIN Endereco AS endco ON emp.idEmpresa = endco.fkEmpresa;
    
-- USUÁRIO + EMPRESA --
SELECT * FROM Usuario 
	JOIN Empresa ON fkEmpresa = idEmpresa;
    
	SELECT usu.nomeUsuario AS 'Usuário', usu.email AS 'E-mail', 
	emp.nomeFantasia AS 'Empresa', emp.responsavel AS 'Responsável' 
		FROM Usuario AS usu JOIN Empresa AS emp ON fkEmpresa = idEmpresa;
    
-- SETOR + EMPRESA -- 
SELECT * FROM Setor 
	JOIN Empresa ON fkEmpresa = idEmpresa order by Setor.nomeSetor;
    
	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's --
	SELECT setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade máxima',
			emp.nomeFantasia AS 'Empresa', emp.cnpj AS 'CNPJ', emp.responsavel AS 'Responsável' FROM Setor AS setor
			JOIN Empresa AS emp ON setor.fkEmpresa = emp.idEmpresa;
            
-- EMPRESA E SEUS SETORES
SELECT * FROM Empresa JOIN Setor ON idEmpresa = fkEmpresa;

	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's --
    SELECT emp.nomeFantasia AS 'Empresa', seto.nomeSetor AS 'Setor', seto.maxSetor AS 'Capacidade Máxima'
		FROM Empresa AS emp JOIN Setor AS seto ON idEmpresa = fkEMpresa
			WHERE idEmpresa = 1;   -- SETORES DE UMA EMPRESA PELO ID

-- SENSOR + SETOR --
SELECT * FROM Sensor 
	JOIN Setor ON fkSetor = idSetor;
        
	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's -- 
	SELECT sensor.tipoSensor AS 'Tipo do Sensor', sensor.dtInclusao AS 'Data de inclusão', sensor.prateleira AS 'Prateleira',
			setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade máxima' FROM Sensor AS sensor
			JOIN Setor AS setor ON sensor.fkSetor = setor.idSetor;        
    
-- LEITURA + SENSOR --
SELECT * FROM Leitura 
	JOIN Sensor ON fkSensor = idSensor;
    
	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's --
	SELECT ler.movimento AS 'Movimento', ler.dtLeitura AS 'Data de leitura',
			sensor.tipoSensor AS 'Tipo do Sensor', sensor.dtInclusao AS 'Data de inclusão', sensor.prateleira AS 'Prateleira' FROM Leitura AS ler
			JOIN Sensor AS sensor ON ler.fkSensor = sensor.idSensor;
    
-- LEITURA + SENSOR + SETOR --
SELECT * FROM Leitura 
	JOIN Sensor ON fkSensor = idSensor
    JOIN Setor ON fkSetor = idSetor;
    
	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's --
	SELECT ler.movimento AS 'Movimento', ler.dtLeitura AS 'Data de leitura',
			sensor.tipoSensor AS 'Tipo do sensor', sensor.statusSensor AS 'Status do sensor', sensor.dtInclusao AS 'Data de inclusão', sensor.prateleira AS 'Prateleira',
			setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade máxima' FROM Leitura AS ler
				JOIN Sensor AS sensor ON ler.fkSensor = sensor.idSensor
					JOIN Setor AS setor ON sensor.fkSetor = setor.idSetor 
						WHERE sensor.statusSensor = 'Ativo';  -- FILTRO DE TODOS INSTALADOS E FUNCIONANDO
    
-- EMPRESA E SENSOR
SELECT * FROM Empresa 
	JOIN Setor ON idEmpresa = fkEmpresa;
    
	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's --
SELECT emp.nomeFantasia AS 'Nome', emp.cnpj AS 'CNPJ', emp.fkMatriz AS 'Filial de',
		setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade máxima' FROM Empresa AS emp
		JOIN Setor AS setor ON emp.idEmpresa = setor.fkEmpresa order by emp.nomeFantasia;
        
-- TODOS OS DADOS DOS SETORES, SENSORES E LEITURA --
SELECT * FROM Setor
	JOIN Sensor ON idSetor = fkSetor
		JOIN Leitura ON idSensor = fkSensor;
        
	-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's --
	SELECT setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade Máxima',
		sensor.tipoSensor AS 'Tipo do sensor', sensor.statusSensor AS 'Status do Sensor', sensor.dtInclusao AS 'Data da Instalação', sensor.prateleira AS 'Prateleira',
		ler.movimento AS 'Movimento', ler.dtLeitura as 'Data do Registro'
		FROM Setor AS setor
			JOIN Sensor AS sensor ON setor.idSetor = sensor.fkSetor
				JOIN Leitura AS ler ON sensor.idSensor = ler.fkSensor;
            
	-- SENSORES DE UMA EMPRESA --
	SELECT emp.nomeFantasia AS 'Empresa', 
			setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade Máxima',
			ler.movimento AS 'Movimento', ler.dtLeitura as 'Data do Registro'
				FROM Empresa AS emp
					JOIN Setor AS setor ON emp.idEmpresa = setor.fkEmpresa
						JOIN Sensor AS sensor ON setor.idSetor = sensor.fkSetor
							JOIN Leitura AS ler ON sensor.idSensor = ler.fkSensor
								WHERE idEmpresa = 1; -- ID DA EMPRESA QUE QUERO VER
            
-- O MESMO DO ACIMA, PORÉM SEM ID's e FK's e DATAS DE INSTALAÇÃO --
SELECT setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade Máxima',
	sensor.tipoSensor AS 'Tipo do sensor', sensor.statusSensor AS 'Status do Sensor', sensor.dtInclusao AS 'Data da Instalação', sensor.prateleira AS 'Prateleira',
    ler.movimento AS 'Movimento', ler.dtLeitura as 'Data do Registro' FROM Setor AS setor
		JOIN Sensor AS sensor ON setor.idSetor = sensor.fkSetor
			JOIN Leitura AS ler ON sensor.idSensor = ler.fkSensor;            
        
-- JOIN EM TODAS TABELAS --
SELECT * FROM Endereco AS endco
	JOIN Empresa AS emp ON endco.fkEmpresa = emp.idEmpresa
		JOIN Usuario AS usu ON usu.fkEmpresa = emp.idEmpresa
			JOIN Setor AS setor ON setor.fkEmpresa = emp.idEmpresa
				JOIN Sensor AS sens ON sens.fkSetor = setor.idSetor
					JOIN Leitura AS ler ON ler.fkSensor = sens.idSensor;  

-- JOIN EM TODAS TABELAS PARAMETRIZADA --
SELECT emp.nomeFantasia AS 'Nome da Empresa', emp.responsavel AS 'Responsável', 
		endco.cep AS 'CEP', endco.numero AS 'Número', 
        usu.nomeUsuario AS 'Usuário', usu.email AS 'E-mail', 
        setor.nomeSetor AS 'Setor', setor.maxSetor AS 'Capacidade Máxima',
        sensor.tipoSensor AS 'Tipo do sensor', sensor.statusSensor AS 'Status do Sensor', sensor.dtInclusao AS 'Data da Instalação', sensor.prateleira AS 'Prateleira',
        ler.movimento AS 'Movimento', ler.dtLeitura AS 'Data do Registro' FROM empresa AS emp
			JOIN Endereco AS endco ON  emp.idEmpresa = endco.fkEmpresa
				JOIN Usuario AS usu ON usu.fkEmpresa = emp.idEmpresa
					JOIN Setor AS setor ON setor.fkEmpresa = emp.idEmpresa
						JOIN Sensor AS sensor ON sensor.fkSetor = setor.idSetor
							JOIN Leitura AS ler ON ler.fkSensor = sensor.idSensor;
/*
-- EMPRESA COM MAIOR FLUXO DE PESSOAS EM DETERMINADO SETOR --
SELECT emp.nomeFantasia AS 'Nome da Empresa', 
		setor.nomeSetor AS 'Nome setor', setor.maxSetor AS 'Capacidade máxima',
		COUNT(ler.movimento) AS 'Movimento setor' FROM empresa AS emp
			JOIN Setor AS setor ON setor.fkEmpresa = emp.idEmpresa
				JOIN Sensor AS sensor ON sensor.fkSetor = setor.idSetor
					JOIN Leitura AS ler ON ler.fkSensor = sensor.idSensor;
*/