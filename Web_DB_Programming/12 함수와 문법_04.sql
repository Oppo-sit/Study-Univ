Use SqlDB;
select * from usertbl;
select * from buytbl;

select avg(amount) as '평균 구매 개수' from buyTBL; #전체 구매 개수에 대한 평균
select userID as '사용자 아이디', avg(amount) as '평균 구매 개수' from buytbl group by userID order by avg(amount); #유저별 구매 개수에 대한 평균

select userID as '사용자 아이디', max(height) as '가장 큰 키', min(height) as '가장 작은 키' from usertbl group by userID; # 가장 키 큰 사람과 작은 사람 -> 잘못된 코드

select name, height from usertbl where height = (select max(height) from userTBL) 
	or height = (select min(height) from userTBL); # 서브쿼리를 이용하여 최단신과 최장신만을 고름, 근데 or 다음에 조건을 맞출 인자 적어줘야 한다(height =)


select userID, sum(price*amount) from buytbl 
	where sum(price*amount)=(select max(sum(price*amount)) from buyTBL group by userID)
	or sum(price*amount)=(select min(sum(price*amount)) from buyTBL group by userID)
    group by userID;