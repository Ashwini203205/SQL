# STORED PROCEDURES : CREATE SHORT CUT OR FUNCTION AT ONCE AND CALL MANY TIMES.
  -- MANUAL CALLED BY USER,CAN ACCEPT MULTIPLE I/P & O/prepare.
  
USE COLLEGE;

DELIMITER $$                      #TEMPORARY CHANGE STATEMENT DELIMITER 
CREATE PROCEDURE USERS()
BEGIN
SELECT * FROM STUDENT;
END $$
DELIMITER ;

CALL USERS();
  
DROP PROCEDURE IF EXISTS USERS;




# TRIGGER : TO TRIGGER (AUTOMATICALLY EXECUTE) PERTICULAR ACTION
   -- AUTOMATICALLY WHEN EVENT OCCUR,CANNOT ACCEPT MULTIPLE I/P & O/prepare.

SELECT * FROM STUDENT;
DROP TABLE STUDENT;


CREATE TABLE employees (
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    dept VARCHAR(50),
    salary DECIMAL(10, 2)
);


DELIMITER //

CREATE TRIGGER TRIGGER_BEFORE_INSERT
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN
  IF NEW.SALARY<0 THEN
     SET NEW.SALARY=0;
  END IF;
END //

DELIMITER //

SHOW TRIGGERS;

INSERT INTO EMPLOYEES(FNAME,LNAME,DEPT,SALARY)
VALUES
('TEST','TEST','IT','-2500');

SELECT * FROM EMPLOYEES;




-- 1. Create the main employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    dept VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- 2. Create the log table to store automatic messages
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_message VARCHAR(255),
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the automatic trigger
DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_log (log_message)
    VALUES (CONCAT('New employee added: ', NEW.fname, ' ', NEW.lname));
END //
DELIMITER ;

-- 4. Test it by adding one employee
INSERT INTO employees (fname, lname, dept, salary) 
VALUES ('John', 'Doe', 'IT', 60000.00);

-- 5. See the automatic result in the log table
SELECT * FROM employee_log;




# WILDCARD OPERATOR: MATTER MACHING IN TEXT
# % : MATCH ANY SEQUENCE
# - : MACHING SINGLE CHAR

CREATE DATABASE DB;

USE DB;

CREATE TABLE STUDENT (
    ROLLNO INT PRIMARY KEY,
    NAME VARCHAR(50),
    MARKS INT NOT NULL,
    GRADE VARCHAR(1),
    CITY VARCHAR(20)
);

INSERT INTO STUDENT (ROLLNO,NAME,MARKS,GRADE,CITY) 
VALUES
(101,"ASHWINI",20,"A","PUNE"),
(102,"YASH",18,"C","MUMBAI"),
(103,"VAIDEHI",21,"B","PUNE"),
(104,"RUPALI",25,"A","DELHI"),
(105,"MOHAN",26,"B","PUNE"),
(106,"ROHAN",22,"A","MUMBAI");

SELECT * FROM STUDENT;

SELECT * FROM STUDENT WHERE NAME LIKE 'R%';
SELECT * FROM STUDENT WHERE NAME LIKE '_A_H%';


# DISTINCT : UNIQUE ELEMENT

SELECT DISTINCT CITY FROM STUDENT;




#Functions 
# String fuctions

use db;
SELECT * FROM STUDENT;  
 
#  length fuction

SELECT name, Length(name) as name_length FROM Student;
 
#  LOWER() UPPER()

SELECT name, LOWER(name) As Lowercase_name FROM Student;     
SELECT name,UPPER(name) As Uppercase_name FROM Student; 
  
# CONCAT() : use to combine two columns 

SELECT  CONCAT(name, '<',rollno, '>') AS Student_detail from Student;
    
#DATE FUNCTION 

SELECT NOW();           #current date and time gives


#Mathematical fuction: mod() ROUND() FLOOR() CEIL()

#condition fuction if()
