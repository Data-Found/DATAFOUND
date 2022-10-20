CREATE DATABASE datafoundTest;
use datafoundTest;
CREATE TABLE Sensor (idSensor int primary key auto_increment,
 situacao varchar(25),
 dtInclusao date,
 fkSetor int );
CREATE TABLE Leitura(idLeitura int primary key,
 movimentEntrada bit,
 dtLeitura timestamp,
 fkSensor int);
ALTER TABLE Leitura ADD CONSTRAINT ctfkSensor foreign key(fkSensor) references Sensor(idSensor);
SELECT * FROM Leitura;
SELECT * FROM Sensor;
INSERT INTO Sensor (situacao,dtInclusao,fkSetor) values
('on','2022-10-18',2),
('off','2022-10-18',2),
('on','2022-10-18',2),
('on','2022-10-18',2),
('on','2022-10-18',1),
('on','2022-10-18',1),
('on','2022-10-18',1),
('off','2022-10-18',1)
;
insert into Leitura (idLeitura, movimentEntrada, dtLeitura, fkSensor) values
(4,1,'2022-10-18 09:32:25',2),
(2,0,'2022-10-18 09:35:10',2),
(3,1,'2022-10-18 09:31:31',4),
(5,1,'2022-10-18 09:32:45',5);


