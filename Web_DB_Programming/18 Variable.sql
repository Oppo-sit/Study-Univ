use sqlDB;

##변수 선언 및 값 설정
set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 4.25;
Set @myVar4 = '가수 이름 ==>';
##변수 사용
select @myVar1;
select @myVar2 + @myVar3;
select @myVar4, Name From userTbl Where height > 180 limit 3;
##변수의 값 바꾸기와 사용
Set @myVar1=3;
prepare myquery from 'select name, height from userTBL 
	order by height limit ?';
execute myquery using @myVar1;
