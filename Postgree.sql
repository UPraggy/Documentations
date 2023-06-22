
-- ################################# DATE ###########################################

-- Postegree tem um Problema com datas
-- Tem que ver o padrão de datas -> show datestyle; -> datastyle DD/MM/YYYY
-- Para setar o datestyle -> Postegreesql.conf -> procure por datestyle e substituia pelo padrão desejado
--  lembre de resetar o serviço do banco


create table departamentos (
    departamento varchar(100),
    divisao varchar(100),
    primary key (departamento)
  );
  
insert into departamentos values 
('Automotivo','Auto & Hardware'),
('Bebês','Casa e Afins'),
('Beleza','Casa e Afins'),
('Roupas','Casa e Afins');


create table localizacao (
   idRegiao int,
   localizacao varchar(20),
   pais varchar(20),
   primary key (idRegiao)
  );

insert into localizacao values 
(1,'Nordeste', 'Brasil'),
(2, 'Sudeste', 'Brasil');



create table funcionarios
  (
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao date,
      salario integer,
      cargo varchar(100),
      idRegiao int,
      primary key (idFuncionario)
  );

insert into funcionarios values 
(1,'Kelley','rkelley0@soundcloud.com','Feminino','Automotivo','10/2/2009',67470,'Structural Engineer',2),
(2,'Armstrong','sarmstrong1@infoseek.co.jp','Masculino','Bebês','3/31/2008',71869,'Financial Advisor',2),
(3,'Carr','fcarr2@woothemes.com','Masculino','Automotivo','7/12/2009',101768,'Recruiting Manager',1),
(4,'Murray','jmurray3@gov.uk','Feminino','Bebês','12/25/2014',67470,'Desktop Support Technician',2),
(5,'Ellis','jellis4@sciencedirect.com','Feminino','Beleza','9/19/2002',63702,'Software Engineer III',1),
(6,'Phillips','bphillips5@time.com','Masculino','Roupas','8/21/2013',118497,'Executive Secretary',1),
(7,'Williamson','rwilliamson6@ted.com','Masculino','Beleza','5/14/2006',67470,'Dental Hygienist',2),
(8,'Harris','aharris7@ucoz.com','Feminino','Roupas','8/12/2003',84427,'Safety Technician I',1),
(9,'fesf','fsef@ucoz.com','Feminino','Roupas','8/12/2003',84427,'Safety Technician I',1);

-- ############################# CONTANDO E OPERACOES #############################
-- Contando
select count(*) as "quantidade de funcionarios" from funcionarios;

select count(*) as "funcs departamento beleza" from funcionarios where departamento = 'Beleza';

--  Contando por agregação

select sexo, count(*) as "quantidade de funcionarios" from funcionarios
group by sexo;


-- retornando o funcionario com maximo de salario e o minimo

select nome, salario from funcionarios 
where salario = (select max(salario) from funcionarios) or
salario = (select min(salario) from funcionarios)
order by salario desc;

-- retornando Media

select round(avg(salario),1) as "MEDIA" from funcionarios;


-- RETORNANDO SOMA
select sum(salario) from funcionarios;

-- MODA
select salario, count(salario) as "MODA" from funcionarios
group by salario
order by 2 desc
limit 3;

-- AMPLITUDE

select max(salario) - min(salario) as "AMPLITUDE" from funcionarios;

-- DESVIO PADRAO E VARIANCIA

select round(stddev_pop(salario),2) as "DESVIO PADRAO",
round(var_pop(salario),2) as "VARIANCIA"
from funcionarios;

-- MEDIANA google






-- ############################# LIMITANDO LINHAS ####################

select nome, salario from funcionarios
order by salario desc
limit 3;
