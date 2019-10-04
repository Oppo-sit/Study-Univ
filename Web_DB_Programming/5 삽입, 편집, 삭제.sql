select * from membertbl;

insert into membertbl 
	VALUES('Figure', '김연아', '경기도');
    
update membertbl 
	SET memberAddress = '서울시 강남구' 
    where memberID = 'figure';
    
delete from membertbl where memberid = 'figure';