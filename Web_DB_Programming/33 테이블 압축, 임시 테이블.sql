SHOW VARIABLES LIKE 'innodb_file_format'; #value : barracuda
SHOW VARIABLES LIKE 'innodb_large_prefix'; #value : ON -> 위 두 조건을 만족하므로 압축 가능

#테이블 압축

CREATE DATABASE IF NOT EXISTS compressDB;

USE compressDB;
CREATE TABLE normalTBL(emp_no int, first_name VARCHAR(14));
CREATE TABLE compressTBL(emp_no int, first_name VARCHAR(14))
	ROW_FORMAT = COMPRESSED; # 포맷을 'COMPRESSED'로 설정(압축 테이블 설정)
    
INSERT INTO normalTBL
	SELECT emp_no, first_name FROM employees.employees;
INSERT INTO compressTBL
	SELECT emp_no, first_name FROM employees.employees;

SHOW TABLE STATUS FROM compressDB; 
#show table status : 데이터베이스 안에 있는 테이블의 특징을 보여준다.
#결과를 보면 ROW_FORMAT이 COMPRESSED/DYNAMIC이고, data_length가 2배정도 차이난다.

DROP database IF EXISTS compressDB; 

#임시 테이블

USE employees;

#임시 테이블 생성
CREATE TEMPORARY TABLE IF NOT EXISTS tempTBL(ID INT, name CHAR(5));
CREATE TEMPORARY TABLE IF NOT EXISTS employees(ID INT, name CHAR(5));

DESCRIBE tempTBL;
DESCRIBE employees;

INSERT INTO tempTBL VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MySQL'); #같은 employees table이 존재하는데, 과연 데이터는 어디로 갈까?

SELECT * FROM tempTBL; #
SELECT * FROM employees; #데이터는 임시 테이블로 먼저 간다!

DROP TABLE tempTBL;

