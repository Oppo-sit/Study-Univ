use sqldb;
select userID as '사용자', sum(price*amount) as '총구매액'
	from buytbl where sum(price*amount)>1000 group by userID; # where 절로는 오류가 생긴다
select userID as '사용자', sum(price*amount) as '총구매액'
	from buytbl group by userID having sum(price*amount)>1000
		order by sum(price*amount) desc; # having을 사용하여 해결
        
select num, groupname, sum(price*amount) as '비용' from buytbl
	group by groupname, num with rollup; #group끼리 묶인 상태로 별개의 비용과 소계가 같이 나온다.
        
