create database banco_filial;

create table filial(
	codigo_filial serial primary key,
	cnpj varchar(14) not null,
	nome_filial varchar(255) not null,
	cidade varchar(255) not null,
	estado varchar(10) not null
);