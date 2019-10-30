use shopdb;

select current_user, database();
use sqldb;
select*from userTBL;
select found_rows();

select * from buytbl;

update buytbl set price = price*2;
select row_count();

select sleep(5);
select '5초후에 이게 보여요';