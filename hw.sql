  --創建庫名為iii
 create database iii;
 --使用iii資料庫
 use iii
 --創顧客資料表
 create table Customers (csId int primary key auto_increment,csName varchar(10),csTel varchar(10) unique,csEmail varchar(100),csAddress varchar(100));
 --創供應商資料表
 create table Suppliers(suId int primary key auto_increment,suName varchar(10),suTel varchar(10) unique,suAddress varchar(100));
 --創商品資料表
 create table Products(pdId int primary key auto_increment,pdNumber int unique,pdName varchar(10),pdFormat varchar(100),pdPrice int,suId int,foreign key(suId) references Suppliers(suId));
 --創訂單資料表
 create table Orders(oId int primary key auto_increment,oNumber int unique,csId int,foreign key(csId) references Customers(csId));
 --創訂單明細資料表
 create table OrderDetails(odId int primary key auto_increment,oNumber int,pdId int,odPrice int,Quantity int,foreign key(oNumber) references Orders(oNumber),foreign key(pdId) references Products(pdId));

--6.新增客戶 call addCustomers(客戶id,'姓名',電話,'email','地址')
\d #
create procedure addCustomers(a int,b varchar(10),c varchar(10),d varchar(100),e varchar(100))
begin
insert into Customers (csId,csName,csTel,csEmail,csAddress) values (a,b,c,d,e);
end #
\d ;

--6.刪除客戶 call delCustomers(客戶id)
\d #
create procedure delCustomers(in a int)
begin
set @key= a;
delete from Customers where csid= @key ;
end #ㄘ
\d ;

--6.查詢客戶: 電話, 姓名 => 關鍵字, 若無 => 全部 call csQuiry(電話或姓名)
\d #
create procedure csQuiry(in word varchar(10))
begin
set @key=concat("%",word,"%"); 
select csTel,csName from Customers where csName like @key;
select csTel,csName from Customers where csTel like @key;
end #
\d ;

--11. 綜合查詢: a. 指定客戶查詢訂單,含訂單明細 call odCsid(客戶id號碼)
\d #
create procedure odCsid(in word int)
begin
select a.oId,a.oNumber,a.csId,b.odId,b.pdId,b.odPrice,b.Quantity from Orders a join OrderDetails b on a.oNumber=b.oNumber where a.csId=word;
end #
\d ;




 