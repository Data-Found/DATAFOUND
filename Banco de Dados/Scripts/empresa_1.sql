create table Empresa (
	idEmpresa int primary key auto_increment,
    razaoSocial varchar(75),
    nomeFantasia varchar(75),
    cnpj char(14),
    responsavel varchar(100),
    dd varchar(3),
    celular char(9),
    fkEndereco int,
		constraint ctfkEndereco foreign key (fkEndereco) references cliente(idEndereco)
);

insert into Empresa values
(null, 'Lojas Ed LTDA', 'Ednalva Lojas', 00000000000100, 'Ednalva Andrade Soares', 11, 987878787, null),
(null, 'JF Lojas do Brasil', 'JF Lojas', 01230000000100, 'Jonas Serafim Borges', 11, 956565656, null),
(null, 'Rebeca Corporation LTDA', 'Rebeca Utilidades', 00000000000100, 'Ednalva Andrade Soares', 11, 969696969, null);
