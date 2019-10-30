use sqlDB;

select avg(amount) as '평균 구매 개수' from buyTBL;

#cast/convert를 이용한 형 변환
#cast -> as, convert -> ,
select cast(avg(amount) as signed integer) as '평균 구매 개수' from buyTBL;
select convert(avg(amount), signed integer) as '평균 구매 개수' from buyTBL;

#날짜 사이의 구분자가 어떤 특수문자여도 상관 없다.
select cast('2020$12$12' as date);
select cast('2020/12/12' as date);
select cast('2020%12%12' as date);
select cast('2020@12@12' as date);

#price/amount를 문자형으로 변환, concat를 이용해서 문자를 이어붙인다. 
Select num, concat(cast(price as char(10)), 'x', cast(amount as char(4)), '=') as '단가X수량', 
	price*amount as '구매액' from buyTBL;

#SQL에서는 부등호를 해석할 때 숫자가 아닌 문자는 0으로 취급한다.
select '100'+'200';
select concat('100', '200');
select concat(100, '200');
select 1>'2mega'; #1>2
select 3>'2MEGA'; #3>2
select 0='mega2'; #0=0(mega)




