
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
(8,'Harris','aharris7@ucoz.com','Feminino','Roupas','8/12/2003',84427,'Safety Technician I',1);


--  AUTO INCREMENT EM POSTGREESQL
-- TENTE IFORMAR NA PRIMARY KEY UM SELECT QUE RETORNA A QUANTIDADE DE REGISTROS MAIS 1
--  LEMBRANDO QUE DA APENAS PARA FAZER UMA INSERSAO DE CADA VEZ
--  A NAO SER QUE FACA [ COUNT+1, COUNT+2, COUNT+3...  ]
insert into funcionarios values  (((select count(*) from funcionarios)+1),'fesf','fsef@ucoz.com','Feminino','Roupas','8/12/2003',84427,'Safety Technician I',1);

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

--  TRIGGERS


--  CRIANDO TABELA PARA TESTE

select session_user; -- usuario atual


create table funcionariosLogOperation(
  idFunction integer PRIMARY KEY,
  actualUser char(10),
  operation varchar(20),
  dateOperation date
);

/*
Triggers são similar a views, mas podem realizar operações podendo ser executadas 
automaticamente antes ou depois de uma operação


CRIANDO UMA TRIGGER

CREATE OR REPLACE FUNCTION funcaoNome() -- crie ou substitua a funcao
RETURNS trigger -- retorne uma trigger
AS $$ -- delimitador padrao postgreesql
    begin
        
        SEUS COMANDOS DE SQL
          
          
        return NEW; -- TRABALHANDO COM NEW OU OLD
    end;
$$ LANGUAGE plpgsql; -- LINGUGAGEM USADA
 
CREATE TRIGGER nomeTrigger 
(BEFORE/AFTER) (INSERT/UPDATE/DELETE) ON tabelaNome 
    FOR EACH ROW EXECUTE PROCEDURE funcaoNome();
    
    
    

USE THE OPTIONS "BEFORE OR AFTER" FOR RUN THE COMMAND BEFORE OR AFTER AN ACTION

use a opcao "INSERT OR UPDATE OR DELETE" para selecionar a acao para ser 'assistida' 
pela trigger


Note: o "OLD" pode ser para retornar valores dos registros antes de serem mudados  (depois do delete ou update)
esse comando ou parametro retorna o valor antigo

o "NEW" serve para registros depois de serem mudados (depois do update ou INSERT) esse comando ou parametro 
retorna o valor novo

veja todos os aspectos no exemplo abaixo
*/

CREATE OR REPLACE FUNCTION funcionariosLogfunction()
RETURNS trigger
AS $$
    begin
        insert into funcionariosLogOperation values(
          ((select count(*) from funcionariosLogOperation)+1),
          (select session_user),
          'INSERT',
          (select SPLIT_PART((CAST(now() AS TEXT)),'.',1))
          );
          
        return NEW; 
    end;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER executeFuncionariosLogOperation
AFTER INSERT ON funcionarios
    FOR EACH ROW EXECUTE PROCEDURE funcionariosLogfunction();
    
    
    
insert into funcionarios (((select count(*) from funcionarios)+1), 'Roger','roger@sciencedirect.com',
                          'Masculino', 'Automotivo','5/12/2003',2500,'Mecanico',2)


select * from funcionariosLogOperation;



