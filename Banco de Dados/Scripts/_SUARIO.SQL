CREATE DATABASE datafound;
use datafound;
CREATE TABLE Usuario (
idUsuario int primary key auto_increment,
nomeUsuario varchar(75),
email varchar(256),
senha varchar(15),
fkEmpresa int
);
ALTER TABLE Usuario ADD constraint ctfkEmpresa foreign key(fkEmpresa) references Empresa(idEmpresa);

