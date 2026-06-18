SHOW DATABASES;  

CREATE DATABASE TEMP1;
CREATE DATABASE TEMP2;
SHOW DATABASES;

DROP DATABASE TEMP1;
DROP DATABASE TEMP2;
SHOW DATABASES;

CREATE DATABASE college;
SHOW DATABASES;
USE college;
CREATE TABLE student(
   id INT PRIMARY KEY,
   name VARCHAR(50),
   age INT NOT NULL
);

INSERT INTO student VALUES(1,"ASHWINI",20);
INSERT INTO student VALUES(2,"VAIDEHI",21);

SELECT * FROM student;



# DAY 2


# If we want to create database but we dont remember it has exit or not then use "IF NOT EXIT"
CREATE DATABASE IF NOT EXISTS college;
# IF college db not exit then create else not create also not give error.

#similar to DROP
DROP DATABASE IF EXISTS company;

SHOW DATABASES;
SHOW TABLES;
DROP TABLE student;

USE college;
CREATE TABLE student(
  rollno INT PRIMARY KEY,
  name VARCHAR(50)
);

# Insted of writting "INSERT INTO table_name VALUES();" we can use follow formula :

SELECT * FROM student;
INSERT INTO student
(rollno, name)
VALUES
(1,"ASHWINI"),
(2,"YASH"),
(3,"VAIDEHI");

INSERT INTO student VALUES (4,"RUPALI")


