create database quanlybanhang;
use quanlybanhang;
create table customer(
cID int,
primary key(cID),
cName varchar(20),
cAge int
);
create table Orderr(
oID int,
primary key(oID),
cID int,
oDate date,
oTotalPrice double,
foreign key (cID) references customer(cID)
);
create table product(
pID int,
primary key(pID),
pName varchar(20),
pPrice double
);
create table OrderDetail(
oID int,
pID int,
odQTY int,
foreign key (oID) references Orderr(oID),
foreign key (pID) references product(pID)
)
