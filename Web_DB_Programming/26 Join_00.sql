##Inner Join

use sqldb;

select * from buytbl 
	inner join usertbl
    on buytbl.userID = usertbl.userID
    where buytbl.userID='JYP';

#위의 inner join문을 통해 buytbl과 usertbl을 연결시킴.

select * from buyTBL;

select userID, name, prodName, addr, mobile1 + mobile2 as '연락처'
	from buyTBL inner join userTbl 
    on buytbl.userID=userTBL.userID; #이 문장을 실행하면 오류가 생기는데, userID열의 모호함 때문에 생긴다.

select buyTBL.userID, userTBL.name, buyTBL.productName, userTBL.addr, userTBL.addr, userTBL.mobile1 + userTBL.mobile2 as '연락처'
From buytbl inner join userTBL
	on buyTBL.userID=userTBL.userID; #join문을 실행할때는 열이 어디 테이블 소속인지 정확히 밝히는 것이 좋다.
    
select B.userID, U.name, B.productName, U.addr, U.mobile1 + U.mobile2 as '연락처'
from buytbl B #buytbl의 별칭을 'B', usertbl의 별칭을 'U'로 설정
	inner join usertbl U 
	On B.userID = B.userID
    Order by U.userID;
    
select distinct u.userID, U.name, U.addr
	from userTBL U inner join buyTBL B
    on U.userID = B.userID
    Order by U.userID; #Distinct로 중복 제거.alter
    
