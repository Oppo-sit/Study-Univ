##제어 흐름 함수를 사용하여 테이블의 값을 정한다.

Select if(100>200, '참이다', '거짓이다'); #삼중조건문 if(조건, T일 때 value, F일 때 value)

#ifnull(null or else, 결과값)
#만약 null일 경우 결과값이 나오고, null이 아닐 경우(else) else에 해당하는 값이 나온다.
select ifnull(null, '널이군요'), ifnull(100, '널이군요'); 
#nullif(value1, value2)
#value1=value2 -> null, value1!=value2 -> value2
select nullif(100, 100), ifnull(200, 100);

#분기문으로 입력값에 따라 출력값이 바뀐다.
Select case 5 #5라는 숫자에 대하여(입력값, 이 값에 따라 결과값이 바뀐다.)
		when 1 then '일'
		when 5 then '오'
        when 10 then '십'
        else '모름'
	end;
    


