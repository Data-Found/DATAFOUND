create database datafound;
use datafound;

create table entradas (
identrada int primary key auto_increment,
data timestamp default current_timestamp,
setor varchar(20) not null,
constraint chkentradasetor check(setor in ('brinquedos', 'eletronicos', 'higiene','cama mesa e banho','alimentos e bebidas'))
) auto_increment = 10000;

select * from entradas;

insert into entradas (setor) values
('brinquedos'), ('eletronicos'), ('higiene'), ('cama mesa e banho'), ('alimentos e bebidas'), ('higiene'), ('eletronicos'), ('eletronicos');

select concat('O registro ', data, ' possui o id ', identrada, ' e foi no setor ', setor, '.') as Frase from entradas; 