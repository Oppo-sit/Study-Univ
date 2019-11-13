use sqlDB;

select U.userID, U.name, B.productName, U.addr, CONCAT(U.mobile1, U.mobile2) as '연락처' # mobile1+mobile2=conca(mobile1, mobile2)
	from userTBL U LEFT Outer Join buyTBL B ON U.userID = B.userID
    Order by U.userID; #userTBL의 모든 row가 다 나온다.
    
select U.userID, U.name, B.productName, U.addr, CONCAT(U.mobile1, U.mobile2) as '연락처' # mobile1+mobile2=conca(mobile1, mobile2)
	from userTBL U RIGHT Outer Join buyTBL B ON U.userID = B.userID
    Order by U.userID; #buyTBL의 모든 row가 다 나온다.
    
select U.userID, U.name, B.productName, U.addr, CONCAT(U.mobile1, U.mobile2) as '연락처'
	from buyTBL B RIGHT Outer Join userTBL U ON U.userID=B.userID
    Where B.productName is Null
    Order by U.userID;