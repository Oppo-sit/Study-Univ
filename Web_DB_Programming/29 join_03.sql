#Outer Join 실습

#1번
Select S.stdName, S.stdAddr, C.clubName, C.clubRoom
	From stdTBL S LEFT Outer Join stdclubtbl SC On S.stdName=SC.stdName #첫 번째 outer join에서 Left를 씀으로써 stdTBL의 모든 행을 반환
		LEFT Outer Join clubTBL C ON SC.clubName=C.clubName #두 번째 outer join에서 Left를 씀으로써 stdTBL의 모든 행을 반환하며 clubTBL의 열을 추가한다.
	Order by S.stdName; 
    
#2번
Select C.clubName, C.clubRoom, S.stdName, S.stdAddr
	From stdTBL S LEFT Outer Join stdclubtbl SC On S.stdName=SC.stdName #첫 번째 outer join에서 LEFT를 씀으로써 stdTBL의 모든 행을 반환
		RIGHT Outer Join clubTBL C ON SC.clubName=C.clubName #두 번째 outer join에서 Right를 씀으로써 clubTBL의 모든 행을 반환하여 stdTBL에 접합.
	Order by C.clubName;
    
#3번

Select S.stdName, S.stdAddr, C.clubName, C.clubRoom
	From stdTBL S LEFT Outer Join stdclubtbl SC On S.stdName=SC.stdName 
		LEFT Outer Join clubTBL C ON SC.clubName=C.clubName 
Union #1,2번을 후처리해서 Union하면 1, 2번에 반환된 결과가 합쳐진다.
Select C.clubName, C.clubRoom, S.stdName, S.stdAddr
	From stdTBL S RIGHT Outer Join stdclubtbl SC On S.stdName=SC.stdName
		RIGHT Outer Join clubTBL C ON SC.clubName=C.clubName
