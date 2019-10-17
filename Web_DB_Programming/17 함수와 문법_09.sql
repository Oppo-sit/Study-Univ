select * from testTBL4;

update testTBL4 set lname = '없음' where Fname = 'kyoichi'; 
#update를 이용하여 First name이 kyoichi인 사람의 last name을 '없음'으로 바꾸어주었다.
#set '바꿀 대상과 결과' where '조건'

select * from testTBL4 where Fname = 'kyoichi';

update testTBL4 set Lname = '체크' where Fname = 'Mary'; #15번
select * from testtbl4 order by Fname; # 알바벳순으로 나온다
select * from testtbl4 WHERE Fname LIKE 'MAR%' order by Fname; #Fname이 MAR로 시작하는 사람들을 알파벳 순으로 보여준다

delete from testTBL4 where Fname ='aamer'; #Fname이 aamer인 사람들의 데이터 삭제

create table bigTBL1(select * from employees.employees);
create table bigTBL2(select * from employees.employees);
create table bigTBL3(select * from employees.employees);

delete from bigTBL1; #내부 데이터 삭제
drop table bigTBL2; #테이블을 삭제(데이터 + 구조)
truncate bigTBL3; #데이터 구조는 남김

Create table memberTBL(select userId, name, addr From userTBL LIMIT 3);
ALTER TABLE memberTBL ADD constraint pk_memberTBL primary key(userID); #USERID에 PK를 부여

select * from memberTBl;

insert ignore into memberTBL values('BBK', '비비코', '미국'); #ignore를 붙이면 PK가 겹쳐도 일단 실행(실제로는 반영되지 않는다.)
insert ignore into memberTBL values('SJH', '서장훈', '서울');
insert ignore into memberTBL values('HJY', '현주엽', '경기');
