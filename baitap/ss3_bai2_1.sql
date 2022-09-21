create database ChuyenDoiERDSangQH;
use ChuyenDoiERDSangQH;
create table PhieuXuat(
soPX int,
primary key(soPX),
ngayXuat date
);
create table VatTu(
maVtu varchar(20),
primary key(maVtu),
tenVtu varchar(20)
);
create table PXVT(
DGXuat double,
Slxuat int,
soPX int,
maVtu varchar(20),
primary key(DGXuat,Slxuat),
foreign key(soPX) references PhieuXuat(soPX),
foreign key(maVtu) references VatTu(maVtu)
);
create table phieuNhap(
soPN int,
primary key(soPN),
ngayNhap date
);
create table PNVT(
DGNhap double,
SlNhap int,
soPN int,
maVtu varchar(20),
primary key(DGNhap,SlNhap),
foreign key(soPN) references phieuNhap(soPN),
foreign key(maVtu) references VatTu(maVtu)
);
create table DonDH(
maNCC varchar(20),
soDH int,
primary key(soDH),
ngayDH date,
foreign key(maNCC) references NhaCC(maNCC)
);
create table PNVT(
soDH_id int,
maVtu_id varchar(20),
primary key(soDH_id,maVtu_id),
foreign key(soDH_id) references DonDH(soDH),
foreign key(maVtu_id) references VatTu(maVtu)
);
creatcustomere table NhaCC(
maNCC varchar(20),
primary key(maNCC),
tenNCC varchar(50),
diachi varchar(100),
SDT int
);
create table DHVT(
soDH int,
maVtu varchar(20),
primary key(soDH,maVtu),
foreign key(soDH) references DonDH(soDH),
foreign key(maVtu) references VatTu(maVtu)
);
