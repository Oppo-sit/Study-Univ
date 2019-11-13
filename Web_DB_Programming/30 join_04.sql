#Self Join

use sqlDB;

CREATE TABLE empTBL
	(
    empName char(3) Not Null Primary Key,
    managerName char(3) ,
    telNum char(8) Not Null
    );
    
insert into emptbl VALUES('나사장', Null, '0000');
insert into emptbl VALUES('김재무', '나사장', '2222');
insert into emptbl VALUES('김부장', '김재무', '2222-1');
insert into emptbl VALUES('이부장', '김재무', '2222-2');
insert into emptbl VALUES('우대리', '이부장', '2222-2-1');
insert into emptbl VALUES('지사원', '이부장', '2222-2-2');
insert into emptbl VALUES('이영업', '나사장', '1111');
insert into emptbl VALUES('한과장', '이영업', '1111-1');
insert into emptbl VALUES('최정보', '나사장', '3333');
insert into emptbl VALUES('윤차장', '최정보', '3333-1');
insert into emptbl VALUES('이주임', '윤차장', '3333-1-1');

Select A.empName as '부하직원', B.empName as '직속상관', B.telNum as '직속상관연락처' #같은 테이블을 A와 B로 나누어 생각(A:부하테이블, B:상관테이블)
	FROM empTBL A Inner Join empTBL B ON A.managerName=B.empName #A와 B를 Inner Join(Self Join)하는데, A의 상관의 이름과 B의 이름이 같은 행을 반환
    Where A.empName='우대리'; #A의 이름이 '우대리'인 사람을 위에 반환된 테이블에서 찾아서 다시 반환.
    
#Union

Use sqlDB;
SELECT stdname, stdaddr From stdTBL
Union ALL
SELECT clubName, clubRoom From clubTBL; #stdTBL과 clubTBL을 합침.

SELECT name, CONCAT(mobile1, mobile2) as '전화번호' from userTBL
	Where name NOT IN (SELECT name From userTBL where mobile1 is NULL); #not in으로 userTBL에서 mobile1이 없는 행은 제외 

SELECT name, CONCAT(mobile1, mobile2) as '전화번호' from userTBL
	Where name IN (SELECT name From userTBL where mobile1 is NULL); #in으로 userTBL에서 mobile1이 없는 행만을 반환



