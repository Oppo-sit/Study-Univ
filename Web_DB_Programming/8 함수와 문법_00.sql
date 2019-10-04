show databases; #모든 데이터베이스의 리스트를 불러온다.(복수형으로 적자)

use employees;

show tables; #선택(use)한 데베 안에 있는 테이블들의 리스트를 불러온다.

show table status; # 선택한 데베 안에 있는 테이블들의 정보를 보여준다.

describe employees; # 선택한 테이블의 정보를 보여준다.

select first_name, last_name, gender from employees; # 본 정보를 토대로 해당 테이블의 이름과 성을 불러옴.

