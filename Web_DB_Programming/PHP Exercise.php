<?php
//변수 설정 및 출력
/* '<br>' 띄어쓰기는 echo에만 가능, 중첩 가능합니다.
	문자열에는 <BR>로 넣으면 띄어쓰기 가능합니다. */
//문자열 변수에서, 큰 따옴표와 작은 따옴표는 구분하지 않습니다.
//변수명은 $를 앞에 항상 붙여주어야 합니다.


	$a =100;
	print $a;


	$b="안녕하세요? MySQL";
	echo $b, '<br><br>'; 


//데이터 형식
	$a = 123; echo gettype($a), '<br>'; //int
	$a =123.123; echo gettype($a), '<br>'; //double
	$a = "MySQL"; echo gettype($a), '<br>'; //String
	$a = true; echo gettype($a), '<br>'; //Boolean
	$a = array(1, 2, 3); echo gettype($a), '<br><br>'; //Array

//문자열
	$str1 = "이것이 MySQL이다<BR>"; ECHO $str1; 
	$str2 = 'PHP 프로그래밍<BR>'; ECHO $str2;
	$str3 = "SELECT * FROM userTBL WHERE userID = 'JYP'<BR><BR>"; ECHO $str3;

//IF 함수
$a = 100;
$b = 200;

if($a > $b) {
	echo "a가 b보다 큽니다.<BR>";
}else{
	echo "a가 b보다 작습니다.<BR><BR>";
}

//IF ELSE 함수(SWITCH는 집에 가서)

	$score = 83;

		if($score >=90){
			echo "A학점";
		}elseif($score>=80) {
			echo "B학점";
		}elseif($score>=70) {
			echo "C학점";
		}elseif($score>=60) {
			echo "D학점";
		}else{
			echo "F학점";
		}
	
echo("<BR><BR>");


//FOR 함수
	for($i=1 ; $i<=10; $i=$i+1){
		echo $i; " ";
	}
	
echo("<BR>");
	
	$hap = 0;
	
	for($i=123;$i<456;$i=$i+2){
		$hap = $hap + $i;
	}
	echo "123부터 456까지의 홀수의 합계: ", $hap;

echo("<BR><BR>");
//WHILE 함수

$hap =0;

$i=123;
while ($i<=456){
		$hap = $hap + $i;
		$i = $i + 2;
}
echo "123부터 456까지의 홀수의 합계: ", $hap;





?>