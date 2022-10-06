create table Endereco(
idEndereco int primary key auto_increment,
cidade varchar(45),
logradouro varchar(45),
bairro varchar(75),
cep char(8),
numero varchar(7),
complemento varchar(50),
 fkEstado int, constraint ctfkEstado foreign key Estado(fkEstado) references Estado(idEstado));

create table Estado(
idEstado int primary key auto_increment,
nomeEstado varchar(45),
sigla char(2));






