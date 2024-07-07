
--  DDL COMMAND CREATE ALTERO DROP TRUNCATE RENAME
--  DML COMMAND LIKE INSERT UPDATE DELTE

CREATE DATABASE anand;
USE anand;


CREATE TABLE Customer(

id INT PRIMARY KEY,
cname VARCHAR(255),
Address VARCHAR(255),
Gender CHAR(2),
City VARCHAR(255),
Pincode INT
);


INSERT INTO Customer (id,cname,Address,Gender,City,Pincode)
VALUES(1,'Anand','Noida sector','M','delhi',144),
      (2,'Aryan','Mohali ','M','Amritsar',145),
      (3,'Aahil','Himachal','M','utrahakhand',146),
      (4,'Ram','marvel','M','london',147);

-- Replace act as if id is present and no data then it will insert data and if id and data both are present then modify it

REPLACE INTO Customer(id,City)
VALUES(4,'delhi');

REPLACE INTO Customer (id,cname,Address,Gender,City,Pincode)
VALUES(5,'abhi','extraction','M','Florida',148);



-- UPDATE DATA
UPDATE Customer SET cname='Arya', Address='Mohali',GENDER='F'WHERE ID=2;

-- UPDATE MULTIPLE ROWS
SET SQL_SAFE_UPDATES=0;
UPDATE Customer SET Address='BIHAR';


-- DELETE 
DELETE FROM Customer WHERE ID=1300;

-- DELETE WHOLE TABLE
DELETE FROM Customer;



-- creating a table in which we are using unique and constrant property

CREATE TABLE account(
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT,
CONSTRAINT acc_bal_check CHECK (balance>10000)
);

INSERT INTO account(id,name,balance)
VALUES (1,'Aahil',12000),
       (2,'Aanad',12200);

DROP TABLE account;

-- --------NEW TABLE ----------

CREATE TABLE  stats(
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

SELECT *FROM stats;
-- We Are learning alter command such as alter modify change column name drop a particular column add column

-- Add new Column
ALTER TABLE stats ADD interest FLOAT NOT NULL DEFAULT 0;

-- Change data type of column
ALTER TABLE stats MODIFY interest INT NOT NULL DEFAULT 0;

-- Rename The column
ALTER TABLE stats CHANGE interest  saving_interest INT NOT NULL DEFAULT 0;

-- Drop particular column

ALTER TABLE stats DROP COLUMN saving_interest;

-- Reaname The table
ALTER TABLE stats RENAME TO stats_data;

DESC stats;



----------------------------------- NEW TABLE


CREATE TABLE info(

id INT PRIMARY KEY,
cname VARCHAR(255),
Address VARCHAR(255),
Gender CHAR(2),
City VARCHAR(255),
Pincode INT
);

SELECT *FROM info;

INSERT INTO info (id,cname,Address,Gender,City,Pincode)
VALUES(2,'Anand','Noida sector','M','delhi',144),
	  (3,'Aahil','sector','M','Dubai',144);
      
SELECT *FROM info;

-- ON DELETE CASCADE MEANS SQL CLAUSE THAT IF I DELETE MY PARENT ROW TABLE THEN THE VALUE WHICH HAS BEEN USED IN THE CHILD ROW TABLE ALSO GET DELETED
CREATE TABLE info_children(
    order_id INT PRIMARY KEY,
    delivery_date DATE,
    info_id INT,
    FOREIGN KEY (info_id) REFERENCES info(id) ON DELETE SET NULL
);
-- FOREIGN KEY (info_id) REFERENCES info(id) ON DELETE CASCADE

INSERT INTO info_children (order_id ,delivery_date,info_id)
VALUES(4,'2019-09-11',3),
      (5,'2019-09-13',3);



SELECT *FROM info_children;

-- IF I DELETE INFO ID FROM PARENT TABLE AND IF I WANT TO ACCESS INSIDE MY CHILDREN TABLE SINCE THE REFERENCE CONSTRANT IS SET TO ON CASCADE SET TO NULL
-- THEN ALL THE CHIL WILL SET TO NULL PROPERTY OF PARENT ID

DELETE FROM info WHERE ID=3;















