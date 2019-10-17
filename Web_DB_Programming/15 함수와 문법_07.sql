use sqlDB;
create table testTBL1(id INT, userName CHAR(3), age INT);
select * from testTBL1;

insert into testTBL1 values(1, '홍길동', 25);
insert into testtbl1(id, username) values(2, '설현'); #insert 함수에서 넣어줄 column을 지정할 수 있다.(중간에 null인 부분에 null 쓸 필요 없음)
insert into testTBL1(username, age, id) values('조아', 26, 3); #순서 바꾸는 것도 가능

create table testtbl2(id INT auto_increment Primary key, userName char(3), age INT); #auto_increment : 자동으로 증가, PK 설정되어 있음
select * from testTBL2;
insert into testTBL2 values(null, '지연', 25);
insert into testTBL2 values(null, '유나', 22);
insert into testTBL2 values(null, '유경', 21);

select last_insert_id(); # 마지막에 입력된 행(id)이 몇 번째인지 알 수 있다. -> auto_increment으로 쓸 수 있는 기능

alter table testTBL2 auto_increment 100; #auto_increment의 시작점을 100으로 변경하였다.
insert into testTBL2 values(null, '찬미', 23); #'찬미'의 id = 100

create table testTBL3(Id int auto_increment primary key, Name char(2), Age int, Gender char(1), Address char(2));

set @@auto_increment_increment = 3; #auto_increment의 증가량 : 3
alter table testTBL3 auto_increment = 1000; #auto_increment의 초기값 : 1000

insert into testTBL3 values(null,'나연',20,'여','서울');
insert into testTBL3 values(null,'모모',19,'남','경기');
insert into testTBL3 values(null,'정연',21,'여','제주');
insert into testTBL3 values(null,'윤주',22,'여','대전');
select * from testTBL3;