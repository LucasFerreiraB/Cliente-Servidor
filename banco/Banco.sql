drop database if exists cursos;
create database cursos
default collate utf8_general_ci
default character set utf8;

use cursos;

drop table if exists Usuario;
create table if not exists Usuario(
	IdUsuario bigint unsigned not null primary key auto_increment,
	Nome varchar(50) not null,
	Email varchar(60) not null,
	Senha varchar(32) not null,
	hashtoken varchar(32),
	Timetoken timestamp
)default charset = utf8 engine = InnoDB;
  
insert into Usuario (Nome, Email, Senha) values 
('Lucas', 'lucasferreira9b@gmail.com', MD5(5163131)); 

drop table if exists Cursos;
create table if not exists Cursos(
	idCurso bigint unsigned not null auto_increment primary key,
	Sobre text,
	CargaHoraria timestamp not null
)default charset = utf8 engine = InnoDB;

insert into Cursos (idCurso, Sobre, CargaHoraria) values
(1, 'asdasdasdasd', '2019-09-24');

drop table if exists Videos;        
create table if not exists Videos(
	idVideo bigint not null primary key,
	curso bigint unsigned not null,
	Tempo time not null,
	Tema varchar (15) NOT null,
    foreign key(curso) references Cursos(idCurso)
)default charset = utf8 engine = InnoDB;

