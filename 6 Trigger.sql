create table deletedMemberTBL 
	(memberID char(8), memberName char(5), memberAddress char(20), deletedDate Date);
    
delimiter //
create trigger trg_deletedMemberTBL
after DELETE
ON memberTBL 
FOR EACH ROW 
begin
	INSERT into deletedmemberTBL 
		VALUES(OLD.memberID, OLD.memberName, OLD.memberAddress, curdate());
end //
delimiter ;

delete from mtrg_deletedMemberTBLtrg_deletedMemberTBLtrg_deletedMemberTBLembertbl where memberID = 'Sang';