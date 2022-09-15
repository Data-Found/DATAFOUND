create database datafound;
use datafound;

create table usuario (
idUsuario int primary key auto_increment,
nomeEmpresa varchar(30) NOT NULL,
cnpj varchar(14) NOT NULL,
emailLogin varchar(40) NOT NULL,
senha varchar(64) NOT NULL,
responsavel varchar(40) NOT NULL,
emailContato varchar(50) UNIQUE NOT NULL
) auto_increment = 50000;

INSERT INTO usuario (idUsuario, nomeEmpresa, cnpj, emailLogin, senha, responsavel, emailContato) VALUES
(null,'DataFound', '02445796650001', 'datafound@empresa.tech', '#Gf79124687', 'Matheus Leone', 'leone@gmail.com');

SELECT * FROM usuario;

select concat('O cadastro do email ', emailLogin, ' foi efetuado com sucesso ', '.') as Frase from entradas; 