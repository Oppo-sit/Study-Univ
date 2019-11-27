USE sqlDB;
DROP PROCEDURE IF EXISTS userProc; #프로시저가 있다면 지워준다

DELIMITER $$
CREATE PROCEDURE userProc()
BEGIN

	SELECT * FROM userTBL;

END $$ #달러 위치 주의
DELIMITER ; #세미콜론 위치 주의

CALL userProc();

##매개변수 사용한 스토어드 프로시저

USE tableDB;
DROP PROCEDURE IF EXISTS userProc1;

DELIMITER $$ 
CREATE PROCEDURE userProc1(IN userName VARCHAR(10)) #매개변수를 VARCHAR Type의 userName으로 입력받는다.
BEGIN

	SELECT * FROM userTBL WHERE NAME = userName;
    
END $$
DELIMITER ;

CALL userProc1('조용필');

#태어난 해가 입력한 연도보다 크고, 입력한 수치보다 키가 큰 사람(입력 매개변수 2개)

USE tableDB;
DROP PROCEDURE IF EXISTS userProc2;

DELIMITER $$
CREATE PROCEDURE userProc2(IN birth INT, IN h INT)
BEGIN

	SELECT * FROM userTBL 
		WHERE birthYear > birth AND height > h;

END $$
DELIMITER ;

CALL userProc2(1970, 170);

#IN, OUT 매개변수가 모두 있는 프로시저

DROP PROCEDURE IF EXISTS userProc3;

DELIMITER $$
CREATE PROCEDURE userProc3(
	IN txtValue CHAR(10), OUT outValue INT)
BEGIN

	INSERT INTO testTBL VALUES(NULL, txtValue);
    SELECT MAX(id) INTO outValue FROM testTBL; #MAX(id) -> auto increment이므로 id의 최댓값이 id의 개수를 의미

END $$
DELIMITER ;

CREATE TABLE IF NOT EXISTS testTBL(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    txt CHAR(10)
);

SELECT * FROM testTBL;

CALL userProc3('테스트값', @myValue); #out 매개변수를 다 @로 시작해야 하는건가요
SELECT CONCAT('현재 입력된 ID 값 ==>', @myValue);

#ifelse 프로시저(분기)

DROP PROCEDURE IF EXISTS ifelseProc;

DELIMITER $$
CREATE PROCEDURE ifelseProc(IN userName VARCHAR(10))
BEGIN

	DECLARE bYEAR INT;
    SELECT birthYear into bYear FROM userTBL
		WHERE NAME = USERNAME;
	IF(bYear >= 1980) THEN SELECT '아직 젊군요.';
	ELSE SELECT '나이가 지긋하네요.';
    END IF;
END $$
DELIMITER ;

CALL ifelseProc('김경호');

#case 프로시저는 나중에 연습해보기
