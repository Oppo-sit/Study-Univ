CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
CREATE TABLE IF NOT EXISTS testTBL (id INT, txt VARCHAR(10));
INSERT INTO testTBL VALUES(1,'이엑스아이디');
INSERT INTO testTBL VALUES(2,'애프터스쿨');
INSERT INTO testTBL VALUES(3,'에이오에이');

SELECT * FROM testTBL;

DROP TRIGGER IF EXISTS testTrg;
DELIMITER //
CREATE TRIGGER testTrg # 트리거 이름
	AFTER DELETE # 조건 => 삭제 이후
    ON testTBL # 트리거를 부착(대상이 될)할 테이블
    FOR EACH ROW
BEGIN
	SET @msg = '가수 그룹이 삭제됨'; #트리거의 내용 
END //
DELIMITER ;

SET @msg = ' '; # 변수 선언, 트리거의 내용이 채워질 예정

INSERT INTO testTBL VALUES(4, '나인뮤지스');
SELECT @msg;
UPDATE testTBL SET txt = '에이핑크' where id = 3;
SELECT @msg;
DELETE FROM testTBL WHERE id = 4;
SELECT @msg;


#userTBL의 백업 테이블 

USE tableDB;
DROP TABLE backup_userTBL;
CREATE TABLE backup_userTBL
	(userID CHAR(8) NOT NULL PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT,
    mDATE DATE,
    modType CHAR(2),
    modDate DATE,
    modUser VARCHAR(256)
    );
    
    
DROP TRIGGER IF EXISTS backupTBL_UpdateTrg; # UPDATE 트리거 생성
DELIMITER //
CREATE TRIGGER backupTBL_UpdateTrg
	AFTER UPDATE
    ON userTBL
    FOR EACH ROW
BEGIN 

	INSERT INTO backup_userTBL VALUES(OLD.userID, OLD.name, OLD.birthYear, OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mDate, '수정', CURDATE(), CURRENT_USER());
END //
DELIMITER ;

DROP TRIGGER IF EXISTS backupTBL_DeleteTrg; #DELETE 트리거 생성
DELIMITER //
CREATE TRIGGER backupTBL_DeleteTrg
	AFTER DELETE
    ON userTBL
    FOR EACH ROW
BEGIN 

	INSERT INTO backup_userTBL VALUES(OLD.userID, OLD.name, OLD.birthYear, OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mDate, '삭제', CURDATE(), CURRENT_USER()); #OLD.열이름 : 변화 이전의 VALUE
END //
DELIMITER ;

UPDATE userTBL SET addr = '몽고' WHERE userID = 'JYP'; #데이터 변경
DELETE FROM userTBL WHERE height >= 177; #데이터 삭제

SELECT * FROM backup_userTBL;


DROP TRIGGER IF EXISTS userTBL_insertTrg; #데이터 입력되지 못하게
DELIMITER //
CREATE TRIGGER userTBL_InsertTrg
	AFTER INSERT
	ON userTBL
	FOR EACH ROW
BEGIN
	
    SIGNAL SQLSTATE '45000' # 입력을 막는 코드로 보임
		SET MESSAGE_TEXT = '데이터의 입력을 시도했습니다. 귀하의 정보가 서버에 기록되었습니다.';
	
END //
DELIMITER ;

INSERT INTO userTBL VALUES('ABC', '에비씨', 1977, '서울', '011', '1111111', 181, '2019-12-25'); #데이터 입력
SELECT * FROM userTBL; #입력이 안된 것을 알 수 있다.

SHOW TRIGGERS FROM tableDB;

#BEFORE 테이블

DROP TRIGGER IF EXISTS userTBL_BeforeINSERTrg;
DELIMITER //
CREATE TRIGGER userTBL_BeforeInsertTrg
	BEFORE INSERT
    ON userTBL
    FOR EACH ROW
BEGIN

	IF NEW.birthYear <1900 THEN SET NEW.birthYear = 0;
    ELSEIF NEW.birthYear > YEAR(CURDATE()) THEN SET NEW.birthYEAR = YEAR(CURDATE());
    END IF;
END //
DELIMITER ;

INSERT INTO userTBL VALUES ('AAA', '에이', 1877, '서울', '011', '1112222', 181, '2019-12-25');
INSERT INTO userTBL VALUES ('BBB', '비이', 2977, '경기', '011', '1113333', 171, '2011-3-25');

SELECT * FROM userTBL;

#중첩 테이블

DROP DATABASE IF EXISTS triggerDB;
CREATE DATABASE IF NOT EXISTS triggerDB;

USE triggerDB;
DROP TABLE IF EXISTS orderTBL, prodTBL, deliverTBL;

CREATE TABLE IF NOT EXISTS orderTBL
	(orderNo INT AUTO_INCREMENT PRIMARY KEY,
    userID VARCHAR(5),
    prodName VARCHAR(5),
    orderamount INT);
    
CREATE TABLE prodTBL (prodName VARCHAR(5), account INT);

CREATE TABLE deliverTBL
	(deliverNo INT AUTO_INCREMENT PRIMARY KEY,
	prodName VARCHAR(5),
    account INT UNIQUE);
    
INSERT INTO prodTBL VALUES('사과', 100);
INSERT INTO prodTBL VALUES('배', 100);
INSERT INTO prodTBL VALUES('귤', 100);


SELECT * FROM prodTBL;

#물품 개수를 감소시키는 트리거
DROP TRIGGER IF EXISTS orderTrg;
DELIMITER //
CREATE TRIGGER orderTrg
	AFTER INSERT
    ON orderTBL
    FOR EACH ROW
BEGIN
	
    UPDATE prodTBL SET account = account - NEW.orderAmount
		WHERE prodName = NEW.prodName;
	
END //
DELIMITER ;

#배송 테이블에 새 배송 건을 입력하는 트리거
DROP TRIGGER IF EXISTS prodTrg;
DELIMITER //
CREATE TRIGGER prodTrg
	AFTER UPDATE
    ON prodTBL
    FOR EACH ROW
BEGIN
	
    DECLARE orderAmount INT;
    SET orderAmount = OLD.account - NEW.account;
	INSERT INTO deliverTBL(prodName, account) VALUES(NEW.prodName, orderAmount);
	
END //
DELIMITER ;

INSERT INTO orderTBL VALUES(NULL, 'JOHN', '배', 5);
SELECT * FROM orderTBL;
SELECT * FROM prodTBL;
SELECT * FROM deliverTBL;