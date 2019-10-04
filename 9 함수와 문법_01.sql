DROP DATABASE IF exists SQLDB; #기존의 DB를 없앤다.(초기화)
CREATE DATABASE sqlDB;

USE SQLDB;

CREATE TABLE userTBL
	(userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT,
    mDate DATE
    );
    


CREATE TABLE BUYTBL
	(num INT auto_increment NOT NULL PRIMARY KEY,  #auto_increment 행이 추가될 때마다 숫자가 자동으로 증가
    userID CHAR(8) NOT NULL,
    productName CHAR(6) NOT NULL,
    groupName CHAR(4),
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (userID) references userTBL (userID)
    );
    #userID를 primary key로 사용하면 안되는 이유 -> 구매 테이블이므로 userID가 겹칠 수 있기 때문에
    

SELECT * FROM USERTBL;
SELECT * FROM BUYTBL;


INSERT into userTBL VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008/8/8'); #숫자형은 따옴표 없이, 문자형은 ' ' 필요, 다만, date 또한 문자형이니 주의
INSERT into userTBL VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012/4/4');
INSERT into userTBL VALUES('KHH', '김경호', 1971, '전남', '019', '3333333', 177, '2007/7/7');
INSERT into userTBL VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2008/4/4');
INSERT into userTBL VALUES('SSG', '성시경', 1979, '서울', NULL, NULL, 186, '2013/12/12');
INSERT into userTBL VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 170, '2009/9/9');
INSERT into userTBL VALUES('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005/5/5');
INSERT into userTBL VALUES('EJW', '은지원', 1978, '경북', '011', '8888888', 174, '2014/3/3');
INSERT into userTBL VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010/10/10');
INSERT into userTBL VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 182, '2008/8/8');

INSERT INTO buyTBL VALUES(NULL,'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTBL VALUES(NULL,'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTBL VALUES(NULL,'JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTBL VALUES(NULL,'BBK', '모니터', '전자', 200, 5);
INSERT INTO buyTBL VALUES(NULL,'KBS', '청바지', '의류', 50, 3);
INSERT INTO buyTBL VALUES(NULL,'BBK', '메모리', '전자', 80, 10);
INSERT INTO buyTBL VALUES(NULL,'SSG', '책', '서적', 15, 5);
INSERT INTO buyTBL VALUES(NULL,'EJW', '책', '서적', 15, 2);
INSERT INTO buyTBL VALUES(NULL,'EJW', '청바지', '의류', 50, 1);
INSERT INTO buyTBL VALUES(NULL,'BBK', '운동화', NULL, 30, 2);
INSERT INTO buyTBL VALUES(NULL,'EJW', '책', '서적', 15, 1);
INSERT INTO buyTBL VALUES(NULL,'BBK', '운동화', NULL, 30, 2);



