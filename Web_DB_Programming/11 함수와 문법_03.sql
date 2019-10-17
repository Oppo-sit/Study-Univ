Use SqlDB;

select * from buytbl;
select * from usertbl;

select userID, amount from buytbl order by userID; #9번 Order By

select userID, SUM(amount) from buytbl group by userID; # groupBy와 sum을 통해 산 사람마다의 구매 수의 총량을 볼 수 있다.
select userID AS '사용자 아이디', SUM(amount) AS '구매 수량' 
	from buytbl group by userID; #보고자 하는 column의 이름을 AS를 통하여 바꿀 수 있다.
select userID as '사용자 아이디', SUM(price*amount) as '구매 금액'
	from buytbl group by userID; #10번 #구매 금액의 경우 단일 제품의 가격(price)에 구매 수량(amount)를 곱하여 더한다. 

select userID as '사용자 아이디', SUM(price*amount) as '구매 금액'
	from buytbl group by userID order by SUM(price*amount) DESC; # group by + order by => 축약 및 정돈 된 테이블을 볼 수 있음
    

