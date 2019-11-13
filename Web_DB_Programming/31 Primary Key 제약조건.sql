use sqlDB;
DROP TABLE IF EXISTS buyTBL, userTBL;

#PK, FK 생성(알고 있는 부분)

CREATE TABLE userTBL
(
userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
addr CHAR(2) NOT NULL,
mobile1 CHAR(3) NULL,
mobile2 CHAR(8) NULL,
height SMALLINT NULL,
mDate DATE NULL
);

CREATE TABLE buyTBL
(
num INT NOT NULL,
userID CHAR(8) NOT NULL,
prodName CHAR(6) NOT NULL,
groupName CHAR(4) NULL,
price INT NOT NULL,
amount SMALLINT NOT NULL,
foreign key (userID) REFERENCES userTBL(userID));

describe userTBL;

#Alter Table을 이용해 PK 제약조건을 추가

Drop table if exists prodTBL;
Create table prodTBL
(prodCode char(3) not null, prodID char(4) not null,
prodDate DateTime Not null, RprodCur char(10) null);

alter table prodTBL
	ADD constraint PK_prodTBL_proCode_prodID
    primary key (prodCode, prodID);
    
select * from prodTBL;
describe prodTBL;

#Create Table 과정에서 PK 제약조건 부여

Drop table IF Exists prodTBL;
Create table prodTBL
(prodCode char(3) not null, prodID char(4) not null,
prodDate DateTime Not null, RprodCur char(10) null,
constraint PK_prodTBL_proCode_prodID Primary key(prodCode, prodID));

Show index from prodTBL;






