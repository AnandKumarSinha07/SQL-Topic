
CREATE DATABASE Company;
USE Company;


CREATE TABLE Worker 
( 
  Worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  First_Name CHAR(25),
  Last_Name CHAR(25),
  Salary INT(15),
  Joining_Date DATETIME,
  Department CHAR(25)
); 


Insert INTO Worker 
    (Worker_id, First_Name, Last_Name, Salary, Joining_Date, Department) 
    VALUES
    (001, 'Monika' , 'Arora', 100000, '14-02-20 09:00:00'  , 'HR'),
    (002, 'Niharika' , 'Verma', 80000, '14-06-11 09:00:00' , 'Admin'),
    (003, 'Vishal' , 'Singhal', 300000, '14-02-20 09:00:00' , 'HR'),
    (004, 'Amitabh' , 'Singh', 500000, '14-02-20 09:00:00' , 'Admin'),
    (005, 'Vivek' , 'Bhati', 500000, '14-06-11 09:00:00' , 'Admin'), 
    (006, 'Vipul' , 'Diwan' , 200000 , '14-06-11 09:00:00' , 'Account'),
    (007, 'Satish' , 'Kumar' , 75000, '14-01-20 09:00:00' , 'Account'),
    (008, 'Geetika' , 'Chauhan' , 90000, '14-04-11 09:00:00' , 'Admin'); 
    
SELECT *FROM Worker;


-- References from the Main Table 'Worker'
-- Stores the Amount of Bonus being given to some Worker Corresponding to their 'Worker_id'
-- on delete cascade means if parent record is deleted chil record also get deleted automatically

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

INSERT INTO Bonus(WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE)
VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

SELECT * FROM Bonus;
           
-- References the Main Table 'Worker'
-- Stores the Title assigned to a worker Corresponding to their 'Worker_id'

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
	ON DELETE CASCADE
);

INSERT INTO Title(WORKER_REF_ID , WORKER_TITLE , AFFECTED_FROM)
VALUES
	      (001, 'Manager', '2016-02-20 00:00:00'),
          (002, 'Executive', '2016-06-11 00:00:00'),
          (008, 'Executive', '2016-06-11 00:00:00'),
          (005, 'Manager', '2016-06-11 00:00:00'),
          (004, 'Asst. Manager', '2016-06-11 00:00:00'),
          (007, 'Executive', '2016-06-11 00:00:00'),
          (006, 'Lead', '2016-06-11 00:00:00'),
          (003, 'Lead', '2016-06-11 00:00:00');
    
SELECT * FROM Title;


--  Query1
-- Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

SELECT First_Name,Salary FROM Worker;

-- Query 2
-- Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

SELECT UPPER(First_Name) FROM Worker;

SELECT *FROM Worker WHERE Salary>80000;
SELECT *FROM Worker WHERE Department='Admin';


-- WRITE AN SQL QUERY TO FETCH SALARY OF WORKET BETWEEN 80000 TO 100000
SELECT *FROM Worker WHERE Salary BETWEEN  80000 AND 100000;


-- reduce or statement
-- select all those worker who work in hr and admin deparment both
SELECT *FROM Worker WHERE DEPARTMENT ='HR' OR DEPARTMENT ='Admin';
SELECT *FROM Worker WHERE DEPARTMENT IN('HR','Admin');
SELECT *From Worker WHERE Salary IN('500000','300000');

-- select all those worker salary which is not 500000 and 300000
SELECT *From Worker WHERE Salary NOT IN('500000','300000');



-- WildCard pattern matching
SELECT *FROM Worker WHERE First_Name  LIKE '%v%';

-- SORTING GiVEN A QUERY TO SORT WORKER SALARY IN THE ASCENDING ORDER 

SELECT *FROM Worker ORDER BY Salary;


-- To sort in a descending way
SELECT *FROM Worker ORDER BY Salary DESC;


-- DISTINT KEYWORD
SELECT DISTINCT Department from Worker;


-- Group BY
SELECT DEPARTMENT ,COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;

-- FIND AVG SALARY PER DEPARTMENT
SELECT DEPARTMENT,AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;


-- minumun salry per department
SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;


-- Maximum SALARY PER DEPARTMENT 
SELECT DEPARTMENT,MAX(SALARY) FROM Worker GROUP BY  DEPARTMENT;


-- TOTAL SALARY PER DEPARTMENT 
SELECT DEPARTMENT,SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;


-- Having 
SELECT DEPARTMENT ,COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)>2;














