										#####################################
										##################MYSQL##############
										#####################################


/*Creating database*/

CREATE DATABASE EXAMPLE;
/*OBS not forgot of semilicon in end of command*/

/*USING DATABASE*/
#USE BANK_ATUAL
USE EXAMPLE;


#CREATING TABLE

CREATE TABLE CLIENT(
	NAME VARCHAR(30),
	SEX CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	PHONENUMBER VARCHAR(30),
	ADDRESS VARCHAR(100)
);

# DELETING TABLES
DROP TABLE CLIENT;
#CHECKING THE TABLES IN THE DATABASE

SHOW TABLES;

#FIGURING OUT HOW IS THE TABLE STRUCTURE

DESC CLIENT;

#INSERTING THE REGISTERS IN THE TABLE

INSERT INTO CLIENT VALUES ('JOAO','M','JOAO@GMAIL.COM',9988638273,'22923110','MARIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

#ENTERING THE RECORDS INTO THE TABLE, BUT DESCRIBING WHICH COLUMNS WE WANT

INSERT INTO CLIENT(NAME,SEX,ADDRESS,PHONENUMBER,CPF) VALUES ('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

# ENTERING THE RECORDS INTO THE TABLE COMPRESSING THE COMMANDS  

INSERT INTO CLIENT VALUES ('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
						('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG'),
						('JORGE','M','JORGE@GMAIL.COM',1068658273,'36952120','ALTAIR DE LIMA SOARES - PRADO - MINAS GERAIS');
#SELECTING RECORDS


SELECT NOW(); #ACTUAL DATE/hour
/*
+-------------------+
|       NOW()   	|
+-------------------+
|2020-10-20 10:13:50|
+-------------------+
*/

SELECT NOW() as DATE_HOUR;
/*
+-------------------+
|     DATE_HOUR  	|
+-------------------+
|2020-10-20 10:13:50|
+-------------------+
*/

#SELECT COLUMNS

SELECT NAME, SEX, EMAIL 
FROM CLIENT;
/*
+-------------------+----------+------------------------+
|       NAME     	|   SEX	   |         EMAIL          |
+-------------------+----------+------------------------+
|       JOAO        |    M     |   JOAO@GMAIL.COM       |
+-------------------+----------+------------------------+
|       LILIAN      |    F     |        NULL            |
+-------------------+----------+------------------------+
|       ANA         |    F     |   ANA@GLOBO.COM        |
+-------------------+----------+------------------------+
|       CARLA       |    F     |   CARLA@TERATI.COM.BR  |
+-------------------+----------+------------------------+
|       JORGE       |    M     |   JORGE@GMAIL.COM      |
+-------------------+----------+------------------------+
*/

SELECT NAME as CLIENT, SEX, EMAIL 
FROM CLIENT;

/*
+-------------------+----------+------------------------+
|      CLIENT    	|   SEX	   |         EMAIL          |
+-------------------+----------+------------------------+
|       JOAO        |    M     |   JOAO@GMAIL.COM       |
+-------------------+----------+------------------------+
|       LILIAN      |    F     |        NULL            |
+-------------------+----------+------------------------+
|       ANA         |    F     |   ANA@GLOBO.COM        |
+-------------------+----------+------------------------+
|       CARLA       |    F     |   CARLA@TERATI.COM.BR  |
+-------------------+----------+------------------------+
|       JORGE       |    M     |   JORGE@GMAIL.COM      |
+-------------------+----------+------------------------+
*/

			# DON'T IS RECOMMENDED USE THIS COMMAND, BECAUSE IT USE MUCH PROCESSAMENT
SELECT * 
FROM CLIENT;

/*
+-------------------+----------+------------------------+------------+---------------+---------------------------------------------+
|      NAME     	|   SEX	   |         EMAIL          |    CPF     | PHONENUMBER |                  ADDRESS                      |   
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       JOAO        |    M     |   JOAO@GMAIL.COM       | 9988638273 |  22923110   | MARIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       LILIAN      |    F     |        NULL            | 887774856  |  947785696  | SENADOR SOARES - TIJUCA - RIO DE JANE- RJ |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       ANA         |    F     |   ANA@GLOBO.COM        | 85548962   | 548556985   | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       CARLA       |    F     |   CARLA@TERATI.COM.BR  | 7745828	 | 66587458    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       JORGE       |    M     |   JORGE@GMAIL.COM      | 1068658273 | 36952120    | ALTAIR DE LIMA SOARES - PRADO - MINAS GERAIS  |                     
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
*/

SELECT NAME as CLIENT, SEX, EMAIL, NOW() as DATE_HOUR 
FROM CLIENT;

/*
+-------------------+----------+------------------------+-------------------+
|      CLIENT    	|   SEX	   |         EMAIL          |     DATE_HOUR  	|
+-------------------+----------+------------------------+-------------------+
|       JOAO        |    M     |   JOAO@GMAIL.COM       |2020-10-20 10:13:50|
+-------------------+----------+------------------------+-------------------+
|       LILIAN      |    F     |        NULL            |2020-10-20 10:13:50|
+-------------------+----------+------------------------+-------------------+
|       ANA         |    F     |   ANA@GLOBO.COM        |2020-10-20 10:13:50|
+-------------------+----------+------------------------+-------------------+
|       CARLA       |    F     |   CARLA@TERATI.COM.BR  |2020-10-20 10:13:50|
+-------------------+----------+------------------------+-------------------+
|       JORGE       |    M     |   JORGE@GMAIL.COM      |2020-10-20 10:13:50|
+-------------------+----------+------------------------+-------------------+
*/

								# PROJECTION -> SELECT
								# SELECTION -> WHERE

								# FILTERING

SELECT NAME, SEX 
FROM CLIENT 
WHERE SEX = 'M';

/*
+-------------------+----------+
|      CLIENT    	|   SEX	   |
+-------------------+----------+
|       JOAO        |    M     |
+-------------------+----------+
|       JORGE       |    M     |
+-------------------+----------+
*/

SELECT NAME, SEX 
FROM CLIENT 
WHERE ADDRESS LIKE '%RJ';

/*
+-------------------+----------+
|      NAME     	|   SEX	   |
+-------------------+----------+
|       JOAO        |    M     |
+-------------------+----------+
|       LILIAN      |    F     |
+-------------------+----------+
*/


SELECT NAME, SEX 
FROM CLIENT 
WHERE SEX = 'F' AND 
ADDRESS LIKE '%RJ';

/*
+-------------------+----------+
|      NAME     	|   SEX	   |
+-------------------+----------+
|       LILIAN      |    F     |
+-------------------+----------+
*/

						/* OBS.: TRY SEARCH THE REGISTER ORDER BY THE MOST EFFICIENT FILTER 
						EXAMPLE:
						ONE TABLE HAS 800 RECORDS WITH ADDRESS CONTAINING 'RJ'
						AND THIS SAME TABLE HAS 60 RECORDS WITH SEX EQUAL TO F

						THE PREFERENCE IS FILTER THE RECORDS FIRST BY SEX AND AFTER BY ADDRESS

						THIS METHOD CHANGE WHEN USE CLAUSE 'OR' DIFFER OF AND
						SELECT NAME, SEX 
						FROM CLIENT            <-- THIS METHOD IS BETTER
						WHERE SEX = 'F' AND 
						ADDRESS LIKE '%RJ';

						SELECT NAME, SEX 
						FROM CLIENT            <-- THIS METHOD IS NOT GOOD
						WHERE ADDRESS LIKE '%RJ' AND 
						SEX = 'F';
						*/

							# COUNT OPERATOR

SELECT COUNT(*) AS QUANTITY_RECORDS 
FROM CLIENT;


/*
+----------------------------+
|      QUANTITY_RECORDS      |
+----------------------------+
|             5              |
+----------------------------+
*/


								# AGREGATION 

SELECT SEX, COUNT(*) AS QUANTITY_RECORDS 
FROM CLIENT 
GROUP BY SEX;


/*
+----------+----------------------------+
|   SEX	   |      QUANTITY_RECORDS      |
+----------+----------------------------+
|    F     |             3              |
+----------+----------------------------+
|    M     |             2              |
+----------+----------------------------+
*/

# FILTERING NULL VALUES


SELECT NAME, SEX 
FROM CLIENT 
WHERE EMAIL IS NULL;

/*
+-------------------+----------+
|      CLIENT    	|   SEX	   |
+-------------------+----------+
|       LILIAN      |    F     |
+-------------------+----------+
*/

SELECT NAME, SEX 
FROM CLIENT 
WHERE EMAIL IS NOT NULL;

/*
+-------------------+----------+
|      CLIENT    	|   SEX	   |
+-------------------+----------+
|       JOAO        |    M     |
+-------------------+----------+
|       ANA         |    F     |
+-------------------+----------+
|       CARLA       |    F     |
+-------------------+----------+
|       JORGE       |    M     |
+-------------------+----------+

*/

										# UPDATE RECORDS

SELECT * 
FROM CLIENT;

/*
+-------------------+----------+------------------------+------------+---------------+---------------------------------------------+
|      NAME     	|   SEX	   |         EMAIL          |    CPF     | PHONENUMBER |                  ADDRESS                      |   
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       JOAO        |    M     |   JOAO@GMAIL.COM       | 9988638273 |  22923110   | MARIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       LILIAN      |    F     |        NULL            | 887774856  |  947785696  | SENADOR SOARES - TIJUCA - RIO DE JANE- RJ |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       ANA         |    F     |   ANA@GLOBO.COM        | 85548962   | 548556985   | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       CARLA       |    F     |   CARLA@TERATI.COM.BR  | 7745828	 | 66587458    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       JORGE       |    M     |   JORGE@GMAIL.COM      | 1068658273 | 36952120    | ALTAIR DE LIMA SOARES - PRADO - MINAS GERAIS  |                     
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
*/


UPDATE * 
FROM CLIENT
SET EMAIL = 'LILIAN@GMAIL.COM'
WHERE NAME = 'LILIAN';

/*
+-------------------+----------+------------------------+------------+---------------+---------------------------------------------+
|      NAME     	|   SEX	   |         EMAIL          |    CPF     | PHONENUMBER |                  ADDRESS                      |   
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       JOAO        |    M     |   JOAO@GMAIL.COM       | 9988638273 |  22923110   | MARIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       LILIAN      |    F     |   LILIAN@GMAIL.COM     | 887774856  |  947785696  | SENADOR SOARES - TIJUCA - RIO DE JANE- RJ     |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       ANA         |    F     |   ANA@GLOBO.COM        | 85548962   | 548556985   | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       CARLA       |    F     |   CARLA@TERATI.COM.BR  | 7745828	 | 66587458    | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
|       JORGE       |    M     |   JORGE@GMAIL.COM      | 1068658273 | 36952120    | ALTAIR DE LIMA SOARES - PRADO - MINAS GERAIS  |                     
+-------------------+----------+------------------------+------------+-------------+-----------------------------------------------+
*/

								# DELETING RECORDS
								# EVER SELECT BEFORE DELETE A RECORD

DELETE FROM CLIENT WHERE NOME = 'ANA';



#####################################
###### FOREING KEY EXAMPLE ##########
#####################################

CREATE DATABASE BUSINESS;

USE BUSINESS;

SHOW DATABASES; --> OPTIONAL

CREATE TABLE CLIENT(
	IDCLIENT INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(30) NOT NULL,
	SEX ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);
								# ENUM IS USED WHEN THE "FIELD" HAS LIMITED OPTIONS

CREATE TABLE ADDRESS(
	IDADDRESS INT PRIMARY KEY AUTO_INCREMENT, 
	STREET VARCHAR(30) NOT NULL,
	DISTRICT VARCHAR(30) NOT NULL,
	CITY VARCHAR(30) NOT NULL,
	STATE CHAR(2) NOT NULL,
	ID_CLIENT INT UNIQUE,

	FOREIGN KEY(ID_CLIENT)
	REFERENCES CLIENT(IDCLIENT)
);
								/*
								THE FOREIGN KEY IS CALLED ID_CLIENT
								AND REFERS TO THE PRIMARY KEY IDCLIENT OF CLIENT TABLE
								IS USED THE UNIQUE PARAMETER FOR NOT REPEATE THE REFERENCE
								EXAMPLE:
								ONE CLIENT HAS ONE ADDRESS
								*/

CREATE TABLE PHONE(
	IDPHONE INT PRIMARY KEY AUTO_INCREMENT, 
	TYPE ENUM('RES','COM','CEL') NOT NULL,
	NUMBER_ VARCHAR(10) NOT NULL,
	ID_CLIENT INT,

	FOREIGN KEY(ID_CLIENT)
	REFERENCES CLIENT(IDCLIENT)
);

INSERT INTO CLIENT VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887'),
						(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466'),
						(NULL,'ANA','F','ANA@IG.COM','456545678'),
						(NULL,'CLARA','F',NULL,'5687766856'),
						(NULL,'JORGE','M','JORGE@IG.COM','8756547688'),
						(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

SELECT * FROM CLIENT;
/*
+-----------+--------+------+----------------+-------------+
| IDCLIENT  | NAME   | SEX  | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+
*/

INSERT INTO ADDRESS VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4),
							(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1),
							(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3),
							(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2),
							(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6),
							(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);


INSERT INTO ADDRESS VALUES(NULL,'RUA ALFANDEGA','CENTRO','SAO PAULO','SP',5);

INSERT INTO PHONE VALUES(NULL,'CEL','78458743',5),
							(NULL,'RES','56576876',5),
							(NULL,'CEL','87866896',1),
							(NULL,'COM','54768899',2),
							(NULL,'RES','99667587',1),
							(NULL,'CEL','78989765',3),
							(NULL,'CEL','99766676',3),
							(NULL,'COM','66687899',1),
							(NULL,'RES','89986668',5),
							(NULL,'CEL','88687909',2);


 				# JOIN TABLES


/*EXAMPLE
	SELECT FIELDS
	FROM FIRST 'ORIGN'
	INNER JOIN 'ANOTHER ORIGIN'
	ON 'PRIMARY KEY OF ORIGIN' = 'FOREIGN KEY OF ANOTHER ORIGN'S' ; 
*/

SELECT NAME, SEX, DISTRICT, CITY # PROJECTION
FROM CLIENT # ORIGIN
INNER JOIN ADDRESS # JOIN
ON IDCLIENT = ID_CLIENT;

/*
+--------+------+----------+----------------+
| NAME   | SEX  | DISTRICT | CITY           |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+
*/



SELECT CLIENT.NAME, CLIENT.SEX, ADDRESS.DISTRICT, ADDRESS.CITY, PHONE.TYPE, PHONE.NUMBER
FROM CLIENT 
INNER JOIN ADDRESS
ON CLIENT.IDCLIENT = ADDRESS.ID_CLIENT
INNER JOIN PHONE
ON CLIENT.IDCLIENT = PHONE.ID_CLIENT;

# THE SAME FORM CAN BE USED

SELECT C.NAME, C.SEX, A.DISTRICT, A.CITY, P.TYPE, P.NUMBER
FROM CLIENT C
INNER JOIN ADDRESS A
ON C.IDCLIENT = A.ID_CLIENT
INNER JOIN PHONE P
ON C.IDCLIENT = P.ID_CLIENT;


/*
+--------+------+---------+----------------+------+----------+
| NAME   | SEX  | DISTRICT| CITY           | TYPE | NUMBER   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+
*/

/* They Are different types of join, beyond what has already said */

SELECT C.NAME, C.SEX, A.DISTRICT, A.CITY
FROM CLIENT C                          /* GET ALL CLIENTS DATA AND COMMON ADDRESSES */
LEFT JOIN ADDRESS A
ON C.IDCLIENT = A.ID_CLIENT;


SELECT C.NAME, C.SEX, A.DISTRICT, A.CITY
FROM CLIENT C 					/* GET ALL ADDRESSES DATA AND COMMON CLIENTS */
RIGHT JOIN ADDRESS A
ON C.IDCLIENT = A.ID_CLIENT;

SELECT C.NAME, C.SEX, A.DISTRICT, A.CITY
FROM CLIENT C 					/* GET ALL CLIENTS AND ADDRESSES DATA  */
FULL JOIN ADDRESS A
ON C.IDCLIENT = A.ID_CLIENT;


/* 
  DDL - DATA DEFINITION LANGUAGE
*/

CREATE TABLE PRODUCT(
	IDPRODUCT INT PRIMARY KEY AUTO_INCREMENT,
	PRODUCT_NAME VARCHAR(30) NOT NULL,
	PRICE INT,
	PORTAGE FLOAT(10,2) NOT NULL
);

/* ALTERING THE TABLE */

/* CHANGING THE NAME OF COLUMN - CHANGE */

ALTER TABLE PRODUCT
CHANGE PRICE UNITARY_VALUE INT NOT NULL;

DESC PRODUCT;

/*
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUCT      | int(11)     | NO   | PRI | NULL    | auto_increment |
| PRODUCT_NAME   | varchar(30) | NO   |     | NULL    |                |
| UNITARY_VALUE  | int(11)     | NO   |     | NULL    |                |
| PORTAGE        | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
*/

/* CHANGING THE TYPE OF COLUMN - CHANGE */

ALTER TABLE PRODUCT
CHANGE UNITARY_VALUE UNITARY_VALUE INT;

DESC PRODUCT;

/*
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUCT      | int(11)     | NO   | PRI | NULL    | auto_increment |
| PRODUCT_NAME   | varchar(30) | NO   |     | NULL    |                |
| UNITARY_VALUE  | int(11)     | YES  |     | NULL    |                |
| PORTAGE        | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
*/

/* MODIFY - ALTERING THE TYPE AND ARGUMENTS */

# OBS MODIFY AND CHANGE DO SAME THINGS
ALTER TABLE PRODUCT
MODIFY UNITARY_VALUE VARCHAR(50) NOT NULL;

/* ADDING COLUMNS */

ALTER TABLE PRODUCT
ADD WEIGHT FLOAT(10,2) NOT NULL;

/* DELETING A COLUMN */

ALTER TABLE PRODUCT
DROP COLUMN WEIGHT;

/* ADDING COLUMN IN A ESPECIFIC ORDER */

ALTER TABLE PRODUCT
ADD COLUMN WEIGHT FLOAT(10,2) NOT NULL
AFTER PRODUCT_NAME;

ALTER TABLE PRODUCT
DROP COLUMN WEIGHT;

ALTER TABLE PRODUCT
ADD COLUMN WEIGHT FLOAT(10,2) NOT NULL
FIRST;















								#####################################
								############# FUNCTION ##############
								#####################################


/*
+---------+-------------------+--------+----------+
| NAME    | EMAIL             |DISTRICT| NUMBER   |
+---------+-------------------+--------+----------+
| JORGE   | JORGE@IG.COM      | ES     | 78458743 |
| JORGE   | JORGE@IG.COM      | ES     | 56576876 |
| JOAO    | JOAOA@IG.COM      | RJ     | 87866896 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 54768899 |
| JOAO    | JOAOA@IG.COM      | RJ     | 99667587 |
| ANA     | ANA@IG.COM        | SP     | 78989765 |
| ANA     | ANA@IG.COM        | SP     | 99766676 |
| JOAO    | JOAOA@IG.COM      | RJ     | 66687899 |
| JORGE   | JORGE@IG.COM      | ES     | 89986668 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 88687909 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 99656675 |
| GIOVANA | NULL              | RJ     | 33567765 |
| GIOVANA | NULL              | RJ     | 88668786 |
| GIOVANA | NULL              | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM | ES     | 88965676 |
| EDUARDO | NULL              | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM    | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 44522578 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 44522578 |
+---------+-------------------+--------+----------+

*/
/*CREATE VIEW V_REPORT AS
SELECT C.NAME, C.SEX, C.CPF, IFNULL(CT.EMAIL, 'HAS NO EMAIL'), A.ADDRESS
FROM CLIENT C
INNER JOIN CONTACT CT
ON C.ID_CLIENT = CT.IDCLIENT
INNER JOIN ADDRESS A
ON C.ID_CLIENT = A.IDCLIENT_ADD;



DROP VIEW V_REPORT;

SELECT * FROM V_REPORT;
*/

# IFNULL

SELECT  C.NAME, 
		IFNULL(C.EMAIL,'HAS NO EMAIL'), 
		A.DISTRICT, 
		P.NUMBER
FROM CLIENT C
INNER JOIN ADDRESS A
ON C.IDCLIENT = A.ID_CLIENT
INNER JOIN PHONE P
ON C.IDCLIENT = P.ID_CLIENT;

/*
+---------+--------------------------------+--------+----------+
| NAME    | IFNULL(C.EMAIL,'HAS NO EMAIL') | DISTRICT | NUMBER   |
+---------+--------------------------------+--------+----------+
| JORGE   | JORGE@IG.COM                   | ES       | 78458743 |
| JORGE   | JORGE@IG.COM                   | ES       | 56576876 |
| JOAO    | JOAOA@IG.COM                   | RJ       | 87866896 |
| CARLOS  | CARLOSA@IG.COM                 | RJ       | 54768899 |
| JOAO    | JOAOA@IG.COM                   | RJ       | 99667587 |
| ANA     | ANA@IG.COM                     | SP       | 78989765 |
| ANA     | ANA@IG.COM                     | SP       | 99766676 |
| JOAO    | JOAOA@IG.COM                   | RJ       | 66687899 |
| JORGE   | JORGE@IG.COM                   | ES       | 89986668 |
| CARLOS  | CARLOSA@IG.COM                 | RJ       | 88687909 |
| FLAVIO  | FLAVIO@IG.COM                  | MG       | 68976565 |
| FLAVIO  | FLAVIO@IG.COM                  | MG       | 99656675 |
| GIOVANA | HAS NO EMAIL                   | RJ       | 33567765 |
| GIOVANA | HAS NO EMAIL                   | RJ       | 88668786 |
| GIOVANA | HAS NO EMAIL                   | RJ       | 55689654 |
| KARLA   | KARLA@GMAIL.COM                | RJ       | 88687979 |
| DANIELE | DANIELE@GMAIL.COM              | ES       | 88965676 |
| EDUARDO | HAS NO EMAIL                   | PR       | 89966809 |
| ANTONIO | ANTONIO@IG.COM                 | SP       | 88679978 |
| ANTONIO | ANTONIO@UOL.COM                | PR       | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM               | SP       | 89955665 |
| CARMEM  | CARMEM@IG.COM                  | RJ       | 77455786 |
| CARMEM  | CARMEM@IG.COM                  | RJ       | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM              | RJ       | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM              | RJ       | 44522578 |
| JOICE   | JOICE@GMAIL.COM                | RJ       | 44522578 |
+---------+--------------------------------+--------+----------+
*/















														#####################################
														############### VIEW ################
														#####################################

# CREATE A PREDIFINED FUNCTION THAT DOES WHAT DO YOU WANT

# THE FUNCTION
SELECT  C.NAME, 
		C.SEX, 
		C.EMAIL, 
		P.TYPE, 
		P.NUMBER, 
		A.DISTRICT, 
		A.CITY, 
		A.STATE
FROM CLIENT C 
INNER JOIN PHONE P 
ON C.IDCLIENT = P.ID_CLIENT 
INNER JOIN ADDRESS A 
ON C.IDCLIENT = A.ID_CLIENT;

# CREATING THE IDENTIFIER FOR THE FUNCTION
CREATE VIEW REPORT AS
SELECT  C.NAME, 
		C.SEX, 
		C.EMAIL, 
		P.TYPE, 
		P.NUMBER, 
		A.DISTRICT, 
		A.CITY, 
		A.STATE
FROM CLIENT C 
INNER JOIN PHONE P 
ON C.IDCLIENT = P.ID_CLIENT 
INNER JOIN ADDRESS A 
ON C.IDCLIENT = A.ID_CLIENT;

# CALLING THE FUNCTION
SELECT * FROM REPORT;


# SEE VIEWS
SHOW TABLES; 
/* DELETING A VIEW */

DROP VIEW REPORT;



# ORDERING DATA

/*
+------------+--------+------+-------+
| ID_STUDENT | NAME   |  SEX | GRADE |
+------------+--------+------+-------+
|     0      | JOAO   |  M   | 7.6   |
|     1      | LILIAN |  F   | 9.2   |
|     2      | ANA    |  F   | 2.0   |
|     3      | CARLA  |  F   | 5.0   |
|     4      | JORGE  |  M   | 10.0  |
+------------+--------+------+-------+
*/

SELECT NAME,GRADE 
FROM STUDENTS 
ORDER BY GRADE; # ASC BY DEFAULT, U CAN USE 'DESC'  


/*
+--------+-------+
| NAME   | GRADE |
+--------+-------+
| ANA    | 2.0   |
| CARLA  | 5.0   |
| JOAO   | 7.6   |
| LILIAN | 9.2   |
| JORGE  | 10.0  |
+--------+-------+
*/
/*
Note: is possible ordering more than one column.
Example:
SELECT NAME, GRADE 
FROM STUDENTS 
ORDER BY GRADE, NAME;*/






/*                                      ###########################################################
										#####  ###  ### ### #####    ###       ### ################
                                        ##### # # # #### # ###### ###### ##### ### ################
                                        ##### ## ## ##### #######    ### ##### ### ################
                                        ##### ##### ##### ########## ###       ### ################
                                        ##### ##### ##### #######    ########  ###      ###########
                                        ###########################################################*/
                                        						/*MYSQL*/








DELIMITER $

DELIMITER ;




										#####################################
										############ PROCEDURES #############
										#####################################

/* Changing the delimiter is important for creating procedures
Procedures are user-written functions to make calling queries easier.*/


/* Creating a Procedure*/

DELIMITER $

CREATE PROCEDURE NAME_OF_PROCEDURE()
BEGIN 

		/*YOUR FUNCTION*/
		SELECT 10 + 10 AS SUM_RESULT;

END
$


/* CALLING PROCEDURES*/
DELIMITER ;

CALL NAME_OF_PROCEDURE();

/*
+------------+
| SUM_RESULT |
+------------+
| 20         |
+------------+
*/
/* Deleting a Procedure */
DROP PROCEDURE NAME_OF_PROCEDURE;

/* Creating a Procedure with argumments */ # Always remember change the delimiter when creating a procedure

DELIMITER $ 

CREATE PROCEDURE INSERT_STUDENTS(NAME_ varchar(10), SEX_ ENUM('F','M'), GRADE_ FLOAT)
BEGIN 

		/*YOUR FUNCTION*/
		INSERT INTO STUDENTS(ID_STUDENT,NAME,SEX,GRADE) VALUES (NULL, NAME_, SEX_, GRADE_);
		SELECT NAME, SEX, GRADE FROM STUDENTS;

END
$
DELIMITER ;

CALL INSERT_STUDENTS('KEVIN','M',4.2);

/*
+------------+--------+------+-------+
| ID_STUDENT | NAME   |  SEX | GRADE |
+------------+--------+------+-------+
|     0      | JOAO   |  M   | 7.6   |
|     1      | LILIAN |  F   | 9.2   |
|     2      | ANA    |  F   | 2.0   |
|     3      | CARLA  |  F   | 5.0   |
|     4      | JORGE  |  M   | 10.0  |
|     5      | KEVIN  |  M   | 4.2   |
+------------+--------+------+-------+
*/

									  /*#####################################
										###### AGGREGATION FUNCTIONS ########
										#####################################*/
											



/*
+------------+--------+------+-------+
| ID_STUDENT | NAME   |  SEX | GRADE |
+------------+--------+------+-------+
|     0      | JOAO   |  M   | 7.6   |
|     1      | LILIAN |  F   | 9.2   |
|     2      | ANA    |  F   | 2.0   |
|     3      | CARLA  |  F   | 5.0   |
|     4      | JORGE  |  M   | 10.0  |
|     5      | KEVIN  |  M   | 4.2   |
+------------+--------+------+-------+*/


/*GROUP BY - USED FOR GROUP INFORMATIONS FROM ONE COLUMN*/

SELECT COUNT(ID_STUDENTS) AS QUANTITY, SEX
FROM STUDENTS
GROUP BY SEX;

/*
+------------+------+
|  QUANTITY  |  SEX |
+------------+------+
|     3      |  M   |
|     3      |  F   |
+------------+------+*/


/* MAX RETURNS THE BIGGEST VALUE OF COLLUMN*/


SELECT MAX(GRADE) as LARGEST_GRADE 
FROM STUDENTS;

/*
+---------------+
| LARGEST_GRADE |
+---------------+
|      10.0     |
+---------------+*/

/* MIN RETURNS THE SMALLER VALUE OF COLLUMN*/

SELECT MIN(GRADE) as SMALLER_GRADE 
FROM STUDENTS;



/*
+---------------+
| SMALLER_GRADE |
+---------------+
|      2.0      |
+---------------+*/



/* AVG RETURNS THE MEAN VALUE OF COLLUMN*/

SELECT AVG(GRADE) as GRADE_AVERAGE 
FROM STUDENTS;



/*
+---------------+
| GRADE_AVERAGE |
+---------------+
|    6.33333    |
+---------------+*/



/* CALL MORE THAN ONE FUNCTION*/

SELECT AVG(GRADE) as GRADE_AVERAGE,
	   MIN(GRADE) as SMALLER_GRADE,
	   MAX(GRADE) as LARGEST_GRADE  
FROM STUDENTS;



/*
+---------------+---------------+---------------+
| GRADE_AVERAGE | SMALLER_GRADE | LARGEST_GRADE |
+---------------+---------------+---------------+
|    6.33333    |      2.0      |      10.0     |
+---------------+---------------+---------------+*/



/* TRUNCATE - LIMIT THE DECIMAL PLATES*/

SELECT TRUNCATE(AVG(GRADE),2) as GRADE_AVERAGE,
	   MIN(GRADE) as SMALLER_GRADE,
	   MAX(GRADE) as LARGEST_GRADE  
FROM STUDENTS;



/*
+---------------+---------------+---------------+
| GRADE_AVERAGE | SMALLER_GRADE | LARGEST_GRADE |
+---------------+---------------+---------------+
|      6.33     |      2.0      |      10.0     |
+---------------+---------------+---------------+*/



/* SUM - SUM THE COLUMN VALUES*/

SELECT SUM(GRADE) as GRADE_TOTAL 
FROM STUDENTS;



/*
+---------------+
|  GRADE_TOTAL  |
+---------------+
|      38.0     |
+---------------+*/



												/* SUBSET SET */


				/* SUBQUERIES 
Use return of the querie for "filter" values
*/


SELECT ID_STUDENT,NAME,GRADE FROM STUDENTS
WHERE GRADE < (SELECT AVG(GRADE) FROM STUDENTS);



/*
+------------+--------+-------+
| ID_STUDENT | NAME   | GRADE |
+------------+--------+-------+
|     2      | ANA    | 2.0   |
|     3      | CARLA  | 5.0   |
|     5      | KEVIN  | 4.2   |
+------------+--------+-------+*/



				/* AGGREGATION IN ROWS */


/*
+------------+--------+---------+---------+---------+
| ID_STUDENT | NAME   | GRADE_1 | GRADE_2 | GRADE_3 |
+------------+--------+---------+---------+---------+
|     0      | JOAO   |   7.6   |   6.0   |   4.2   |
|     1      | LILIAN |   9.2   |   3.2   |   7.4   |
|     2      | ANA    |   2.0   |   8.9   |   6.7   |
|     3      | CARLA  |   5.0   |   9.5   |   3.5   |
|     4      | JORGE  |   10.0  |   5.0   |   7.7   |
|     5      | KEVIN  |   4.2   |   3.1   |   10.0  |
+------------+--------+---------+---------+---------+*/



SELECT NAME,
	GRADE_1,
	GRADE_2,
	GRADE_3,
	(GRADE_1 + GRADE_2 + GRADE_3) AS "TOTAL",
	TRUNCATE((GRADE_1 + GRADE_2 + GRADE_3)/3,2) AS "AVERAGE",
FROM STUDENTS;


/*
+------------+--------+---------+---------+---------+---------+---------+
| ID_STUDENT | NAME   | GRADE 1 | GRADE_2 | GRADE_3 |  TOTAL  | AVERAGE |
+------------+--------+---------+---------+---------+---------+---------+
|     0      | JOAO   |   7.6   |   6.0   |   4.2   |   17.8  |   5.93  |
|     1      | LILIAN |   9.2   |   3.2   |   7.4   |   19.8  |   6.6   |
|     2      | ANA    |   2.0   |   8.9   |   6.7   |   17.6  |   5.8   |
|     3      | CARLA  |   5.0   |   9.5   |   3.5   |   18.0  |   6.0   |
|     4      | JORGE  |   10.0  |   5.0   |   7.7   |   22.7  |   7.56  |
|     5      | KEVIN  |   4.2   |   3.1   |   10.0  |   17.3  |   5.76  |
+------------+--------+---------+---------+---------+---------+---------+*/




									  /*#####################################
										############## TRIGGERS #############
										#####################################*/


/*
Triggers are similar to Views, but run before or after an action occurs.
*/

/*CREATING A TRIGGER*/

CREATE TRIGGER NAME_OF_TRIGGER

(BEFORE/AFTER) (INSERT/UPDATE/DELETE)  ON TABLE
FOR EACH ROW
BEGIN

	/*YOU SQL COMMAND*/

END
$

/*USE THE OPTIONS "BEFORE OR AFTER" FOR RUN THE COMMAND BEFORE OR AFTER AN ACTION

USE THE OPTION "INSERT OR UPDATE OR DELETE" FOR SELECT THE ACTION TO BE "WATCH" BY THE TRIGGER

Note: CHANGE THE DELIMITER WHEN CREATE THE TRIGGER
*/


/*EXAMPLE TABLES */

CREATE TABLE EMPLOYEES(
	IDEMPLOYEE INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(30) NOT NULL,
    SALARY FLOAT(10,2) NOT NULL,
    SALES INT
);

CREATE TABLE EMPLOYEES_BACKUP(
	ID_BACKUP INT PRIMARY KEY AUTO_INCREMENT,
    ID_EMPLOYEE INT NOT NULL,
    NAME VARCHAR(30) NOT NULL,
    SALARY FLOAT(10,2) NOT NULL,
    SALES INT
);


/*
TABLE EMPLOYEES
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| IDEMPLOYEE   | int(11)      | NO   | PRI | None    | auto_increment |
| NAME         | varchar(30)  | NO   |     | None    |                |
| SALARY       | float(10,2)  | NO   |     | None    |                |
| SALES	       | int(11) 	  | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+


TABLE EMPLOYEES_BACKUP
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| ID_BACKUP    | int(11)      | NO   | PRI | None    | auto_increment |
| ID_EMPLOYEE  | int(11)      | NO   |     | None    |                |
| NAME         | varchar(30)  | NO   |     | None    |                |
| SALARY       | float(10,2)  | NO   |     | None    |                |
| SALES	       | int(11) 	  | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+*/


DELIMITER $

CREATE TRIGGER BACKUP_EMPLOYEE

AFTER INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN

	INSERT INTO EMPLOYEES_BACKUP VALUES(NULL, NEW.IDEMPLOYEE, NEW.NAME, NEW.SALARY, NEW.SALES);

END
$

DELIMITER ;

/* Note: THE "OLD" WILL BE THE RECORDS BEFORE THE CHANGE (AFTER THE DELETE OR UPDATE) THIS COMMAND/PARAMETER RETURN THE OLD VALUE
THE "NEW" WILL BE THE RECORDS AFTER THE CHANGE (BEFORE THE UPDATE OR INSERT) THIS COMMAND/PARAMETER RETURN THE NEW VALUE

*/

INSERT INTO EMPLOYEES VALUES(NULL, "ROBSON", 1500.00, NULL);
INSERT INTO EMPLOYEES VALUES(NULL, "MARIA", 1800.00, 3);


/*
TABLE EMPLOYEES_BACKUP
+-----------+-------------+----------+----------+--------+
| ID_BACKUP | ID_EMPLOYEE |   NAME   |  SALARY  | SALES  |
+-----------+-------------+----------+----------+--------+
|     1     |      1      |  ROBSON	 | 1500.00  | NULL   |
|     2     |      2      |  MARIA   | 1800.00 	|	3    |
+-----------+-------------+----------+----------+--------+
*/

/* COMMUNICATING FROM DIFFERENTS DATABASES 

INSERTING ON THE DIFFERENT DATABASE*/

INSERT DATABASE_NAME.TABLE VALUES("YOUR VALUES");

/* Note: The same thing can used for another commands (UPDATE, SELECT AND DELETE)
They are used for triggers, when u have another database (for example for backups)*/



/* DELETING TRIGGERS */

DROP TRIGGER NAME_OF_TRIGGER;


/* AUDITING THE OPERATIONS ON TABLE */


/*
EXAMPLE TABLE
*/

ALTER TABLE EMPLOYEES_BACKUP ADD COLUMN EVENT ENUM('I','U','D');
ALTER TABLE EMPLOYEES_BACKUP ADD COLUMN DATE_ DATETIME;
ALTER TABLE EMPLOYEES_BACKUP ADD COLUMN USER VARCHAR(30) AFTER SALES;
/*
TABLE EMPLOYEES_BACKUP
+--------------+---------------------+------+-----+---------+----------------+
| Field        | Type        		 | Null | Key | Default | Extra          |
+--------------+---------------------+------+-----+---------+----------------+
| ID_BACKUP    | int(11)     		 | NO   | PRI | None    | auto_increment |
| ID_EMPLOYEE  | int(11)     		 | NO   |     | None    |                |
| NAME         | varchar(30) 		 | NO   |     | None    |                |
| SALARY       | float(10,2) 		 | NO   |     | None    |                |
| SALES	       | int(11) 	 		 | YES  |     | NULL    |                |
| USER	       | varchar(30) 		 | YES  |     | NULL    |                |
| EVENT	       | enum('I', 'U', 'D') | YES  |     | NULL    |                |
| DATE_	       | DATETIME			 | YES  |     | NULL    |                |
+--------------+---------------------+------+-----+---------+----------------+*/


SELECT NOW(); /* RETURNS THE ACTUAL TIME */

SELECT CURRENT_USER(); /* RETURNS THE CURRENTS USER IN DATABASE */


DROP TRIGGER BACKUP_EMPLOYEE;

DELIMITER $


CREATE TRIGGER BACKUP_EMPLOYEE_INSERT
AFTER INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN 

	INSERT INTO EMPLOYEES_BACKUP VALUES(NULL, 
		NEW.IDEMPLOYEE, NEW.NAME, 
		NEW.SALARY, NEW.SALES, 
		CURRENT_USER(), 'I', NOW());

END
$

DELIMITER ;

INSERT INTO EMPLOYEES VALUES(NULL, "LUIZA", 1200.00, NULL);
INSERT INTO EMPLOYEES VALUES(NULL, "RAMON", 3000.00, 1);



/*
TABLE EMPLOYEES_BACKUP
+-----------+-------------+----------+----------+--------+-----------------+-------+-----------------------+
| ID_BACKUP | ID_EMPLOYEE |   NAME   |  SALARY  | SALES  | USER            | EVENT |         DATE_         |
+-----------+-------------+----------+----------+--------+-----------------+-------+-----------------------+
|     1     |      1      |  ROBSON	 | 1500.00  | NULL   |  NULL	       | NULL  | NULL                  |
|     2     |      2      |   MARIA  | 1800.00 	|	3    |  NULL	       | NULL  | NULL                  |
|     3     |      3      |   LUIZA  | 1200.00 	| NULL   |  database@user  | I     | 2022-11-24 13:33:15   |
|     4     |      4      |   RAMON  | 3000.00 	|	1    |  database@user  | I     | 2022-11-24 13:33:15   |
+-----------+-------------+----------+----------+--------+-----------------+-------+-----------------------+
*/

/*
Note: This too used for another operations (update, delete) 
*/





									  /*#####################################
										############## CURSOR #############
										#####################################*/

/* This topic need, knowledge in procedures */

/* A cursor serves for when need do a programation more complex, for the example will be use the table bellow:*/


/*CURSOR TEMPLATE WHITHOUT COMMENTS*/


DELIMITER $
CREATE PROCEDURE NAME_OF_PROCEDURE()
BEGIN

	DECLARE END_ INT DEFAULT 0;
	DECLARE VAR1, VAR2, VTOTAL INT;
	DECLARE TYPE VARCHAR(10);


	DECLARE NAME_OF_CURSOR CURSOR FOR(
		SELECT * FROM TABLE 
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET END_ = 1; 

	OPEN NAME_OF_CURSOR;

	REPEAT 

		FETCH NAME_OF_CURSOR INTO VAR1, VAR2, TYPE;

		IF NOT END_ THEN 

			SET VTOTAL = VAR1 * VAR2;
			INSERT INTO TABLE2 VALUES(NULL, TYPE, VAR1, VTOTAL);

		END IF; 
	UNTIL END_ END REPEAT; 

	CLOSE NAME_OF_CURSOR; 

END
$

DELIMITER ;



/*CURSOR TEMPLATE WHITH COMMENTS*/


DELIMITER $
CREATE PROCEDURE NAME_OF_PROCEDURE()
BEGIN
	/*HERE THE VARIABLES WILL BE CREATED EXAMPLE*/
	DECLARE END_ INT DEFAULT 0;
	DECLARE VAR1, VAR2, VTOTAL INT;
	DECLARE TYPE VARCHAR(10);

	/* HERE THE CURSOR WILL BE CREATED */

	DECLARE NAME_OF_CURSOR CURSOR/*TYPE CURSOR*/ FOR(
		/*QUERY WITH THE DATA*/
		SELECT * FROM TABLE /*DONT USE ';' HERE*/
	);

	/* THE LINE IS USED FOR STOP THE LOOP, WHERE THE OPERATIONS 
	WILL BE DONE */
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET END_ = 1; 

	/* GETTING THE DATA OF CURSOR */
	OPEN NAME_OF_CURSOR;

	REPEAT /* BEGIN OF LOOP */


		/* INSERT CURSOR DATA IN THE VARIABLES */
		FETCH NAME_OF_CURSOR INTO VAR1, VAR2, TYPE;

		IF NOT END_ THEN /* IF NOT END OF THE LOOP THE DO THE OPERATIONS BELLOW*/

			/* YOUR OPERATIONS, EXAMPLE: */
			SET VTOTAL = VAR1 * VAR2;
			INSERT INTO TABLE2 VALUES(NULL, TYPE, VAR1, VTOTAL);

		END IF; 
	UNTIL END_ END REPEAT; /* END THE LOOP */

	CLOSE NAME_OF_CURSOR; /* CLEAN THE CURSOR */

END
$

DELIMITER ;


/*
TABLE TRIANGULES
+--------------+---------+---------+---------+
| ID_TRIANGULE | SIDE_1  | SIDE_2  | SIDE_3  |
+--------------+---------+---------+---------+
|       1      |    7    |    6    |    4    |
|       2      |    9    |    9    |    7    |
|       3      |    2    |    2    |    2    |
|       4      |    3    |    9    |    3    |
|       5      |    10   |    5    |    5    |
|       6      |    1    |    3    |    3    |
+--------------+---------+---------+---------+


In this example, we need to get the perimeter of the triangle and the type (isosceles, scalene, equilateral)
In a simple way, you can do a Select to obtain the information of each one, and after calculating and obtaining the type,
but this operation takes a long time to do, and 'CURSOR' facilitates similar operations and make more fast

The cursor is basically an array that stores data and together with a procedure, operations can be done more easily,
with the cost of RAM memory, when storing all this data 

For it, we create a table to store the data whith the parameters (perimeter and type)
*/


/*
TABLE TRIANGULES_ATTRIBUTES
+--------------+--------------------------------------------+------+-----+---------+----------------+
| Field        | Type        							    | Null | Key | Default | Extra          |
+--------------+--------------------------------------------+------+-----+---------+----------------+
| IDTRIANGULE  | int(11)     							    | NO   |     | None    |   			    |
| SIDE_1  	   | int(11)     							    | NO   |     | None    |                |
| SIDE_2  	   | int(11)     							    | NO   |     | None    |                |
| SIDE_3  	   | int(11)     							    | NO   |     | None    |                |
| PERIMETER    | int(11)     							    | NO   |     | None    |                |
| TYPE         | enum("isosceles","scalene","equilateral")  | NO   |     | None    |                |
+--------------+--------------------------------------------+------+-----+---------+----------------+*/



/*CREATING THE PROCEDURE WHITH CURSOR*/


DELIMITER $

CREATE PROCEDURE INSERT_TRIANGULES()
BEGIN
	
	DECLARE END_ INT DEFAULT 0;
	DECLARE VID, VSIDE1, VSIDE2, VSIDE3, PERIMETER INT;
	DECLARE TYPE VARCHAR(11);

	DECLARE VCURSOR_ CURSOR FOR(
		SELECT ID_TRIANGULE, SIDE_1, SIDE_2, SIDE_3 FROM TRIANGULES
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET END_ = 1;

	OPEN VCURSOR_;

	REPEAT

		FETCH VCURSOR_ INTO VID, VSIDE1, VSIDE2, VSIDE3;

		IF NOT END_ THEN

			SET PERIMETER = VSIDE1 + VSIDE2 + VSIDE3;

			IF VSIDE1 = VSIDE2 THEN

				IF VSIDE2 = VSIDE3 THEN
					SET TYPE = 'equilateral';

				ELSE 
					SET TYPE = 'isosceles';
				END IF;
			ELSE
			 	SET TYPE = 'scalene';

			END IF;

			INSERT INTO TRIANGULES_ATTRIBUTES VALUES(VID, VSIDE1, 
				VSIDE2, VSIDE3, PERIMETER, TYPE);

		END IF;

	UNTIL END_ END REPEAT;

	CLOSE VCURSOR_;
END
$

DELIMITER ;


/* CALLING THE CURSOR */

CALL INSERT_TRIANGULES;


/*
TABLE TRIANGULES_ATTRIBUTES
+-------------+----------+----------+----------+------------+--------------+
| IDTRIANGULE |  SIDE_1  |  SIDE_2	|  SIDE_3  | PERIMETER	|  TYPE	       |
+-------------+----------+----------+----------+------------+--------------+
|     1       |    7     |    6     |     4    |     17     |  scalene     |  
|     2       |    9     |    9     |     7    |     25     |  isosceles   |  
|     3       |    2     |    2     |     2    |     6      |  equilateral |  
|     4       |    3     |    9     |     3    |     15     |  scalene     |  
|     5       |    10    |    5     |     5    |     20     |  scalene     |  
|     6       |    1     |    3     |     3    |     7      |  scalene     |
+-------------+----------+----------+----------+------------+--------------+*/















































/*                                      #################################################################
										####    ###       ### #########    ##   ##   ## #### ##   ##   ##
                                        #### ###### ##### ### ######### ##### #### ## ## ## ### #### ## #
                                        ####    ### ##### ### #########    ##   ## ## ## ## ###   ## ## #
                                        ####### ###       ### ############ ## #### # #### # ### #### # ##
                                        ####    ########  ###      ####    ##   ## ## #### ####   ## ## #
                                        ################################################################*/
                                        						/*SQL Server*/







									  /*#####################################
										############## GO CLAUSE ############
										#####################################*/




/* In Sql Server the delimiter is not a semicolon, the "GO" clause is used, it breaks the commands into packages, where they will be executed
one by one, without the clause, the database chooses the command that requires less processing, which can cause an error */



CREATE TABLE CLIENT(
	ID_CLIENT INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(30),
	SEX CHAR(1),
	EMAIL VARCHAR(30),  /* NOT WORK IN SQLSERVER */
	CPF INT(11),
	PHONENUMBER VARCHAR(30),
	ADDRESS VARCHAR(100)
);





CREATE TABLE CLIENT(
	ID_CLIENT INT PRIMARY KEY IDENTITY(1,1), /* START AT 1, AND ADD 1 PER RECORD */
	NAME VARCHAR(30),
	SEX CHAR(1),
	EMAIL VARCHAR(30), /* WORK IN SQLSERVER */
	CPF BIGINT,/* BIGGER THAN INT */
	PHONENUMBER VARCHAR(30),
	ADDRESS VARCHAR(100)
)
GO


/*
INSERT INTO CLIENT VALUES('JOAO','M','2020/05/21','JOAO@GMAIL.COM',9988638273,'22923110','MARIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ')
GO

INSERT INTO CLIENT(NAME,SEX,ADDRESS,PHONENUMBER,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856)
GO

INSERT INTO CLIENT VALUES('ANA','F','2018/04/01','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
('CARLA','F','1987/11/13','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG'),
('JORGE','M','2000/05/05','JORGE@GMAIL.COM',1068658273,'36952120','ALTAIR DE LIMA SOARES - PRADO - MINAS GERAIS')
GO*/


									  /*##################################################################
										############## NOTE OF CHANGES IN SQL SERVER COMMANDS ############
										##################################################################*/
/*
:

---INSERT---
IN INSERT FOR ROWS HAVES IDENTITY, DONT NEEED DECLARE
EXAMPLE:

TABLE X
             TABLE_OWNER   TABLE_NAME   COLUMN_NAME   DATA_TYPE  TYPE_NAME     ...
---------    ---------     --------     ------------- ------     ------------- ...
database      dbo          X    		ID                 4      int identity ...
database      dbo          X    		NAME              12      varchar      ... 
database      dbo          X    		RANGE             12      int          ... 

INSERT INTO X VALUES('NAME',NULL)
GO
INSERT INTO X VALUES('MASTER',3)
GO
INSERT INTO X(NAME) VALUES('HELLO')
GO

---UPDATE---
UPDATE TABLE_NAME 
SET COLUMN = NEW_VALUE
WHERE COLUMN = VALUE --CLAUSE--
GO

---DATATYPES---
THE FLOAT TYPE IS NUMERIC() IN SQL SERVER.

THE INT TYPE DONT ACCEPT PARAMETER
EXAMPLE:
INT(15)
*/




									  /*####################################
										############## END NOTE ############
										####################################*/
/* COLUMNS DESCRIPTION */

SP_COLUMNS TABLE_NAME
GO

/*

             TABLE_OWNER   TABLE_NAME COLUMN_NAME   DATA_TYPE  TYPE_NAME     PRECISION   LENGTH  SCALE   RADIX    NULLABLE REMARKS  COLUMN_DEF ...
---------    ---------     --------   ------------- ------     ------------- -------     -----   ------  ------   -----    ------   --------   ...
database      dbo           CLIENT     NAME              12    varchar             30     30     NULL    NULL       1      NULL     NULL       ...
database      dbo           CLIENT     SEX                1    char                 1      1     NULL    NULL       1      NULL     NULL       ... 
database      dbo           CLIENT     BIRTH_DATE        -9    date                10     20     NULL    NULL       1      NULL     NULL
database      dbo           CLIENT     EMAIL             12    varchar             30     30     NULL    NULL       1      NULL     NULL       ... 
database      dbo           CLIENT     CPF               -5    bigint              19      8        0      10       1      NULL     NULL       ... 
database      dbo           CLIENT     PHONENUMBER       12    varchar             30     30     NULL    NULL       1      NULL     NULL       ... 

*/



SP_HELP TABLE_NAME /*MORE DETAILED*/
GO


/* ACTUAL DATE */

SELECT GETDATE()
GO

/*
GETDATE()
-----------------------
2022-11-29 14:04:09.633
*/

/*  ISNULL (IFNULL) */

/*
ID_CLIENT   NAME     SEX  BIRTH_DATE     EMAIL                 CPF              PHONENUMBER       ADDRESS                                                                                             
----------- -------- ---  ----------     --------------------  ---------------  ----------------- -----------------------------------------------
          1 JOAO     M    2020-05-21     JOAO@GMAIL.COM        9988638273       22923110          MARIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ   
          2 LILIAN   F    NULL           NULL                  887774856        947785696         SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ                                                       
          3 ANA      F    2018-04-01     ANA@GLOBO.COM         85548962         548556985         PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP                                                       
          4 CARLA    F    1987-11-13     CARLA@TERATI.COM.BR   7745828          66587458          SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG                                                         
          5 JORGE    M    2000-05-05     JORGE@GMAIL.COM       1068658273        36952120         ALTAIR DE LIMA SOARES - PRADO - MINAS GERAIS                           
*/


SELECT NAME,
       SEX,
       ISNULL(EMAIL,'-----') AS 'EMAIL' 
FROM CLIENT
GO

/*
NAME         SEX EMAIL                         
------------ --- ------------------------------
JOAO         M   JOAO@GMAIL.COM                
LILIAN       F   -----                         
ANA          F   ANA@GLOBO.COM                 
CARLA        F   CARLA@TERATI.COM.BR           
JORGE        M   JORGE@GMAIL.COM               
*/


/* DATEDIFF - CALCULATE THE DATE PERIOD */


SELECT NAME,
       SEX,
	   DATEDIFF(YEAR,BIRTH_DATE,GETDATE()) AS 'AGE' /* DATEDIFF(INTERVAL, START_DATE, END_DATE) */
FROM CLIENT
GO


/*
NAME                           SEX  AGE        
------------------------------ ---  ----------
JOAO                           M             2
LILIAN                         F          NULL
ANA                            F             4
CARLA                          F            35
JORGE                          M            22
*/


/* DATENAME - RETURNS THE NAME OF DATE */

SELECT NAME,
       SEX,
	   DATENAME(MONTH,BIRTH_DATE) AS 'MONTH OF BIRTH_DATE'
FROM CLIENT
GO


/*
NAME                           SEX MONTH OF BIRTH_DATE                              
------------------------------ --- -------------------
JOAO                           M   May                           
LILIAN                         F   NULL                          
ANA                            F   April                         
CARLA                          F   November                      
JORGE                          M   May    

*/



/* CONVERTING DATATYPES - CAST FUNCTION*/

SELECT '1' + '1'
GO

/*
--
11
*/



SELECT CAST('1' AS INT) + CAST('1' AS INT)
GO

/*     
-----
    2
*/


/* CHARINDEX - RETURNS THE POSITION OF THE SPECIFIC CHAR IN A ROW */


SELECT NAME,
       CHARINDEX('A',NAME) AS 'INDEX' /* (WHAT, WHERE, START) THE THIRD PARAMETER, CAN BE OCCULTED */
FROM CLIENT
GO

/*
NAME     INDEX                                
-------- -----------
JOAO               3
LILIAN             5
ANA                1
CARLA              2
JORGE              0
*/


SELECT NAME,
       CHARINDEX('A',NAME,3) AS 'INDEX' 
FROM CLIENT
GO

/*
NAME      INDEX      
--------- -----------
JOAO                3
LILIAN              5
ANA                 3
CARLA               5
JORGE               0
*/




									  /*#####################################
										############## TRIGGERS #############
										#####################################*/


/*
Triggers are similar to Views, but run before or after an action occurs.
*/





/*CREATING A TRIGGER*/

CREATE TRIGGER NAME_OF_TRIGGER
ON TABLE
FOR (INSERT/UPDATE/DELETE)
AS
	
	DECLARE @VAR1 INT /* TO DELCARE A VARIABLE USE THE "@" MARKER */
	DECLARE @VAR2 VARCHAR(20)
	
	/* THE DATABASE HAS TWO "FIELDS" WHERE THE "UPDATED" DATA OF THE FIELDS ARE
	"INSERTED" AND "DELETED" -> IS SIMILAR TO NEW AND OLD IN MYSQL, BUT THE "INSERTED" ARE RECORDS GUARD
	INSERTED AND "DELETED" THE DELETED RECORDS*/

	/*YOU SQL COMMAND*/

	SELECT @VAR1 = COLUMN_OF_ROW_CHANGED FROM INSERTED/DELETED


	SET @VAR3 = SUSER() /* STORE THE FUNCTION VALUE IN THE VARIABLE */

	PRINT 'YOUR MESSAGE' /* THE "PRINT" COMMAND IS USED FOR PRINT A MESSAGE IN CONSOLE, WHEN RUN A TRIGGER */
GO

/* TOO USE CONDITIONS */

CREATE TRIGGER NAME_OF_TRIGGER
ON TABLE
FOR UPDATE
AS
IF UPDATE(COLUMN)
BEGIN
	
	/* YOUR CODE HERE */
END
GO


/*EXAMPLE TABLES */

CREATE TABLE EMPLOYEES(
	IDEMPLOYEE INT PRIMARY KEY IDENTITY,
    NAME VARCHAR(30) NOT NULL,
    SALARY NUMERIC(10,2) NOT NULL,
    SALES INT
)
GO

CREATE TABLE EMPLOYEES_BACKUP(
	ID_BACKUP INT PRIMARY KEY IDENTITY,
    ID_EMPLOYEE INT NOT NULL,
    NAME VARCHAR(30) NOT NULL,
    NEW_SALARY NUMERIC(10,2) NOT NULL,
    OLD_SALARY NUMERIC(10,2) NOT NULL,
    DATE_ DATETIME,
    USER_ VARCHAR(30),
    MESSAGE VARCHAR(100)
)
GO


/*

SP_COLUMNS EMPLOYEES
GO

TABLE EMPLOYEES
             TABLE_OWNER   TABLE_NAME   COLUMN_NAME   DATA_TYPE  TYPE_NAME     PRECISION   LENGTH  SCALE   RADIX    NULLABLE REMARKS  COLUMN_DEF ...
---------    ---------     --------     ------------- ------     ------------- -------     -----   ------  ------   -----    ------   --------   ...
database      dbo          EMPLOYEES    IDEMPLOYEE        4      int identity  10           4       0       10       0       NULL     NULL       ...
database      dbo          EMPLOYEES    NAME              12     varchar       30           30      NULL    NULL     0       NULL     NULL       ... 
database      dbo          EMPLOYEES    SALARY             2     numeric       10           12      2       10       0       NULL     NULL       ...
database      dbo          EMPLOYEES    SALES              4     int           10           4       0       10       1       NULL     NULL       ... 



SP_COLUMNS EMPLOYEES
GO


TABLE EMPLOYEES_BACKUP

             TABLE_OWNER   TABLE_NAME   COLUMN_NAME   DATA_TYPE  TYPE_NAME     PRECISION   LENGTH  SCALE   RADIX    NULLABLE REMARKS  COLUMN_DEF ...
---------    ---------     --------     ------------- ------     ------------- -------     -----   ------  ------   -----    ------   --------   ...
database      dbo          EMPLOYEES    ID_BACKUP          4     int identity  10           4       0       10       0       NULL     NULL       ...
database      dbo          EMPLOYEES    ID_EMPLOYEE        4     int           10           4       0       10       0       NULL     NULL       ...
database      dbo          EMPLOYEES    NAME              12     varchar       30           30      NULL    NULL     0       NULL     NULL       ... 
database      dbo          EMPLOYEES    NEW_SALARY         2     numeric       10           12      2       10       0       NULL     NULL       ...
database      dbo          EMPLOYEES    OLD_SALARY         2     numeric       10           12      2       10       0       NULL     NULL       ...
database      dbo          EMPLOYEES    DATE_              11    datetime      23           16      3       NULL     1       NULL     NULL       ... 
...
...

*/

/*
INSERT INTO EMPLOYEES VALUES("ROBSON", 1500.00, NULL),
                            ("MARIA", 5000.00, 3),
                            ("MARIO", 1800.00, 2),
                            ("ASTER", 2000.00, 20),
                            ("SORA", 3000.00, 3)
GO


SELECT * FROM EMPLOYEES
GO


	TABLE EMPLOYEES

IDEMPLOYEE  NAME                           SALARY       SALES      
----------- ------------------------------ ------------ -----------
          1 ROBSON                              1500.00        NULL
          2 MARIA                               5000.00           3
          3 MARIO                               1800.00           2
          4 ASTER                               2000.00          20
          5 SORA                                3000.00           3

*/



/* DONT NEDD CHANGE THE DELIMITER*/

CREATE TRIGGER BKP_EMPLOYEE
ON EMPLOYEES
FOR UPDATE 
AS 
  DECLARE @ID_EMP INT
  DECLARE @NAME_ VARCHAR(30)
  DECLARE @NEW_SAL NUMERIC(10,2)
  DECLARE @OLD_SAL NUMERIC(10,2)
  DECLARE @DATE_ DATETIME
  DECLARE @USER_ VARCHAR(30)
  DECLARE @MESSAGE VARCHAR(100)


  SELECT @ID_EMP  = IDEMPLOYEE FROM INSERTED
  SELECT @NAME_   = NAME       FROM INSERTED
  SELECT @NEW_SAL = SALARY     FROM INSERTED
  SELECT @OLD_SAL = SALARY     FROM DELETED
  
  SET @DATE_ = GETDATE()
  SET @USER_ = SUSER_NAME()
  SET @MESSAGE = 'VALUE INSERTED FROM TRIGGER BKP_EMPLOYEE'
  
  INSERT INTO EMPLOYEES_BACKUP(ID_EMPLOYEE,NAME,NEW_SALARY,OLD_SALARY,
  DATE_,USER_,MESSAGE) VALUES(@ID_EMP,@NAME_,@NEW_SAL,@OLD_SAL,@DATE_,
  @USER_,@MESSAGE)
  
  PRINT 'TRIGGER BKP_EMPLOYEE EXECUTED SUCCESSFULL'
  
GO




/*
-------------COMMANDS-----------
UPDATE EMPLOYEES 
SET SALARY = 2100.00
WHERE NAME = 'ASTER'
GO

UPDATE EMPLOYEES 
SET SALARY = 2500.00
WHERE NAME = 'SORA'
GO


SELECT * FROM EMPLOYEES
GO

SELECT * FROM EMPLOYEES_BACKUP
GO

---------------OUTPUT------------



TRIGGER BKP_EMPLOYEE EXECUTED SUCCESSFULL

(1 rows affected)

(1 rows affected)
TRIGGER BKP_EMPLOYEE EXECUTED SUCCESSFULL

(1 rows affected)
IDEMPLOYEE  NAME                           SALARY       SALES      
----------- ------------------------------ ------------ -----------
          1 ROBSON                              1500.00        NULL
          2 MARIA                               5000.00           3
          3 MARIO                               1800.00           2
          4 ASTER                               2100.00          20
          5 SORA                                2500.00           3

(5 rows affected)
ID_BACKUP   ID_EMPLOYEE NAME    NEW_SALARY   OLD_SALARY   DATE_                   USER_    MESSAGE                                                                                             
----------- ----------- ------- ------------ ------------ ----------------------- -------  -----------------------------------------
          1           4 ASTER   2100.00      2000.00      2022-12-01 12:14:52.073 user     VALUE INSERTED FROM TRIGGER BKP_EMPLOYEE 
          2           5 SORA    2500.00      3000.00      2022-12-01 12:14:52.100 user     VALUE INSERTED FROM TRIGGER BKP_EMPLOYEE 
*/


/* if the update affects more than one row the trigger will not work as
expected, for that, there is another way to create it*/

DROP TRIGGER BKP_EMPLOYEE
GO


CREATE TRIGGER BKP_EMPLOYEE
ON EMPLOYEES
FOR UPDATE 
AS 


  
  INSERT INTO EMPLOYEES_BACKUP(ID_EMPLOYEE,NAME,NEW_SALARY,OLD_SALARY,
  DATE_,USER_,MESSAGE) 
  SELECT I.IDEMPLOYEE,I.NAME,
  I.SALARY,D.SALARY,GETDATE(),
  SUSER_NAME(),'VALUE INSERTED FORM TRIGGER BKP_EMPLOYEE' /*SELECT THE VALUES WITHOUT, DECLARE VARIABLES*/
  FROM DELETED D, INSERTED I /* NAME THE INSERTED AND DELETED*/
  WHERE I.IDEMPLOYEE = D.IDEMPLOYEE /* THE CONDITION FOR MORE THAN ONE ROW */
  
  
  PRINT 'TRIGGER BKP_EMPLOYEE EXECUTED SUCCESSFULL'
  
GO

/*
---------------OUTPUT------------
UPDATE EMPLOYEES 
SET SALARY = 2100.00
GO

SELECT * FROM EMPLOYEES
GO

SELECT * FROM EMPLOYEES_BACKUP
GO

(5 rows affected)
TRIGGER BKP_EMPLOYEE EXECUTED SUCCESSFULL

(5 rows affected)
IDEMPLOYEE  NAME                           SALARY       SALES      
----------- ------------------------------ ------------ -----------
          1 ROBSON                              2100.00        NULL
          2 MARIA                               2100.00           3
          3 MARIO                               2100.00           2
          4 ASTER                               2100.00          20
          5 SORA                                2100.00           3

(5 rows affected)
ID_BACKUP   ID_EMPLOYEE NAME    NEW_SALARY   OLD_SALARY   DATE_                   USER_   MESSAGE                                                                                             
----------- ----------- ------- ------------ ------------ ----------------------- ------- ------------------------------------------
          1           5 SORA         2100.00      3000.00 2022-12-01 15:31:52.710 user     VALUE INSERTED FORM TRIGGER BKP_EMPLOYEE                                                            
          2           4 ASTER        2100.00      2000.00 2022-12-01 15:31:52.710 user     VALUE INSERTED FORM TRIGGER BKP_EMPLOYEE                                                            
          3           3 MARIO        2100.00      1800.00 2022-12-01 15:31:52.710 user     VALUE INSERTED FORM TRIGGER BKP_EMPLOYEE                                                            
          4           2 MARIA        2100.00      5000.00 2022-12-01 15:31:52.710 user     VALUE INSERTED FORM TRIGGER BKP_EMPLOYEE                                                            
          5           1 ROBSON       2100.00      1500.00 2022-12-01 15:31:52.710 user     VALUE INSERTED FORM TRIGGER BKP_EMPLOYEE                                                            

(5 rows affected)
*/





					/*TRIGGER WITH EXCEPTION*/


DROP TRIGGER BKP_EMPLOYEE
GO

CREATE TRIGGER BKP_EMPLOYEE
ON EMPLOYEES
FOR INSERT,UPDATE /* CAN USE MORE THAN CONDITION  */
AS 
  DECLARE 
    @MIN_SALARY NUMERIC(10,2),
    @MAX_SALARY NUMERIC(10,2),
    @SALARY NUMERIC(10,2)
    
  SET @MIN_SALARY = 1000.00
  SET @MAX_SALARY = 3000.00
    
    
  SELECT @SALARY = SALARY FROM INSERTED
  
  
  
  IF(@SALARY < @MIN_SALARY)
  BEGIN
    RAISERROR('SALARY LESS THAN THE FLOOR',16,1) /*COMAND TO RETURN A ERROR, THE NUMBERS 16 AND 1, INDICATE, 
    USER ERROR*/
    ROLLBACK TRASACTION/* CANCEL THE TRASACTION (UPDATE,DELETE OR INSERT) */
  
  END
  
  IF(@SALARY > @MAX_SALARY)
  BEGIN
    RAISERROR('SALARY HIGHER THAN THE FLOOR',16,1) /*COMAND TO RETURN A ERROR, THE NUMBERS 16 AND 1, INDICATE, 
    USER ERROR*/
    ROLLBACK TRASACTION/* CANCEL THE TRASACTION (UPDATE,DELETE OR INSERT) */
  
  END
  
GO


/*
TESTING
*/
INSERT INTO EMPLOYEES VALUES("RENAN", 3100.00, NULL)
GO


Msg 50000, Level 16, State 1, Server ce7076989fe6, Procedure BKP_EMPLOYEE, Line 32
SALARY HIGHER THAN THE FLOOR



SELECT NAME, SALARY FROM EMPLOYEES
GO

/*
NAME                           SALARY      
------------------------------ ------------
ROBSON                              1500.00
MARIA                               5000.00
MARIO                               1800.00
ASTER                               2000.00
SORA                                3000.00

*/








									  /*#####################################
										############# PROCEDURES ############
										#####################################*/



CREATE PROCEDURE ALL_EMPLOYEES --NAME OF PROCEDURE--
AS

	SELECT NAME, SALARY FROM EMPLOYEES

GO


EXEC ALL_EMPLOYEES --FOR EXECUTE--
GO

/*
NAME                           SALARY      
------------------------------ ------------
ROBSON                              1500.00
MARIA                               5000.00
MARIO                               1800.00
ASTER                               2000.00
SORA                                3000.00

*/


DROP PROCEDURE ALL_EMPLOYEES
GO


							/* PROCEDURES WITH PARAMETERS */



CREATE PROCEDURE INCREASE_SALARY @MULT_VALUE NUMERIC(10,2) --NAME OF PROCEDURE-- 
AS

	UPDATE EMPLOYEES SET SALARY = SALARY + SALARY*(@MULT_VALUE/100)

GO


EXEC INCREASE_SALARY 25 GO

/*
(5 rows affected)
NAME                           SALARY      
------------------------------ ------------
ROBSON                              1875.00
MARIA                               6250.00
MARIO                               2250.00
ASTER                               2500.00
SORA                                3750.00
*/	

DROP PROCEDURE INCREASE_SALARY
GO






							/* PROCEDURES WITH OUTPUT PARAMETERS */


CREATE PROCEDURE AVERAGE_SALARY @VALUE NUMERIC(10,2) OUTPUT --USE THE 'OUTPUT' PARAMETER TO USE THE VARIABLE AS AN OUTUPUT--
AS
  	DECLARE @EMPLOYEES INT
	SELECT @EMPLOYEES = COUNT(*), @VALUE = SUM(SALARY)/@EMPLOYEES FROM EMPLOYEES

GO


DECLARE @RESULT NUMERIC(10,2) --DECLARE A VARIABLE--
EXEC AVERAGE_SALARY @VALUE = @RESULT OUTPUT --USE THE DECLARED VARIABLE TO CATCH THE OUTUPT--
SELECT @RESULT AS 'SALARY AVERAGE' --GET THE RESULT--
GO

/*
SALARY AVERAGE
--------------
       3325.00
       */



/* USING THE OUTUPT */


DECLARE @RESULT NUMERIC(10,2)
EXEC AVERAGE_SALARY @VALUE = @RESULT OUTPUT
SELECT NAME, SALARY FROM EMPLOYEES WHERE SALARY >= @RESULT 
GO

/*
NAME       SALARY      
---------- ------------
MARIA           6250.00
SORA            3750.00
*/






















