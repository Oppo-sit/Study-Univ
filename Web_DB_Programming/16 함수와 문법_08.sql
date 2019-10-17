use sqlDB;

select * from employees.employees;

create table testTBL4(id int, Fname varchar(50), Lname varchar(50)); #테이블 이식 1 (샘플 데이터 생성)
select * from testTBL4;
insert into testTBL4 select emp_no, first_name, last_name
	from employees.employees;
    
create table testTBL5(select emp_no, first_name, last_name # 테이블 이식 2 (샘플 데이터 생성)
	from employees.employees);
select * from testTBL5;