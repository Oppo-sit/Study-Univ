##혼합 인덱스

#테이블 생성
CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
DROP TABLE IF EXISTS mixedTBL;
CREATE TABLE mixedTBL
	(userID CHAR(8) NOT NULL, name VARCHAR(10) NOT NULL, addr CHAR(2));
    
SELECT * FROM mixedTBL;

INSERT INTO mixedTBL VALUES('LSG', '이승기', '서울');
INSERT INTO mixedTBL VALUES('KBS', '김범수', '경남');
INSERT INTO mixedTBL VALUES('KKH', '김경호', '전남');
INSERT INTO mixedTBL VALUES('JYP', '조용필', '경기');
INSERT INTO mixedTBL VALUES('SSK', '성시경', '서울');
INSERT INTO mixedTBL VALUES('LJB', '임재범', '서울');
INSERT INTO mixedTBL VALUES('YJS', '윤종신', '경남');
INSERT INTO mixedTBL VALUES('EJW', '은지원', '경북');
INSERT INTO mixedTBL VALUES('JKW', '조관우', '경기');
INSERT INTO mixedTBL VALUES('BBK', '바비킴', '서울');

drop table mixedTBL;

ALTER TABLE mixedTBL
	ADD CONSTRAINT PK_mixedTBL_userID PRIMARY KEY(userID),
    ADD CONSTRAINT UQ_mixedTBL_name UNIQUE(name);
    
SHOW INDEX FROM mixedTBL;
#userID에 클러스터 인덱스가, name에 보조 인덱스가 생성됐음을 알 수 있다.

#인덱스 생성 제거
USE tableDB;
SELECT * FROM userTBL;
SHOW INDEX FROM userTBL;

SHOW TABLE STATUS LIKE 'userTBL';

CREATE INDEX idx_userTBL_addr ON userTBL(addr); #인덱스 생성(보조 인덱스만 가능)

ANALYZE TABLE userTBL; #analyze 명령을 해야 table status의 변화를 확인 할 수 있다.
SHOW TABLE STATUS LIKE 'userTBL';

CREATE INDEX idx_userTBL_birthYear ON userTBL(birthYear);
CREATE INDEX idx_userTBL_name ON userTBL(name);
#원래 의도한 바로는 birthYear는 오류가 나야되는데....
#이유는 birthYear와 같은 중복이 많은 컬럼은 인덱스 생성 시 오류가 발생할 수 있다.

SHOW INDEX FROM userTBL;