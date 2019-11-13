##Inner Join 실습

Use sqlDB;

CREATE TABLE stdTBL
	(
	stdName char(3) Not null Primary Key,
    stdAddr char(2) Not null
    );
    
CREATE TABLE clubTBL
	(
    clubName char(2) Not null Primary Key,
    clubRoom char(4) Not null
    );
    
CREATE TABLE stdclubTBL
	(
    num INT auto_increment NOT NULL PRIMARY KEY,
    stdName char(3) Not null,
    clubName char(2) Not null,
    FOREIGN KEY(stdName) REFERENCES stdTBL(stdName),
    FOREIGN KEY(clubName) REFERENCES clubTBL(clubName)
    );
    
insert into stdTBL 
	VALUES('김범수', '경남');
insert into stdTBL 
	VALUES('성시경', '서울');
insert into stdTBL 
	VALUES('조용필', '경기');
insert into stdTBL 
	VALUES('은지원', '경북');
insert into stdTBL 
	VALUES('바비킴', '서울');
    
insert into clubTBL 
	VALUES('수영', '101호');
insert into clubTBL 
	VALUES('바둑', '102호');
insert into clubTBL 
	VALUES('축구', '103호');
insert into clubTBL 
	VALUES('봉사', '104호');

insert into stdclubTBL 
	VALUES(NuLL, '김범수', '바둑');    
insert into stdclubTBL 
	VALUES(NuLL, '김범수', '축구');
insert into stdclubTBL 
	VALUES(NuLL, '조용필', '축구');
insert into stdclubTBL 
	VALUES(NuLL, '은지원', '축구');
insert into stdclubTBL 
	VALUES(NuLL, '은지원', '봉사');
insert into stdclubTBL 
	VALUES(NuLL, '바비킴', '봉사');
    
select S.stdName, S.stdaddr, C.Clubname, C.ClubRoom
	From stdtbl S 
    inner join stdclubtbl SC ON S.stdName = SC.stdName
		inner join clubtbl C ON SC.clubName = C.clubName
	Order by S.stdName; #Student를 중심으로 Inner Join
    
select C.clubName, C.clubRoom, S.stdName, S.stdAddr
	From stdTBL S Inner Join stdclubtbl SC on SC.stdName=S.stdName
		Inner Join clubTBL C ON SC.clubName=C.clubName
	Order by C.clubName; #Club을 중심으로 InnerJoin
		
    
