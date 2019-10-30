##수학 함수

#abs : absolute(절대값)
select abs(-100);

#순서대로 올림 내림 반올림
select ceiling(4.7), floor(4.7), round(4.7);

#conv : 숫자를 원래 진수에서 변환할 진수로 계산(val, 원래 진수, 변환할 진수)
select conv('AA', 16, 2), conv(100, 10, 8);

#degrees ->파이단위를 각도로, radians -> 각도를 파이단위(라디안)으로
select degrees(pi()), radians(180);

#mod 나머지(val1, val2) = val1 % val2
select mod(157, 10), 157 % 10, 157 mod 10;

#pow(val1, val2) : val1의 val2제곱, sqrt(val) : val의 제곱근
select pow(2, 3), sqrt(9);

#sign(val) : val의 부호 계산, result는 1, 0, -1
select sign(100), sign(0), sign(-100.123);

#truncate(value, count) :소숫점을 count까지만 표현하고 다 지움
#count가 음수일 경우 정수의 값을 지운다.(cnt의 절대값만큼 정수가 0이 된다.)
select truncate(1234.12345, 2), truncate(12345.12345, -2)