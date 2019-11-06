drop database if exists Curso;
create database Curso
default collate utf8_general_ci
default character set utf8;

use Curso;

drop table if exists Usuario;
create table if not exists Usuario(
	idUsuario int unsigned not null primary key auto_increment,
	nome varchar(50) not null,
	email varchar(60) not null,
	senha varchar(32) not null,
	hashToken varchar(32),
	timeToken timestamp
) default charset = utf8 engine = InnoDB;
  
insert into Usuario (nome, email, senha) values 
('Lucas', 'lucasferreira9b@gmail.com', MD5(5163131)); 

drop table if exists Cursos;
create table if not exists Cursos(
	idCurso int unsigned not null auto_increment primary key,
	sobre text,
	cargaHoraria timestamp not null
) default charset = utf8 engine = InnoDB;

insert into Cursos (idCurso, sobre, cargaHoraria) values
(1, 'asdasdasdasd', '2019-09-24');

drop table if exists Videos;        
create table if not exists Videos(
	idVideo int not null primary key,
	idCurso int unsigned not null,
	tempo time not null,
	tema varchar (15) not null,
    	constraint FK_CURSO_CURSOS_IDCURSO foreign key(idCurso) references Cursos(idCurso)
) default charset = utf8 engine = InnoDB;

drop table if exits UsuarioCursa;
create table if not exists UsuarioCursa(
	idUS int unsigned not null auto_increment primary key,
	idCurso int unsigned not null,
    	idUsuario int unsigned not null,
	constraint FK_IDCURSO_CURSO_IDCURSO foreign key (idCurso) references Curso (idCurso),
	constraint FK_IDCURSO_USUARIO_IDUSUARIO foreign key (idUsuario) references Usuario (idUsuario)
) default charset = utf8 Engine = InnoDB ;
