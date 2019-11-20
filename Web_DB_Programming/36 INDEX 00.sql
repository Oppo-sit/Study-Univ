USE sqlDB;
CREATE TABLE tbl1
	(a INT PRIMARY KEY, b INT, C INT);
    
SHOW INDEX FROM tbl1;
#위 코드의 결과는 '한 줄', key 이름이 primary key로 PK가 자동으로 클러스터형 테이블로 지정됨을 알 수 있다.
#또한 Index_type이 BTREE, 즉, 균형 트리란 것을 알 수 있다.

CREATE TABLE tbl2
	(a INT PRIMARY KEY, b INT UNIQUE, c INT UNIQUE);
    
SHOW INDEX FROM tbl2;
#위 코드의 결과로 모든 열에 대한 인덱스가 생성됨을 알 수 있는데, a는 클러스터형, b, c는 보조 인덱스이다.
#세 컬럼 모두의 인덱스 유형은 BTREE

CREATE TABLE tbl3
	(a INT UNIQUE, b INT UNIQUE, c INT UNIQUE);
    
SHOW INDEX FROM tbl3;
#이 경우는 모두 보조 인덱스가 된다.
#세 컬럼 모두의 인덱스 유형은 BTREE

CREATE TABLE tbl4
	(a INT UNIQUE NOT NULL, b INT UNIQUE, c INT UNIQUE, d INT);
    
SHOW INDEX FROM tbl4;
#PK, UNIQUE 제약 조건이 없는 열 d는 인덱스가 없다.
#나머지 컬럼은 인덱스가 있으며, a는 클러스터형, 나머지는 보조 인덱스이다.
#세 컬럼 모두의 인덱스 유형은 BTREE

INSERT INTO tbl4 VALUES(3,3,3,3);
INSERT INTO tbl4 VALUES(2,2,2,2);

SELECT * FROM tbl4;

CREATE TABLE tbl5
	(a INT UNIQUE NOT NULL, b INT UNIQUE, c INT UNIQUE, d INT PRIMARY KEY);
    
SHOW INDEX FROM tbl5;
#d가 PK이므로 열 d에 속한 데이터가 클러스터형 인덱스가 되며 나머지는 전부 보조 인덱스가 된다.
#네 컬럼 모두의 인덱스 유형은 BTREE

#자동 인덱스(클러스터형) 관찰

CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
	(userID CHAR(8) NOT NULL,
	name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr NCHAR(2) NOT NULL
    );
    
INSERT INTO userTBL VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO userTBL VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO userTBL VALUES('KKH', '김경호', 1987, '서울');
INSERT INTO userTBL VALUES('JYP', '조용필', 1987, '서울');

SELECT * FROM userTBL; #입력한 순서대로 저장된다.

ALTER TABLE userTBL 
	ADD CONSTRAINT pk_userID PRIMARY KEY(userID); #userID를 PK로 설정
    
SHOW INDEX FROM userTBL; 
#userID(PK)가 클러스터형 인덱스로 설정되는데, 클러스터형 인덱스는 '사전'과 같아 인덱스로 설정된 열이 순서대로 정렬된다.(알파벳, 숫자, 한글)

SELECT * FROM userTBL; #데이터가 userID의 알파벳 순서대로 정렬된다.