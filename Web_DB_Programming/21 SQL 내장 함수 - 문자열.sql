##문자열 함수

#Ascii 함수를 통해 문자의 Ascii #를 알 수 있다.
select ascii('A'), char(65);

#bit_lenght: 비트 수, char_length:문자의 개수, length:바이트 수
select bit_length('abc'), char_length('abc'), length('abc'); 
select bit_length('가나다'), char_length('가나다'), length('가나다'); #한글은 영어보다 bit가 3배 크다.

#elt(value, c1, c2, c3, ..) : value번째에 해당하는 문자를 반환
#field(c, c1, c2, c3, ..) : c와 같은 문자의 index를 반환 (없으면 0)
#find_in_set(c, str) : 문자열에서 c와 같은 문자의 index를 반환
#instr(str1, str2) : str1에서 str2와 같은 부분 문자열을 찾고 그 문자열의 첫 index를 반환
#locate(str2, str1) : instr과 같지만 파라미터가 반대
select elt(2, '하나', '둘', '셋'), field('둘', '하나', '둘', '셋'), find_in_set('둘', '하나,둘,셋'),
	instr('하나둘셋', '둘'), locate('둘', '하나둘셋');
    
#format(value, count) : 소숫점 자리를 count까지 표현, 뒤부분은 반올림하며 정수부분을 1000단위로 콤마 표시해준다.
select format(123456.123456,4); 

#2진법, 16진법, 8진법
select bin(31), hex(31), oct(31);

#insert(str1, cnt1, cnt2, str2) : str1에 cnt1부터 cnt2까지의 인덱스를 삭제하고 그 자리에 str2를 삽입
select insert('abcdefghi', 3, 4, '@@@@'), insert('abcdefghi', 3, 2, '@@@@');

#left, right는 문자열을 각각 왼쪽, 오른쪽부터 설정한 숫자만큼 반환
select left('abcdefghi', 3), right('abcdefghi', 3);

#lcase = lower : 대 -> 소, ucase = upper : 소 -> 대
select lcase('abcdEFGH'), Ucase('abcdEFGH');
select lower('abcdEFGH'), upper('abcdEFGH');

#lpad(str1, count, str2), rpad(구조 동일) : 문자열의 크기를 count만큼 바꾸고 각각 왼쪽, 오른쪽에 str2를 채운다.
#ltrim(str), rtrim(str) : 문자열의 왼쪽/오른쪽의 공백을 삭제
#trim(str) : 양 쪽 모두의 공백 삭제 
#trim(leading/both/trailing char from str) : 문자열에서 특정 문자를 삭제, 방향에 따라 leading(앞), both(전후), trailing(후)
select lpad('이것이', 5, '##'), rpad('이것이', 5, '##');
select ltrim('    이것이'), rtrim('이것이      ');
select trim('    이것이     '), trim(both 'ㅋ' from 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');

#repeat(str, count) : 문자열을 count만큼 반복
#replace(str1, substr, str2) : 문자열(str1)의 일부를 str2로 바꾼다.
#reverse(str) : 문자열을 역순으로 반환
#concat(str1, str2, str3, ...) : 문자열을 붙여서 반환
select repeat('이것이', 3);
select replace('이것이 MYSQL이다', '이것이', 'This is');
select reverse('MYSQL'); 
select concat('이것이', space(10), 'MySQL이다'); #space함수로 띄어쓰기 가능

#substring(str, value, count) : 문자열을 value번째부터 count개수만큼 출력
#substring_index(str, char, count) : 문자열에 char가 count번까지 나오면 후에 나머지는 버린다.
#count가 양수이면 왼쪽부터 세고, count가 음수이면 오른쪽부터 센다.
select substring('대한민국만세', 3, 2);
select substring_index('cafe.naver.com', '.', 2);