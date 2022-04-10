CREATE DATABASE alfa_prova_desenvolvimento;

create table tab_estado(
	codigo_estado serial primary key,
	nome_estado varchar(200) not null,
	sigla varchar(3) not null
);

create table tab_cidade(
	codigo_cidade serial primary key,
	nome_cidade varchar(200) not null,
	fk_codigo_estado integer not null,
	foreign key(fk_codigo_estado) references tab_estado(codigo_estado)
);

create table tab_filial(
	codigo_filial serial primary key,
	cnpj varchar(14) not null,
	nome_filial varchar(200) not null,
	fk_codigo_cidade int not null,
	foreign key(fk_codigo_cidade) references tab_cidade(codigo_cidade) 
);

create table tab_departamento(
	codigo_departamento serial primary key,
	nome_departamento varchar(200) not null
);

create table tab_departamento_filial(
	codigo_dep_filial serial primary key,
	fk_codigo_departamento int not null,
	fk_codigo_filial int not null,
	foreign key(fk_codigo_departamento) references tab_departamento(codigo_departamento),
	foreign key(fk_codigo_filial) references tab_filial(codigo_filial)
);

create table tab_colaborador(
	cpf bigint not null UNIQUE,
	nome_colaborador varchar(255) not null,
	genero char not null,
	data_adimissao date not null,
	salario numeric(15,2) not null,
	fk_codigo_dep_filial int not null,
	foreign key(fk_codigo_dep_filial) references tab_departamento_filial(codigo_dep_filial)	
);


insert into tab_estado(nome_estado, sigla) values
('Santa Catarina', 'SC'),
('Paraná','PR'),
('São Paulo', 'SP'),
('Minas Gerais', 'MG'),
('Rio Grande do Sul', 'RS'),
('Mato Grosso do Sul', 'MS'),
('Goias', 'GO'),
('Espirito Santo', 'ES'),
('Rio de Janeiro', 'RJ');


insert into tab_cidade(nome_cidade, fk_codigo_estado) values
('Caçador', 1),
('Curitiba', 2),
('Guarulhos', 3),
('Betim', 4),
('Cachoeirinha', 5),
('Tres Lagoas', 6),
('Goiania', 7),
('Serra', 8),
('Rio de Janeiro', 9);

insert into tab_filial(cnpj, nome_filial, fk_codigo_cidade) values
('82110818000121', 'ALFA TRANSPORTES EIRELI', 1),
('82110818000202', 'ALFA TRANSPORTES EIRELI', 2),
('82110818000393', 'ALFA TRANSPORTES EIRELI', 3),
('82110818001608', 'ALFA TRANSPORTES EIRELI', 4),
('82110818000806', 'ALFA TRANSPORTES EIRELI', 5),
('82110818002760', 'ALFA TRANSPORTES EIRELI', 6),
('82110818002094', 'ALFA TRANSPORTES EIRELI', 7),
('82110818002507', 'ALFA TRANSPORTES EIRELI', 8),
('82110818002841', 'ALFA TRANSPORTES EIRELI', 9);

insert into tab_departamento(nome_departamento) values
('Expedição'),
('SAC'),
('Operacional'),
('Adminiistrativo'),
('Gerência');

insert into tab_departamento_filial(fk_codigo_departamento, fk_codigo_filial) values
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9);

insert into tab_colaborador(cpf, nome_colaborador, genero, data_adimissao, salario, fk_codigo_dep_filial) values
(12345678990, 'Paulo', 'M', '2019-01-18', 1900.00, 1),
(12673458990, 'André', 'M', '2020-01-18', 1700.00, 2),
(34589901267, 'Sará', 'F', '2020-06-18', 1600.00, 4),
(45678991230, 'Saulo', 'M', '2012-10-04', 2450.00, 8),
(14582673990, 'Andrei', 'M', '2020-01-18', 3600.00, 10),
(39901267458, 'Osvaldo', 'M', '2020-06-18', 1650.00, 6),
(67899123045, 'Carlos', 'M', '2017-10-03', 3100.00, 12),
(13990458267, 'Osilda', 'F', '2022-01-11', 3600.00, 13),
(39974580126, 'Maria', 'F', '2020-12-12', 1850.00, 14),
(67123045899, 'Paulo', 'M', '2022-04-12', 2000.00, 19),
(58213990467, 'Uriel', 'M', '2022-01-11', 3900.00, 16),
(39580197426, 'Tales', 'M', '2020-12-12', 2050.00, 20),
(63045897129, 'Ana', 'F', '2015-03-12', 1900.00, 22),
(65897129304, 'Daniel', 'M', '2014-10-11', 2900.00, 23),
(19742395806, 'Ozias', 'M', '2010-11-09', 1050.00, 21),
(63089745129, 'Rafaela', 'F', '2021-01-11', 1500.00, 41),
(65129897304, 'Pedro', 'M', '2016-04-26', 3500.00, 43),
(23958746019, 'Ana Paula', 'M', '2019-11-03', 2150.00, 45),
(63451208979, 'Rafael', 'M', '2017-12-10', 1500.00, 26),
(51298973604, 'Araujo', 'M', '2019-08-11', 1500.00, 28),
(23019958746, 'Anderson', 'M', '2016-06-25', 2180.00, 30),
(45120897639, 'Gabriela', 'F', '2007-12-10',4500.00, 35),
(51260498973, 'Osni', 'M', '2018-06-05', 2500.00, 33),
(27430199586, 'Rafaela', 'F', '2019-02-10', 1180.00, 31),
(45127639089, 'Ariel', 'F', '2017-02-15', 2500.00, 38),
(49811260973, 'Jardel', 'M', '2016-05-05', 2600.00, 39),
(27430195869, 'Anabele', 'F', '2016-06-06', 2280.00, 37);



create view questao7 as select c.cpf, c.nome_colaborador, ci.nome_cidade, d.nome_departamento from tab_colaborador c
left join tab_departamento_filial df on df.codigo_dep_filial =  c.fk_codigo_dep_filial
left join tab_filial f on f.codigo_filial = df.fk_codigo_filial
left join tab_cidade ci on ci.codigo_cidade = f.fk_codigo_cidade
left join tab_departamento d on d.codigo_departamento = df.fk_codigo_departamento
order by f.codigo_filial, c.nome_colaborador;


create view questao8 as select c.cpf, c.nome_colaborador, c.data_adimissao, ci.nome_cidade from tab_colaborador c
left join tab_departamento_filial df on df.codigo_dep_filial =  c.fk_codigo_dep_filial
left join tab_filial f on f.codigo_filial = df.fk_codigo_filial
left join tab_cidade ci on ci.codigo_cidade = f.fk_codigo_cidade
order by c.data_adimissao
limit 5;


create view questao9 as select f.codigo_filial, ci.nome_cidade, count(*) as quant_colaborador from tab_colaborador c
left join tab_departamento_filial df on df.codigo_dep_filial =  c.fk_codigo_dep_filial
left join tab_filial f on f.codigo_filial = df.fk_codigo_filial
left join tab_cidade ci on ci.codigo_cidade = f.fk_codigo_cidade
left join tab_departamento d on d.codigo_departamento = df.fk_codigo_departamento
group by f.codigo_filial , ci.nome_cidade
order by f.codigo_filial;

create view questao10 as select d.codigo_departamento, d.nome_departamento, round(avg(c.salario), 2) as media from tab_colaborador c 
left join tab_departamento_filial df on df.codigo_dep_filial =  c.fk_codigo_dep_filial
left join tab_departamento d on d.codigo_departamento = df.fk_codigo_departamento
group by d.codigo_departamento
order by media;