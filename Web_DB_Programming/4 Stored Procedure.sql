delimiter // 
create procedure myProc()
begin 
	select * from membertbl where memberName = '당탕이';
	select * from producttbl where productName = '냉장고';
end //
delimiter ;

call myProc();
