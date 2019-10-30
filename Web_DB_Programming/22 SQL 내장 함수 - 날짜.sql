#adddate/subdate는 날짜를 더해주거나 빼준다. interval 이후에 day, month, year의 용어로 원하는 일, 달, 년을 뺄 수 있다.
select adddate('2020-01-01', interval 31 day), adddate('2020-01-01', interval 1 month);
select subdate('2020-01-01', interval 31 day), subdate('2020-01-01', interval 1 month);

#addtime/subtime : 시간을 더하거나 빼준다.
select addtime('2020-01-01 23:59:59', '1:1:1'), addtime('15:00:00', '2:10:10');
select subtime('2020-01-01 23:59:59', '1:1:1'), subtime('15:00:00', '2:10:10');

#연도, 달, 일, 시간, 분, 초, 밀리초 반환
select year(curdate()), month(curdate()), dayofmonth(curdate());
select hour(curtime()), minute(curtime()), second(curtime()),
	microsecond(curtime());
#날짜와 시간을 반환
select date(Now()), time(Now()); #curdate() + curtime() = now()

#datediff(date1, date2) : 날짜의 차이를 일수로 반환.
#timediff(time1, time2) : 시간의 차이를 반환
#dayofweek : 주어진 날짜가 몇 번째 주인가 
#monthname : 주어진 날짜의 달의 이름은 
#dayofyear : 주어진 날짜의 연도는
#last_day : 주어진 날짜에서 달의 마지막 날
select datediff('2020-01-01', now()), timediff('23:23:59', '12:11:10');
select dayofweek(curdate()), monthname(curdate()), dayofyear(curdate());
select last_day('2020-01-01');

#makedate(year, val) :연도에서 val(일수)만큼 더하여 날짜를 반환
#make time(hour, min, sec) : 이어붙여서 시각을 반환 
#period_add:연월에서 뒤의 값만큼의 달이 지난 연월을 반환
#period_diff:연월1-연월2의 개월수를 구한다.
select makedate(2020, 32);
select maketime(12, 11, 10);
select period_add(202001, 11), period_diff(202001, 201812);

#quarter(date) : 해당날짜의 분기를 반환
#time_to_set(time):시간을 초단위로 변환하여 반
select quarter('2020-07-07');
select time_to_sec('12:11:10');


