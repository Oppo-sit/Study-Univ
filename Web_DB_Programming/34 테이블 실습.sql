CREATE DATABASE tableDB;

USE TABLEDB;

DROP TABLE IF EXISTS buyTBL, userTBL;
CREATE TABLE userTBL
(
userID CHAR(8), name NVARCHAR(10), birthYear INT, addr NCHAR(2), 
mobile1 CHAR(3), mobile2 CHAR(8), height SMALLINT, mDATE DATE
);

CREATE TABLE buyTBL
(
num INT AUTO_INCREMENT PRIMARY KEY, userID CHAR(8), prodName NCHAR(6),
groupName NCHAR(4), price INT, amount SMALLINT);

INSERT INTO userTBL VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTBL VALUES('KBS', '김범수', NULL, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTBL VALUES('KKH', '김경호', 1871, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTBL VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');

INSERT INTO buyTBL VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buyTBL VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTBL VALUES(NULL, 'JYP', '모니터', '전자', 200, 2);
INSERT INTO buyTBL VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);

#PK 설정

ALTER TABLE userTBL
	ADD CONSTRAINT PK_userTBL_userID
    PRIMARY KEY (userID);
    
DESCRIBE USERTBL; #key value로 PK 확인이 가능하다.

#FK 설정

DELETE FROM BUYTBL WHERE USERID = 'BBK'; #userTBL에 BBK가 없어서 외래키 설정이 안된다 -> BBK를 지워준다.

ALTER TABLE buyTBL
	ADD CONSTRAINT FK_userTBL_userID FOREIGN KEY(userID) REFERENCES userTBL(userID); #외래키를 설정한다.
    
show index from buytbl;

INSERT INTO buyTBL VALUES(NULL, 'BBK', '모니터', '전자', 200, 5); #BBK의 정보를 다시 입력해보자 -> 오류 발생!

SET foreign_key_checks = 0; #FK 기능을 비활성화 시켜준다.
INSERT INTO buyTBL VALUES(NULL, 'BBK', '모니터', '전자', 200, 5);
SET foreign_key_checks = 1; #입력 후 FK를 재활성화 시켜주어야 한다.
#그러나, FK를 억지로 넣는 것은 좋은 방법이 아니다.

INSERT INTO userTBL VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5'); #회원 테이블에 넣음으로써 두 정보를 매치시킨다.

#check 제약조건은 MySQL에서 지원 안한다..

#BBK ->VVK(외래키 비활성화, cascade 추가)

UPDATE userTBL SET userID = 'VVK' WHERE userID = 'BBK'; #userID 'BBK'를 'VVK'로 바꿔주려고 했는데, 오류가 발생
#한 쪽의 테이블 정보만 바꾸는 것은 불가능하다! -> 외래키 비활성화 해볼까?

SET foreign_key_checks = 0;
UPDATE userTBL SET userID = 'VVK' WHERE userID = 'BBK';
SET foreign_key_checks = 1;
#성공은 했다. 

#조인으로 구매자들의 데이터를 종합해보자
select B.userID, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2)
	FROM UserTBL U
    Inner Join buyTBL B ON B.userID = U.userID; #내부 조인, BBK가 없다.

select B.userID, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2)
	FROM UserTBL U
    RIGHT Outer Join buyTBL B ON B.userID = U.userID; #구매 테이블 기준 외부 조인 -> 여기서 BBK의 userTBL data가 없어 공란이 된다. 무결성 침해!
    
UPDATE userTBL SET userID = 'BBK' WHERE userID = 'VVK'; #VVK -> BBK

select B.userID, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2)
	FROM UserTBL U
    Inner Join buyTBL B ON B.userID = U.userID; #조인 결과 -> BBK가 추가되었다!
    
select B.userID, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2)
	FROM UserTBL U
    RIGHT Outer Join buyTBL B ON B.userID = U.userID; #조인 결과 -> 공란이 사라졌다!
    
#VVK로 다시 바꾸는데, 이번엔 두 테이블 같이 변화시키자(무결성 보존)
ALTER TABLE BUYTBL DROP FOREIGN KEY FK_userTBL_userID;
ALTER TABLE BUYTBL ADD CONSTRAINT FK_userTBL_userID 
	FOREIGN KEY(userID) REFERENCES userTBL(userID)
    ON UPDATE CASCADE; #update 명령어가 실행할 때 두 테이블 동시에 변경
    
UPDATE userTBL SET userID = 'VVK' WHERE userID = 'BBK'; #BBK -> VVK

select B.userID, U.name, B.prodName, U.addr, concat(U.mobile1, U.mobile2)
	FROM UserTBL U
    Inner Join buyTBL B ON B.userID = U.userID; #Inner Join의 결과에서 userID VVK가 나온다.(두 테이블 모두 변경)
    

delete from usertbl where userid = 'vvk'; #탈퇴를 위해 VVK를 지웠는데 오류 발생

ALTER TABLE BUYTBL DROP FOREIGN KEY FK_userTBL_userID;
ALTER TABLE BUYTBL ADD CONSTRAINT FK_userTBL_userID 
	FOREIGN KEY(userID) REFERENCES userTBL(userID)
    ON UPDATE CASCADE
    ON DELETE CASCADE; #delete 명령어를 실행할 때 두 테이블 동시에 변경
    
delete from usertbl where userid = 'vvk'; #제거가 정상적으로 진행된다! (무결성이 보존되었다.)


    




