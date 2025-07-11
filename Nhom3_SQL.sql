
--1. T?O B?NG NHÂN VIÊN
Create table BenhNhan (
    MaBenhNhan varchar2(20) primary key not null,
    HoTen varchar2(60),
    NgaySinh date,
    GioiTinh varchar2(10),
    DanToc varchar2(30),
    DiaChi varchar2(50)
);
-- 2.T?o b?ng Khoa
Create table Khoa (
    MaKhoa varchar2(10) primary key not null,
    TenKhoa varchar2(100)
);
--3.T?o b?ng BenhLy
DROP TABLE BenhLy CASCADE CONSTRAINTS;
create table BenhLy (
    MaBenh varchar2(20) primary key not null,
    TenBenh varchar2(100)
);
-- 4.T?o b?ng c? s? y t?
DROP TABLE  CoSoYTe CASCADE CONSTRAINTS;
create table CoSoYTe (
    MaCSYT varchar2(20) primary key not null,
    TenCSYT varchar2(100)
);
-- 5.T?o b?ng thu?c 
DROP TABLE Thuoc CASCADE CONSTRAINTS;
create table Thuoc (
    MaThuoc varchar2(20) primary key not null,
    TenThuoc varchar2(100),
    NgayNhap date,
    HanSuDung date
);
--6. T?o b?ng d?ch v?
DROP TABLE  DichVu CASCADE CONSTRAINTS;
create table DichVu (
    MaDichVu varchar2(20) primary key not null,
    TenDichVu varchar2(100),
    DonGia number
);
-- 7.T?o b?ng Nhân viên y t?
DROP TABLE  NhanVienYTe  CASCADE CONSTRAINTS;
create table NhanVienYTe (
    MaNhanVien varchar2(20) primary key,
    HoTen varchar2(60),
    GioiTinh varchar2(10),
    DiaChi varchar2(50),
    ChucVu varchar2(50),
    MaKhoa varchar2(10),
    foreign key (MaKhoa) references Khoa(MaKhoa)
);
-- 8.T?o b?ng ??n thuoc

create table DonThuoc (
    MaDon varchar2(20) primary key not null,
    NgayKeDon date,
    MaNhanVien varchar2(20),
    MaBenhNhan varchar2(20),
    foreign key (MaNhanVien) references NhanVienYTe(MaNhanVien),
    foreign key (MaBenhNhan) references BenhNhan(MaBenhNhan)
);
-- 9.T?O B?NG PHÒNG B?NH

create table PhongBenh (
    SoPhong varchar2(20) primary key not null,
    DiaDiem varchar2(60),
    LoaiPhong varchar2(50),
    SoLuongGiuong number,
    MaKhoa varchar2(10),
    foreign key (MaKhoa) references Khoa(MaKhoa)
);
--10. T?O B?NG GI??NG B?NH

create table GiuongBenh (
    SoGiuong varchar2(20) primary key not null,
    TinhTrang varchar2(15),
    SoPhong varchar2(20),
    foreign key (SoPhong) references PhongBenh(SoPhong)
);
-- 11.T?O B?NG TH? B?O HI?M Y T?

create table TheBHYT (
    SoTheBHYT number primary key not null,
    NgayCap date,
    NgayHetHan date,
    MaBenhNhan varchar2(20),
    foreign key (MaBenhNhan) references BenhNhan(MaBenhNhan)
);
--12. T?O B?NG GI?Y NH?P VI?N

create table GiayNhapVien (
    MaNhapVien varchar2(20) primary key not null,
    NgayNhapVien date,
    MaNhanVien varchar2(20),
    MaBenhNhan varchar2(20),
    MaChuyenVien varchar2(20),
    MaBenh varchar2(20),
    MaKhoa varchar2(10),
    SoPhong varchar2(20),
    foreign key (MaNhanVien) references nhanvienyte(MaNhanVien),
    foreign key (MaBenhNhan) references benhnhan(MaBenhNhan),
    foreign key (MaBenh) references BenhLy(MaBenh),
    foreign key (MaKhoa) references Khoa(MaKhoa),
    foreign key (SoPhong) references PhongBenh(SoPhong)
);
-- 13. T?O B?NG PHI?U KHÁM

create table PhieuKham (
    SoPhieu varchar2(20) primary key not null,
    NgayKham date,
    KetLuan varchar2(500),
    HuongDieuTri varchar2(200),
    MaNhanVien varchar2(20),
    MaBenhNhan varchar2(20),
    foreign key (MaNhanVien) references NhanVienYTe(MaNhanVien),
    foreign key (MaBenhNhan) references BenhNhan(MaBenhNhan)
);
-- 14.T?O B?NG PHI?U D?CH V?

create table PhieuSuDungDichVu (
    SoPhieu varchar2(20) primary key not null,
    NgayXuatPhieu date,
    MaNhanVien varchar2(20),
    MaBenhNhan varchar2(20),
    foreign key (MaNhanVien) references NhanVienYTe(MaNhanVien),
    foreign key (MaBenhNhan) references BenhNhan(MaBenhNhan)
);
-- 15.T?O B?NG GI?Y CHUY?N VI?N

create table GiayChuyenVien (
    MaChuyenVien varchar2(20) primary key not null,
    HinhThucChuyen varchar2(100),
    LyDoChuyen varchar2(500),
    NgayChuyen date,
    MaNhanVien varchar2(20),
    MaBenhNhan varchar2(20),
    MaNhapVien varchar2(20),
    MaCSYT varchar2(20),
    foreign key (MaNhanVien) references NhanVienYTe(MaNhanVien),
    foreign key (MaBenhNhan) references BenhNhan(MaBenhNhan),
    foreign key (MaNhapVien) references GiayNhapVien(MaNhapVien),
    foreign key (MaCSYT) references CoSoYTe(MaCSYT)
);
--16. T?O B?NG GI?Y RA VI?N

create table GiayRaVien (
    SoGiay varchar2(20) primary key not null,
    PPDieuTri varchar2(500),
    KetQuaDieuTri varchar2(500),
    NgayRaVien date,
    MaNhanVien varchar2(20),
    MaBenhNhan varchar2(20),
    foreign key (MaNhanVien) references NhanVienYTe(MaNhanVien),
    foreign key (MaBenhNhan) references benhnhan(MaBenhNhan)
);
--17. T?O B?NG S? D?NG D?CH V?

create table SuDungDichVu (
    SoPhieu varchar2(20),
    MaDichVu varchar2(20),
    SoLan number,
    primary key (SoPhieu, MaDichVu),
    foreign key (SoPhieu) references PhieuSuDungDichVu(SoPhieu),
    foreign key (MaDichVu) references DichVu(MaDichVu)
);
--18. T?O B?NG S? D?NG THU?C

create table SuDungThuoc (
    MaDonThuoc varchar2(20),
    MaThuoc varchar2(20),
    CachDung varchar2(500),
    LieuLuong varchar2(100),
    primary key (MaDonThuoc, MaThuoc),
    foreign key (MaDonThuoc) references DonThuoc(MaDon),
    foreign key (MaThuoc) references Thuoc(MaThuoc)
);

-- INSERT D? LI?U
--Bang Khoa
insert into khoa (makhoa, tenkhoa) values ('K001', 'Khoa Noi tong quat');
insert into khoa (makhoa, tenkhoa) values ('K002', 'Khoa Ngoai tong quat');
insert into khoa (makhoa, tenkhoa) values ('K003', 'Khoa Nhi');
insert into khoa (makhoa, tenkhoa) values ('K004', 'Khoa San');
insert into khoa (makhoa, tenkhoa) values ('K005', 'Khoa Tim mach');
insert into khoa (makhoa, tenkhoa) values ('K006', 'Khoa Ho hap');
insert into khoa (makhoa, tenkhoa) values ('K007', 'Khoa Tieu hoa');
insert into khoa (makhoa, tenkhoa) values ('K008', 'Khoa Than kinh');
insert into khoa (makhoa, tenkhoa) values ('K009', 'Khoa Chan thuong chinh hinh');
insert into khoa (makhoa, tenkhoa) values ('K010', 'Khoa Mat');
insert into khoa (makhoa, tenkhoa) values ('K011', 'Khoa Tai mui hong');
insert into khoa (makhoa, tenkhoa) values ('K012', 'Khoa Rang ham mat');
insert into khoa (makhoa, tenkhoa) values ('K013', 'Khoa Da lieu');
insert into khoa (makhoa, tenkhoa) values ('K014', 'Khoa Ung buou');
insert into khoa (makhoa, tenkhoa) values ('K015', 'Khoa Hoi suc cap cuu');
insert into khoa (makhoa, tenkhoa) values ('K016', 'Khoa Than - Loc mau');
insert into khoa (makhoa, tenkhoa) values ('K017', 'Khoa Y hoc co truyen');

insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T001', 'Paracetamol 500mg', to_date('2024-01-10', 'YYYY-MM-DD'), to_date('2025-01-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T002', 'Ibuprofen 200mg', to_date('2024-02-15', 'YYYY-MM-DD'), to_date('2025-02-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T003', 'Amoxicillin 500mg', to_date('2024-03-20', 'YYYY-MM-DD'), to_date('2025-03-20', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T004', 'Aspirin 100mg', to_date('2024-04-05', 'YYYY-MM-DD'), to_date('2025-04-05', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T005', 'Ciprofloxacin 250mg', to_date('2024-05-10', 'YYYY-MM-DD'), to_date('2025-05-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T006', 'Metformin 500mg', to_date('2024-06-12', 'YYYY-MM-DD'), to_date('2025-06-12', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T007', 'Simvastatin 20mg', to_date('2024-07-18', 'YYYY-MM-DD'), to_date('2025-07-18', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T008', 'Omeprazole 20mg', to_date('2024-08-10', 'YYYY-MM-DD'), to_date('2025-08-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T009', 'Lisinopril 10mg', to_date('2024-09-22', 'YYYY-MM-DD'), to_date('2025-09-22', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T010', 'Hydrochlorothiazide 25mg', to_date('2024-10-10', 'YYYY-MM-DD'), to_date('2025-10-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T011', 'Atorvastatin 10mg', to_date('2024-11-05', 'YYYY-MM-DD'), to_date('2025-11-05', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T012', 'Amlodipine 5mg', to_date('2024-12-15', 'YYYY-MM-DD'), to_date('2025-12-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T013', 'Citalopram 20mg', to_date('2024-01-20', 'YYYY-MM-DD'), to_date('2025-01-20', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T014', 'Levothyroxine 50mcg', to_date('2024-02-25', 'YYYY-MM-DD'), to_date('2025-02-25', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T015', 'Fluoxetine 20mg', to_date('2024-03-10', 'YYYY-MM-DD'), to_date('2025-03-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T016', 'Cetirizine 10mg', to_date('2024-04-15', 'YYYY-MM-DD'), to_date('2025-04-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T017', 'Escitalopram 10mg', to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2025-05-20', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T018', 'Gabapentin 300mg', to_date('2024-06-05', 'YYYY-MM-DD'), to_date('2025-06-05', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T019', 'Losartan 50mg', to_date('2024-07-10', 'YYYY-MM-DD'), to_date('2025-07-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T020', 'Zolpidem 10mg', to_date('2024-08-15', 'YYYY-MM-DD'), to_date('2025-08-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T021', 'Prednisone 20mg', to_date('2024-09-25', 'YYYY-MM-DD'), to_date('2025-09-25', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T022', 'Allopurinol 100mg', to_date('2024-10-05', 'YYYY-MM-DD'), to_date('2025-10-05', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T023', 'Azithromycin 250mg', to_date('2024-11-10', 'YYYY-MM-DD'), to_date('2025-11-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T024', 'Meloxicam 15mg', to_date('2024-12-01', 'YYYY-MM-DD'), to_date('2025-12-01', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T025', 'Naproxen 250mg', to_date('2024-01-10', 'YYYY-MM-DD'), to_date('2025-01-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T026', 'Clonazepam 0.5mg', to_date('2024-02-15', 'YYYY-MM-DD'), to_date('2025-02-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T027', 'Metoprolol 50mg', to_date('2024-03-10', 'YYYY-MM-DD'), to_date('2025-03-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T028', 'Propranolol 40mg', to_date('2024-04-20', 'YYYY-MM-DD'), to_date('2025-04-20', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T029', 'Hydrocortisone 10mg', to_date('2024-05-15', 'YYYY-MM-DD'), to_date('2025-05-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T030', 'Furosemide 20mg', to_date('2024-06-01', 'YYYY-MM-DD'), to_date('2025-06-01', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T031', 'Doxycycline 100mg', to_date('2024-07-10', 'YYYY-MM-DD'), to_date('2025-07-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T032', 'Pantoprazole 40mg', to_date('2024-08-20', 'YYYY-MM-DD'), to_date('2025-08-20', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T033', 'Alprazolam 0.25mg', to_date('2024-09-15', 'YYYY-MM-DD'), to_date('2025-09-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T034', 'Venlafaxine 75mg', to_date('2024-10-01', 'YYYY-MM-DD'), to_date('2025-10-01', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T035', 'Clindamycin 300mg', to_date('2024-11-10', 'YYYY-MM-DD'), to_date('2025-11-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T036', 'Lorazepam 1mg', to_date('2024-12-05', 'YYYY-MM-DD'), to_date('2025-12-05', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T037', 'Spironolactone 25mg', to_date('2024-01-20', 'YYYY-MM-DD'), to_date('2025-01-20', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T038', 'Duloxetine 60mg', to_date('2024-02-25', 'YYYY-MM-DD'), to_date('2025-02-25', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T039', 'Cyclobenzaprine 10mg', to_date('2024-03-05', 'YYYY-MM-DD'), to_date('2025-03-05', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T040', 'Tamsulosin 0.4mg', to_date('2024-04-15', 'YYYY-MM-DD'), to_date('2025-04-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T041', 'Cefuroxime 500mg', to_date('2024-05-20', 'YYYY-MM-DD'), to_date('2025-05-20', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T042', 'Mirtazapine 30mg', to_date('2024-06-10', 'YYYY-MM-DD'), to_date('2025-06-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T043', 'Desloratadine 5mg', to_date('2024-07-15', 'YYYY-MM-DD'), to_date('2025-07-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T044', 'Dexamethasone 4mg', to_date('2024-08-01', 'YYYY-MM-DD'), to_date('2025-08-01', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T045', 'Carbamazepine 200mg', to_date('2024-09-10', 'YYYY-MM-DD'), to_date('2025-09-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T046', 'Topiramate 100mg', to_date('2024-10-15', 'YYYY-MM-DD'), to_date('2025-10-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T047', 'Montelukast 10mg', to_date('2024-11-01', 'YYYY-MM-DD'), to_date('2025-11-01', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T048', 'Oxcarbazepine 300mg', to_date('2024-12-10', 'YYYY-MM-DD'), to_date('2025-12-10', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T049', 'Lamotrigine 100mg', to_date('2024-01-15', 'YYYY-MM-DD'), to_date('2025-01-15', 'YYYY-MM-DD'));
insert into thuoc (mathuoc, tenthuoc, ngaynhap, hansudung) values ('T050', 'Varenicline 1mg', to_date('2024-02-01', 'YYYY-MM-DD'), to_date('2025-02-01', 'YYYY-MM-DD'));

--Bang DichVu
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV001', 'Kham Tong Quan', 500000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV002', 'Xet Nghiem Mau', 300000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV003', 'Chup X-Quang', 700000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV004', 'Noi Soi Da Day', 1500000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV005', 'Sieu Am Bung', 600000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV006', 'Sieu Am Tim', 800000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV007', 'Do Dien Tim', 400000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV008', 'Xet Nghiem Nuoc Tieu', 200000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV009', 'Kham Mat', 450000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV010', 'Kham Tai Mui Hong', 350000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV011', 'Chup CT-Scan', 2000000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV012', 'Xet Nghiem Duong Huyet', 250000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV013', 'Xet Nghiem Lipid Mau', 270000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV014', 'Kham Noi Tong Hop', 550000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV015', 'Dien Tim Gang Suc', 900000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV016', 'Xet Nghiem Chuc Nang Gan', 320000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV017', 'Kham Rang Ham Mat', 400000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV018', 'Chup MRI', 2500000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV019', 'Xet Nghiem HIV', 150000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV020', 'Xet Nghiem Canxi Mau', 220000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV021', 'Do Chuc Nang Ho Hap', 600000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV022', 'Noi Soi Dai Trang', 1700000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV023', 'Xet Nghiem Thai Ky', 200000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV024', 'Kham Tam Ly', 450000);
INSERT INTO DichVu (MaDichVu, TenDichVu, DonGia) VALUES ('DV025', 'Xet Nghiem Ure Mau', 240000);

--Bang CSYT
insert into cosoyte (macsyt, tencsyt) values ('CSYT001', 'Benh vien Bach Mai');
insert into cosoyte (macsyt, tencsyt) values ('CSYT002', 'Benh vien Nhi Trung uong');
insert into cosoyte (macsyt, tencsyt) values ('CSYT003', 'Benh vien Cho Ray');
insert into cosoyte (macsyt, tencsyt) values ('CSYT004', 'Benh vien Tu Du');
insert into cosoyte (macsyt, tencsyt) values ('CSYT005', 'Benh vien 108');
insert into cosoyte (macsyt, tencsyt) values ('CSYT006', 'Benh vien K');
insert into cosoyte (macsyt, tencsyt) values ('CSYT007', 'Benh vien Dai hoc Y Ha Noi');
insert into cosoyte (macsyt, tencsyt) values ('CSYT008', 'Benh vien E');
insert into cosoyte (macsyt, tencsyt) values ('CSYT009', 'Benh vien Huu nghi Viet Duc');
insert into cosoyte (macsyt, tencsyt) values ('CSYT010', 'Benh vien Phu san Trung uong');

--B?NG BENHNHAN
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000001', 'Tran Duc Anh', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Bac Kan');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000002', 'Tran Hoai Anh', TO_DATE('15/03/1992', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Phu Tho');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000003', 'Nguyen Ngan Ha', TO_DATE('20/07/1985', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Ha Noi');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000004', 'Ta Lam Hoan', TO_DATE('25/11/1994', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'TP Ho Chi Minh');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000005', 'Nguyen Vu Thien Hung', TO_DATE('30/12/1988', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Da Nang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000006', 'Nguyen Ngoc Anh Khoa', TO_DATE('05/09/1991', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Hai Phong');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000007', 'Dinh Thiet Lam', TO_DATE('18/06/1993', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Can Tho');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000008', 'Trinh Ngoc Linh', TO_DATE('12/04/1987', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Binh Duong');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000009', 'Nguyen Trung Nghia', TO_DATE('22/08/1990', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Vung Tau');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000010', 'Nguyen Hoai Nhu', TO_DATE('10/02/1992', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Dong Nai');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000011', 'Nguyen Le Quang', TO_DATE('15/05/1989', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Thua Thien Hue');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000012', 'Vu Minh Quan', TO_DATE('30/07/1995', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Quang Nam');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000013', 'Phan Anh Quyen', TO_DATE('11/11/1991', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Nghe An');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000014', 'Nguyen Minh Thao', TO_DATE('20/09/1993', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Quang Ninh');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000015', 'Nguyen Le Tran Tran', TO_DATE('25/12/1987', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Khanh Hoa');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000016', 'Dang Thi Thao Vi', TO_DATE('03/06/1992', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Bac Ninh');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000017', 'Nguyen Vu Hoang Vy', TO_DATE('15/10/1990', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Lam Dong');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000018', 'Le Thi Hang', TO_DATE('09/03/1994', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Long An');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000019', 'Nguyen Phuong Thao', TO_DATE('12/01/1991', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Thai Binh');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000020', 'Huynh Quang Tin', TO_DATE('19/04/1990', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Bac Giang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000021', 'Pham Huu Phuoc', TO_DATE('08/08/1988', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Ha Nam');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000022', 'Tran Thi Lan Anh', TO_DATE('25/05/1993', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Nam Dinh');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000023', 'Nguyen Phan Hoang Hai', TO_DATE('02/11/1989', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Thanh Hoa');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000024', 'Nguyen Suong Quynh', TO_DATE('14/09/1995', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Hung Yen');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000025', 'Cao Thi Thuy Tien', TO_DATE('28/06/1987', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Binh Phuoc');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000026', 'Huynh Thi Mai Chi', TO_DATE('12/07/1991', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Phu Yen');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000027', 'Tran Do Hong Duc', TO_DATE('18/01/1990', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Quang Tri');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000028', 'Pham Huy Hoang', TO_DATE('10/03/1992', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Binh Thuan');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000029', 'Tran Thi Huyen', TO_DATE('22/05/1988', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Kien Giang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000030', 'Nguyen Le Bao Khanh', TO_DATE('30/10/1990', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Soc Trang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000031', 'Nguyen Thi Thanh Ngan', TO_DATE('05/12/1993', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'An Giang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000032', 'Nguyen Kim Thanh', TO_DATE('17/04/1989', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Dong Thap');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000033', 'Do Thi Bich Ngoc', TO_DATE('21/02/1992', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Bac Lieu');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000034', 'Nguyen Thi Bich Diem', TO_DATE('06/06/1991', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Ha Tinh');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000035', 'Le Tan Dung', TO_DATE('20/11/1987', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Quang Binh');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000036', 'Tran Phan Trieu Vi', TO_DATE('01/09/1990', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Ninh Thuan');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000037', 'Tran Thi Nhu Y', TO_DATE('23/12/1995', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Quang Ngai');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000038', 'Do Hoang Van Anh', TO_DATE('14/03/1989', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Tien Giang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000039', 'Tran Cao Bao Chau', TO_DATE('19/07/1994', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Hau Giang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000040', 'Le Duc Gia Huy', TO_DATE('02/05/1992', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Gia Lai');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000041', 'Le Thi Thanh Ngan', TO_DATE('13/11/1988', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Kon Tum');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000042', 'Do Thi Lan Anh', TO_DATE('08/08/1993', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Ba Ria-Vung Tau');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000043', 'Nguyen Mai Nhat Anh', TO_DATE('24/06/1990', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Cao Bang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000044', 'Nguyen Minh Duc', TO_DATE('31/12/1991', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Lai Chau');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000045', 'Do Hoang Khanh Linh', TO_DATE('26/02/1989', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Son La');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000046', 'Nguyen Minh Nga My', TO_DATE('16/04/1994', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Dien Bien');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000047', 'Le Duc Nguyen', TO_DATE('11/07/1992', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Lang Son');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000048', 'Tran Ngoc Nhu', TO_DATE('05/10/1988', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Yen Bai');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000049', 'Ngo Bao Phuc', TO_DATE('30/03/1993', 'DD/MM/YYYY'), 'Nam', 'Kinh', 'Tuyen Quang');
INSERT INTO BenhNhan (MaBenhNhan, HoTen, NgaySinh, GioiTinh, DanToc, DiaChi) VALUES ('BN000050', 'Nguyen Ngoc Chau', TO_DATE('12/08/1995', 'DD/MM/YYYY'), 'Nu', 'Kinh', 'Ha Giang');
--Bang BenhLy
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL001', 'Ap xe');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL002', 'Azheimer');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL003', 'Beo Phi');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL004', 'Bong Gan');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL005', 'Benh Co Tim Gian');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL006', 'Benh Tang Tiet Mo Hoi');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL007', 'Benh Cuong Giap');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL008', 'Can Thi');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL009', 'Cam Lanh');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL010', 'Chan Thuong So Nao');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL011', 'Cum A');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL012', 'Coi Xuong');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL013', 'Di Ung Mat');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL014', 'Duc Thuy Tinh The');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL015', 'Dot Quy');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL016', 'Dai Thao Duong');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL017', 'Gan Nhiem Mo');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL018', 'Gian Day Chang');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL019', 'Gian Tinh Mach');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL020', 'Ho Van Tim');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL021', 'Ha Duong Huyet');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL022', 'Hoi Chung Cushing');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL023', 'Hoi Chung Kallnan');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL024', 'Hoi Chung Than Hu');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL025', 'Kho Mat');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL026', 'Kho Tho, Hut Hoi');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL027', 'Khan Tieng');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL028', 'Lac Noi Mac Tu Cung');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL029', 'Lao Thi');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL030', 'Liet Mat');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL031', 'Mau Nhiem Mo');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL032', 'Mat tri nho');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL033', 'Mat Ngu');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL034', 'Men Tieu Hoa');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL035', 'Nam Da');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL036', 'Nong Gan');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL037', 'Nhoi Mau Co Tim');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL038', 'Ong Phuc Tinh Mac');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL039', 'Oc Sua');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL040', 'Parkinson');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL041', 'Polip truc trang');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL042', 'Polip day thanh quan');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL043', 'Quai Bi');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL044', 'Qua Kich Buong Trung');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL045', 'Rang Khon Moc Lech');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL046', 'Roi Loan Lo Au');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL047', 'Roi Loan Noi Tiet');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL048', 'Suy Tim');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL049', 'Yeu Sinh Ly');
INSERT INTO BenhLy (MaBenh, TenBenh) VALUES ('BL050', 'Zona');

--Them NVYT
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV001', 'Nguyen Van An', 'Nam', 'Ha Noi', 'Bac Si', 'K001');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV002', 'Le Thi Binh', 'Nu', 'Hai Phong', 'Y Ta', 'K002');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV003', 'Tran Van Cuong', 'Nam', 'Da Nang', 'Bac Si', 'K003');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV004', 'Pham Thi Dao', 'Nu', 'TP. HCM', 'Y Ta', 'K004');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV005', 'Vu Van E', 'Nam', 'Nam Dinh', 'Ky Thuat Vien', 'K005');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV006', 'Nguyen Thi Hoa', 'Nu', 'Hue', 'Bac Si', 'K006');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV007', 'Le Van Khoi', 'Nam', 'Can Tho', 'Bac Si', 'K007');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV008', 'Pham Thi Lan', 'Nu', 'Dong Nai', 'Dieu Duong', 'K008');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV009', 'Nguyen Van Minh', 'Nam', 'Binh Duong', 'Ky Thuat Vien', 'K009');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV010', 'Tran Thi Mai', 'Nu', 'Quang Ninh', 'Bac Si', 'K010');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV011', 'Le Thanh Tam', 'Nam', 'Thanh Hoa', 'Y Ta', 'K011');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV012', 'Tran Thi Dao', 'Nu', 'Ha Noi', 'Bac Si', 'K012');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV013', 'Nguyen Thi Hong', 'Nu', 'Hai Phong', 'Dieu Duong', 'K013');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV014', 'Pham Van Hung', 'Nam', 'Da Nang', 'Ky Thuat Vien', 'K014');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV015', 'Tran Van Quan', 'Nam', 'TP. HCM', 'Bac Si', 'K015');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV016', 'Nguyen Thi Lan', 'Nu', 'Hue', 'Y Ta', 'K016');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV017', 'Le Van Kien', 'Nam', 'Can Tho', 'Bac Si', 'K017');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV018', 'Pham Van Binh', 'Nam', 'Dong Thap', 'Y Ta', 'K001');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV019', 'Le Thi Ngoc', 'Nu', 'Bac Ninh', 'Dieu Duong', 'K002');
INSERT INTO NhanVienYTe (MaNhanVien, HoTen, GioiTinh, DiaChi, ChucVu, MaKhoa) VALUES ('NV020', 'Nguyen Van Dat', 'Nam', 'Binh Dinh', 'Ky Thuat Vien', 'K003');

--Them PhongBenh
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P101', 'Toa A Tang 1', 'Phong Thuong', 4, 'K001');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P102', 'Toa A Tang 1', 'Phong Thuong', 3, 'K002');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P201', 'Toa B Tang 2', 'Phong Cap Cuu', 2, 'K003');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P202', 'Toa B Tang 2', 'Phong Cap Cuu', 2, 'K004');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P301', 'Toa C Tang 3', 'Phong Hoi Suc', 1, 'K005');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P302', 'Toa C Tang 3', 'Phong Hoi Suc', 1, 'K006');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P401', 'Toa D Tang 4', 'Phong Dieu Tri', 4, 'K007');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P402', 'Toa D Tang 4', 'Phong Dieu Tri', 3, 'K008');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P501', 'Toa E Tang 5', 'Phong Tich Cuc', 2, 'K009');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P502', 'Toa E Tang 5', 'Phong Tich Cuc', 2, 'K010');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P601', 'Toa F Tang 6', 'Phong Hoi Suc', 4, 'K011');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P602', 'Toa F Tang 6', 'Phong Dieu Tri', 3, 'K012');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P701', 'Toa G Tang 7', 'Phong Cap Cuu', 2, 'K013');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P702', 'Toa G Tang 7', 'Phong Cap Cuu', 2, 'K014');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P801', 'Toa H Tang 8', 'Phong Tich Cuc', 1, 'K015');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P802', 'Toa H Tang 8', 'Phong Tich Cuc', 1, 'K016');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P901', 'Toa I Tang 9', 'Phong Dieu Tri', 4, 'K017');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P902', 'Toa I Tang 9', 'Phong Dieu Tri', 3, 'K001');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P1001', 'Toa J Tang 10', 'Phong Thuong', 2, 'K002');
INSERT INTO PhongBenh (SoPhong, DiaDiem, LoaiPhong, SoLuongGiuong, MaKhoa) VALUES ('P1002', 'Toa J Tang 10', 'Phong Thuong', 2, 'K003');

--Them GiuongBenh
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G1011', 'Trong', 'P101');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G1012', 'Co Nguoi', 'P101');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G1013', 'Trong', 'P101');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G1014', 'Co Nguoi', 'P101');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G1021', 'Trong', 'P102');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G1022', 'Co Nguoi', 'P102');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G1023', 'Trong', 'P102');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G2011', 'Co Nguoi', 'P201');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G2012', 'Trong', 'P201');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G2021', 'Trong', 'P202');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G2022', 'Co Nguoi', 'P202');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G3011', 'Trong', 'P301');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G3021', 'Co Nguoi', 'P302');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G4011', 'Trong', 'P401');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G4012', 'Trong', 'P401');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G4013', 'Co Nguoi', 'P401');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G4014', 'Trong', 'P401');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G4021', 'Co Nguoi', 'P402');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G4022', 'Trong', 'P402');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G5011', 'Trong', 'P501');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G5012', 'Co Nguoi', 'P501');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G5021', 'Trong', 'P502');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G5022', 'Co Nguoi', 'P502');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G6011', 'Trong', 'P601');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G6012', 'Co Nguoi', 'P601');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G6013', 'Trong', 'P601');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G6014', 'Co Nguoi', 'P601');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G6021', 'Trong', 'P602');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G6022', 'Trong', 'P602');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G6023', 'Co Nguoi', 'P602');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G7011', 'Co Nguoi', 'P701');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G7012', 'Trong', 'P701');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G7021', 'Trong', 'P702');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G7022', 'Co Nguoi', 'P702');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G8011', 'Trong', 'P801');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G8021', 'Co Nguoi', 'P802');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G9011', 'Trong', 'P901');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G9012', 'Co Nguoi', 'P901');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G9013', 'Trong', 'P901');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G9014', 'Co Nguoi', 'P901');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G9021', 'Trong', 'P902');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G9022', 'Co Nguoi', 'P902');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G10011', 'Trong', 'P1001');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G10012', 'Co Nguoi', 'P1001');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G10021', 'Trong', 'P1002');
INSERT INTO GiuongBenh (SoGiuong, TinhTrang, SoPhong) VALUES ('G10022', 'Co Nguoi', 'P1002');

--Them TheBHYT
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100001, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'BN000001');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100002, TO_DATE('2022-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'BN000002');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100003, TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), 'BN000003');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100004, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'BN000004');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100005, TO_DATE('2022-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), 'BN000005');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100006, TO_DATE('2023-04-25', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'BN000006');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100007, TO_DATE('2021-05-30', 'YYYY-MM-DD'), TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'BN000007');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100008, TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'BN000008');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100009, TO_DATE('2023-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'BN000009');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100010, TO_DATE('2022-07-05', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 'BN000010');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100011, TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'BN000011');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100012, TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'BN000012');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100013, TO_DATE('2022-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), 'BN000013');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100014, TO_DATE('2022-04-25', 'YYYY-MM-DD'), TO_DATE('2023-04-25', 'YYYY-MM-DD'), 'BN000014');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100015, TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-01', 'YYYY-MM-DD'), 'BN000015');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100016, TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'BN000016');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100017, TO_DATE('2022-11-05', 'YYYY-MM-DD'), TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'BN000017');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100018, TO_DATE('2021-06-20', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), 'BN000018');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100019, TO_DATE('2022-09-30', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 'BN000019');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100020, TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'BN000020');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100021, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'BN000021');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100022, TO_DATE('2021-12-15', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'BN000022');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100023, TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'BN000023');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100024, TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'BN000024');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100025, TO_DATE('2022-01-20', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'BN000025');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100026, TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'BN000026');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100027, TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2023-04-10', 'YYYY-MM-DD'), 'BN000027');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100028, TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'), 'BN000028');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100029, TO_DATE('2021-11-15', 'YYYY-MM-DD'), TO_DATE('2023-11-15', 'YYYY-MM-DD'), 'BN000029');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100030, TO_DATE('2022-07-25', 'YYYY-MM-DD'), TO_DATE('2023-07-25', 'YYYY-MM-DD'), 'BN000030');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100031, TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'BN000031');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100032, TO_DATE('2022-02-18', 'YYYY-MM-DD'), TO_DATE('2023-02-18', 'YYYY-MM-DD'), 'BN000032');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100033, TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'BN000033');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100034, TO_DATE('2022-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'BN000034');
INSERT INTO TheBHYT (SoTheBHYT, NgayCap, NgayHetHan, MaBenhNhan) VALUES (100035, TO_DATE('2023-06-30', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), 'BN000035');

--Them PhieuKham
INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK001', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Dau bung', 'Thuoc an, giam dau bung', 'NV001', 'BN000001');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK002', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'Ho, cam', 'Thuoc long ho, nghi ng?i', 'NV003', 'BN000002');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK003', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'Chuyen hoa', 'Thuoc chuyen hoa, nghi ngoi', 'NV006', 'BN000003');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK004', TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'Dau dau', 'Thuoc giam dau, chong di ung', 'NV007', 'BN000004');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK005', TO_DATE('2024-04-02', 'YYYY-MM-DD'), 'Da day', 'Thuoc loet da day, che do an', 'NV010', 'BN000005');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK006', TO_DATE('2024-04-08', 'YYYY-MM-DD'), 'Viem xoang', 'Thuoc khang sinh, nghi ngoi', 'NV012', 'BN000006');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK007', TO_DATE('2024-04-13', 'YYYY-MM-DD'), 'Dau nguc', 'Thuoc giam dau, nghi ngoi', 'NV015', 'BN000007');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK008', TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'Huyet ap cao', 'Thuoc ha huyet ap, che do an', 'NV017', 'BN000008');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK009', TO_DATE('2024-04-22', 'YYYY-MM-DD'), 'Viem gan', 'Thuoc gan, nghi ngoi', 'NV001', 'BN000009');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK010', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Loet da day', 'Thuoc loet da day, che do an uong hop ly', 'NV003', 'BN000010');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK011', TO_DATE('2024-05-03', 'YYYY-MM-DD'), 'Dau dau', 'Thuoc giam dau, giam stress', 'NV006', 'BN000011');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK012', TO_DATE('2024-05-06', 'YYYY-MM-DD'), 'Viem phoi', 'Thuoc khang sinh, nghi ngoi', 'NV007', 'BN000012');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK013', TO_DATE('2024-05-12', 'YYYY-MM-DD'), 'Cam lanh', 'Thuoc ha sot, nghi ngoi', 'NV010', 'BN000013');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK014', TO_DATE('2024-05-17', 'YYYY-MM-DD'), 'Chan thuong', 'Chuom da, thuoc giam dau', 'NV012', 'BN000014');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK015', TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Di ung', 'Thuoc chong di ung, cham soc da', 'NV015', 'BN000015');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK016', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Chung dau dau', 'Thuoc giam dau, giam stress', 'NV017', 'BN000016');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK017', TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'Loet da day', 'Thuoc loet da day, che do an hop ly', 'NV001', 'BN000017');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK018', TO_DATE('2024-06-12', 'YYYY-MM-DD'), 'Tieu chay', 'Thuoc tieu chay, che do an hop ly', 'NV003', 'BN000018');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK019', TO_DATE('2024-06-18', 'YYYY-MM-DD'), 'Cam cum', 'Thuoc ha sot, nghi ngoi', 'NV006', 'BN000019');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK020', TO_DATE('2024-06-25', 'YYYY-MM-DD'), 'Viem hong', 'Thuoc khang sinh, nghi ngoi', 'NV007', 'BN000020');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK021', TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Dau bung', 'Thuoc giam dau, che do an hop ly', 'NV010', 'BN000021');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK022', TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Roi loan tieu hoa', 'Thuoc tieu hoa, che do an hop ly', 'NV012', 'BN000022');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK023', TO_DATE('2024-07-10', 'YYYY-MM-DD'), 'Viêm kh?p', 'Thuoc khang viem, nghi ngoi', 'NV015', 'BN000023');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK024', TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Dau lung', 'Thuoc giam dau, nghi ngoi', 'NV017', 'BN000024');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK025', TO_DATE('2024-07-20', 'YYYY-MM-DD'), 'Hen suyen', 'Thuoc hen, che do thoang khi', 'NV001', 'BN000025');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK026', TO_DATE('2024-07-25', 'YYYY-MM-DD'), 'Viem gan', 'Thuoc gan, che do an hop ly', 'NV003', 'BN000026');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK027', TO_DATE('2024-08-01', 'YYYY-MM-DD'), 'Da lieu', 'Thuoc bo sung, cham soc da', 'NV006', 'BN000027');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK028', TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Dau dau', 'Thuoc giam dau, nghi ngoi', 'NV007', 'BN000028');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK029', TO_DATE('2024-08-10', 'YYYY-MM-DD'), 'Viem tai', 'Thuoc tai, tranh moi truong on ao', 'NV010', 'BN000029');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK030', TO_DATE('2024-08-15', 'YYYY-MM-DD'), 'Tim mach', 'Thuoc tim mach, tranh stress', 'NV012', 'BN000030');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK031', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'Viem ruot', 'Thuoc ruot, nghi ngoi', 'NV015', 'BN000031');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK032', TO_DATE('2024-08-25', 'YYYY-MM-DD'), 'Dau mat', 'Thuoc mat, nghi ngoi', 'NV017', 'BN000032');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK033', TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Ho', 'Thuoc long dom, nghi ngoi', 'NV001', 'BN000033');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK034', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Cam cum', 'Thuoc giam dau, nghi ngoi', 'NV003', 'BN000034');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK035', TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'Viem phoi', 'Thuoc khang sinh, nghi ngoi', 'NV006', 'BN000035');

INSERT INTO PhieuKham (SoPhieu, NgayKham, KetLuan, HuongDieuTri, MaNhanVien, MaBenhNhan) 
VALUES ('PK036', TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'Roi loan lo au', 'Thuoc an than, giam stress', 'NV007', 'BN000036');

insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT001', to_date('2024-01-01', 'YYYY-MM-DD'), 'NV001', 'BN000001');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT002', to_date('2024-01-02', 'YYYY-MM-DD'), 'NV003', 'BN000002');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT003', to_date('2024-01-03', 'YYYY-MM-DD'), 'NV006', 'BN000003');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT004', to_date('2024-01-04', 'YYYY-MM-DD'), 'NV007', 'BN000004');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT005', to_date('2024-01-05', 'YYYY-MM-DD'), 'NV010', 'BN000005');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT006', to_date('2024-01-06', 'YYYY-MM-DD'), 'NV012', 'BN000006');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT007', to_date('2024-01-07', 'YYYY-MM-DD'), 'NV015', 'BN000007');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT008', to_date('2024-01-08', 'YYYY-MM-DD'), 'NV017', 'BN000008');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT009', to_date('2024-01-09', 'YYYY-MM-DD'), 'NV001', 'BN000009');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT010', to_date('2024-01-10', 'YYYY-MM-DD'), 'NV003', 'BN000010');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT011', to_date('2024-01-11', 'YYYY-MM-DD'), 'NV006', 'BN000011');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT012', to_date('2024-01-12', 'YYYY-MM-DD'), 'NV007', 'BN000012');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT013', to_date('2024-01-13', 'YYYY-MM-DD'), 'NV010', 'BN000013');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT014', to_date('2024-01-14', 'YYYY-MM-DD'), 'NV012', 'BN000014');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT015', to_date('2024-01-15', 'YYYY-MM-DD'), 'NV015', 'BN000015');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT016', to_date('2024-01-16', 'YYYY-MM-DD'), 'NV017', 'BN000016');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT017', to_date('2024-01-17', 'YYYY-MM-DD'), 'NV001', 'BN000017');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT018', to_date('2024-01-18', 'YYYY-MM-DD'), 'NV003', 'BN000018');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT019', to_date('2024-01-19', 'YYYY-MM-DD'), 'NV006', 'BN000019');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT020', to_date('2024-01-20', 'YYYY-MM-DD'), 'NV007', 'BN000020');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT021', to_date('2024-01-21', 'YYYY-MM-DD'), 'NV010', 'BN000021');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT022', to_date('2024-01-22', 'YYYY-MM-DD'), 'NV012', 'BN000022');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT023', to_date('2024-01-23', 'YYYY-MM-DD'), 'NV015', 'BN000023');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT024', to_date('2024-01-24', 'YYYY-MM-DD'), 'NV017', 'BN000024');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT025', to_date('2024-01-25', 'YYYY-MM-DD'), 'NV001', 'BN000025');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT026', to_date('2024-01-26', 'YYYY-MM-DD'), 'NV003', 'BN000026');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT027', to_date('2024-01-27', 'YYYY-MM-DD'), 'NV006', 'BN000027');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT028', to_date('2024-01-28', 'YYYY-MM-DD'), 'NV007', 'BN000028');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT029', to_date('2024-01-29', 'YYYY-MM-DD'), 'NV010', 'BN000029');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT030', to_date('2024-01-30', 'YYYY-MM-DD'), 'NV012', 'BN000030');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT031', to_date('2024-01-31', 'YYYY-MM-DD'), 'NV015', 'BN000031');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT032', to_date('2024-02-01', 'YYYY-MM-DD'), 'NV017', 'BN000032');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT033', to_date('2024-02-02', 'YYYY-MM-DD'), 'NV001', 'BN000033');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT034', to_date('2024-02-03', 'YYYY-MM-DD'), 'NV003', 'BN000034');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT035', to_date('2024-02-04', 'YYYY-MM-DD'), 'NV006', 'BN000035');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT036', to_date('2024-02-05', 'YYYY-MM-DD'), 'NV007', 'BN000036');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT037', to_date('2024-02-06', 'YYYY-MM-DD'), 'NV010', 'BN000037');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT038', to_date('2024-02-07', 'YYYY-MM-DD'), 'NV012', 'BN000038');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT039', to_date('2024-02-08', 'YYYY-MM-DD'), 'NV015', 'BN000039');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT040', to_date('2024-02-09', 'YYYY-MM-DD'), 'NV017', 'BN000040');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT041', to_date('2024-02-10', 'YYYY-MM-DD'), 'NV001', 'BN000041');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT042', to_date('2024-02-11', 'YYYY-MM-DD'), 'NV003', 'BN000042');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT043', to_date('2024-02-12', 'YYYY-MM-DD'), 'NV006', 'BN000043');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT044', to_date('2024-02-13', 'YYYY-MM-DD'), 'NV007', 'BN000044');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT045', to_date('2024-02-14', 'YYYY-MM-DD'), 'NV010', 'BN000045');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT046', to_date('2024-02-15', 'YYYY-MM-DD'), 'NV012', 'BN000046');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT047', to_date('2024-02-16', 'YYYY-MM-DD'), 'NV015', 'BN000047');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT048', to_date('2024-02-17', 'YYYY-MM-DD'), 'NV017', 'BN000048');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT049', to_date('2024-02-18', 'YYYY-MM-DD'), 'NV001', 'BN000049');
insert into donthuoc (madon, ngaykedon, manhanvien, mabenhnhan) values ('DT050', to_date('2024-02-19', 'YYYY-MM-DD'), 'NV003', 'BN000050');

-- Them SuDungThuoc
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT001', 'T001', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT002', 'T002', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT003', 'T003', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT004', 'T004', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT005', 'T005', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT006', 'T006', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT007', 'T007', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT008', 'T008', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT009', 'T009', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT010', 'T010', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT011', 'T011', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT012', 'T012', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT013', 'T013', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT014', 'T014', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT015', 'T015', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT016', 'T016', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT017', 'T017', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT018', 'T018', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT019', 'T019', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT020', 'T020', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT021', 'T021', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT022', 'T022', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT023', 'T023', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT024', 'T024', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT025', 'T025', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT026', 'T026', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT027', 'T027', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT028', 'T028', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT029', 'T029', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT030', 'T030', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT031', 'T031', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT032', 'T032', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT033', 'T033', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT034', 'T034', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT035', 'T035', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT036', 'T036', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT037', 'T037', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT038', 'T038', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT039', 'T039', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT040', 'T040', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT041', 'T041', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT042', 'T042', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT043', 'T043', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT044', 'T044', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT045', 'T045', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT046', 'T046', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT047', 'T047', 'Uong truoc khi ngu', '1 vien/lan, 1 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT048', 'T048', 'Uong voi nuoc am', '2 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT049', 'T049', 'Uong truoc bua an', '1 vien/lan, 2 lan/ngay');
insert into sudungthuoc (madonthuoc, mathuoc, cachdung, lieuluong) values ('DT050', 'T050', 'Uong sau bua an', '1 vien/lan, 3 lan/ngay');

--Them PhieuSuDungDichVu
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000001', to_date('2022-01-15', 'YYYY-MM-DD'), 'NV002', 'BN000026');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000002', to_date('2022-04-20', 'YYYY-MM-DD'), 'NV004', 'BN000027');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000003', to_date('2022-07-05', 'YYYY-MM-DD'), 'NV008', 'BN000028');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000004', to_date('2022-09-10', 'YYYY-MM-DD'), 'NV011', 'BN000029');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000005', to_date('2022-12-25', 'YYYY-MM-DD'), 'NV013', 'BN000030');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000006', to_date('2023-01-01', 'YYYY-MM-DD'), 'NV002', 'BN000001');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000007', to_date('2023-01-02', 'YYYY-MM-DD'), 'NV004', 'BN000002');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000008', to_date('2023-01-03', 'YYYY-MM-DD'), 'NV008', 'BN000003');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000009', to_date('2023-01-04', 'YYYY-MM-DD'), 'NV011', 'BN000004');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000010', to_date('2023-01-05', 'YYYY-MM-DD'), 'NV013', 'BN000005');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000011', to_date('2023-01-06', 'YYYY-MM-DD'), 'NV016', 'BN000006');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000012', to_date('2023-01-07', 'YYYY-MM-DD'), 'NV018', 'BN000007');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000013', to_date('2023-01-08', 'YYYY-MM-DD'), 'NV019', 'BN000008');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000014', to_date('2023-01-09', 'YYYY-MM-DD'), 'NV002', 'BN000009');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000015', to_date('2023-01-10', 'YYYY-MM-DD'), 'NV004', 'BN000010');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000016', to_date('2023-01-11', 'YYYY-MM-DD'), 'NV008', 'BN000011');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000017', to_date('2023-01-12', 'YYYY-MM-DD'), 'NV011', 'BN000012');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000018', to_date('2023-01-13', 'YYYY-MM-DD'), 'NV013', 'BN000013');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000019', to_date('2023-01-14', 'YYYY-MM-DD'), 'NV016', 'BN000014');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000020', to_date('2023-01-15', 'YYYY-MM-DD'), 'NV018', 'BN000015');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000021', to_date('2023-01-16', 'YYYY-MM-DD'), 'NV019', 'BN000016');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000022', to_date('2023-01-17', 'YYYY-MM-DD'), 'NV002', 'BN000017');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000023', to_date('2023-01-18', 'YYYY-MM-DD'), 'NV004', 'BN000018');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000024', to_date('2023-01-19', 'YYYY-MM-DD'), 'NV008', 'BN000019');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000025', to_date('2023-01-20', 'YYYY-MM-DD'), 'NV011', 'BN000020');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000026', to_date('2023-01-21', 'YYYY-MM-DD'), 'NV013', 'BN000021');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000027', to_date('2023-01-22', 'YYYY-MM-DD'), 'NV016', 'BN000022');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000028', to_date('2023-01-23', 'YYYY-MM-DD'), 'NV018', 'BN000023');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000029', to_date('2023-01-24', 'YYYY-MM-DD'), 'NV019', 'BN000024');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000030', to_date('2023-01-25', 'YYYY-MM-DD'), 'NV002', 'BN000025');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000031', to_date('2024-01-10', 'YYYY-MM-DD'), 'NV016', 'BN000031');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000032', to_date('2024-02-15', 'YYYY-MM-DD'), 'NV018', 'BN000032');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000033', to_date('2024-03-20', 'YYYY-MM-DD'), 'NV019', 'BN000033');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000034', to_date('2024-05-25', 'YYYY-MM-DD'), 'NV002', 'BN000034');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000035', to_date('2024-08-10', 'YYYY-MM-DD'), 'NV004', 'BN000035');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000036', to_date('2024-10-15', 'YYYY-MM-DD'), 'NV008', 'BN000036');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000037', to_date('2024-12-20', 'YYYY-MM-DD'), 'NV011', 'BN000037');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000038', to_date('2025-03-05', 'YYYY-MM-DD'), 'NV013', 'BN000038');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000039', to_date('2025-05-10', 'YYYY-MM-DD'), 'NV016', 'BN000039');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000040', to_date('2025-07-15', 'YYYY-MM-DD'), 'NV018', 'BN000040');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000041', to_date('2025-09-20', 'YYYY-MM-DD'), 'NV019', 'BN000041');
insert into phieusudungdichvu (sophieu, ngayxuatphieu, manhanvien, mabenhnhan) values ('SP000042', to_date('2025-12-10', 'YYYY-MM-DD'), 'NV002', 'BN000042');

--Them SuDungDV
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000001', 'DV001', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000001', 'DV002', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000002', 'DV003', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000002', 'DV004', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000003', 'DV005', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000003', 'DV006', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000004', 'DV007', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000004', 'DV008', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000005', 'DV009', 2);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000005', 'DV010', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000006', 'DV011', 2);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000006', 'DV012', 2);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000007', 'DV013', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000007', 'DV014', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000008', 'DV015', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000008', 'DV016', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000009', 'DV017', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000009', 'DV018', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000010', 'DV019', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000010', 'DV020', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000011', 'DV021', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000011', 'DV022', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000012', 'DV023', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000012', 'DV024', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000013', 'DV025', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000013', 'DV001', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000014', 'DV002', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000014', 'DV003', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000015', 'DV004', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000015', 'DV005', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000016', 'DV006', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000016', 'DV007', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000017', 'DV008', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000017', 'DV009', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000018', 'DV010', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000018', 'DV011', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000019', 'DV012', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000019', 'DV013', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000020', 'DV014', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000020', 'DV015', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000021', 'DV016', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000021', 'DV017', 2);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000022', 'DV018', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000022', 'DV019', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000023', 'DV020', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000023', 'DV021', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000024', 'DV022', 2);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000024', 'DV023', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000025', 'DV024', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000025', 'DV025', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000026', 'DV001', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000026', 'DV002', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000027', 'DV003', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000027', 'DV004', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000028', 'DV005', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000028', 'DV006', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000029', 'DV007', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000029', 'DV008', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000030', 'DV009', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000030', 'DV010', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000031', 'DV011', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000031', 'DV012', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000032', 'DV013', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000032', 'DV014', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000033', 'DV015', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000033', 'DV016', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000034', 'DV017', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000034', 'DV018', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000035', 'DV019', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000035', 'DV020', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000036', 'DV021', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000036', 'DV022', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000037', 'DV023', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000037', 'DV024', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000038', 'DV025', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000038', 'DV001', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000039', 'DV002', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000039', 'DV003', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000040', 'DV004', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000040', 'DV005', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000041', 'DV006', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000041', 'DV007', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000042', 'DV008', 1);
insert into SuDungDichVu (SoPhieu, MaDichVu, SoLan) values ('SP000042', 'DV009', 1);

--Them GiayNhapVien 
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0001', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'NV001', 'BN000001', NULL, 'BL001', 'K001', 'P101');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0002', TO_DATE('2024-01-12', 'YYYY-MM-DD'), 'NV002', 'BN000002', NULL, 'BL002', 'K002', 'P102');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0003', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'NV003', 'BN000003', NULL, 'BL003', 'K003', 'P201');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0004', TO_DATE('2024-03-18', 'YYYY-MM-DD'), 'NV004', 'BN000004', NULL, 'BL028', 'K004', 'P202');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0005', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'NV005', 'BN000005', NULL, 'BL037', 'K005', 'P301');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0006', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 'NV006', 'BN000006', NULL, 'BL026', 'K006', 'P302');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0007', TO_DATE('2024-06-25', 'YYYY-MM-DD'), 'NV007', 'BN000007', NULL, 'BL018', 'K007', 'P401');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0008', TO_DATE('2024-07-27', 'YYYY-MM-DD'), 'NV008', 'BN000008', NULL, 'BL023', 'K008', 'P402');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0009', TO_DATE('2024-08-30', 'YYYY-MM-DD'), 'NV009', 'BN000009', NULL, 'BL010', 'K009', 'P501');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0010', TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'NV010', 'BN000010', NULL, 'BL008', 'K010', 'P502');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0011', TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'NV011', 'BN000011', NULL, 'BL009', 'K011', 'P601');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0012', TO_DATE('2024-09-06', 'YYYY-MM-DD'), 'NV012', 'BN000012', NULL, 'BL045', 'K012', 'P602');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0013', TO_DATE('2024-09-09', 'YYYY-MM-DD'), 'NV013', 'BN000013', NULL, 'BL035', 'K013', 'P701');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0014', TO_DATE('2024-09-11', 'YYYY-MM-DD'), 'NV014', 'BN000014', NULL, 'BL014', 'K014', 'P702');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0015', TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'NV015', 'BN000015', NULL, 'BL015', 'K015', 'P801');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0016', TO_DATE('2024-09-18', 'YYYY-MM-DD'), 'NV016', 'BN000016', NULL, 'BL016', 'K016', 'P802');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0017', TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'NV017', 'BN000017', NULL, 'BL017', 'K017', 'P901');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0018', TO_DATE('2024-09-22', 'YYYY-MM-DD'), 'NV018', 'BN000018', NULL, 'BL001', 'K001', 'P902');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0019', TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'NV019', 'BN000019', NULL, 'BL002', 'K002', 'P1001');
INSERT INTO GiayNhapVien (MaNhapVien, NgayNhapVien, MaNhanVien, MaBenhNhan, MaChuyenVien, MaBenh, MaKhoa, SoPhong) VALUES
('MNV0020', TO_DATE('2024-09-28', 'YYYY-MM-DD'), 'NV020', 'BN000020', NULL, 'BL003', 'K003', 'P1002');

--Them GiayRaVien 
INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0001', 'Phau thuat loai bo khoi u', 'Khoi benh hoan toan', TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'NV001', 'BN000001');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0002', 'Dung thuoc khang sinh lieu cao', 'Thuyen giam', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'NV002', 'BN000002');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0003', 'Hoa tri', 'Tinh trang on dinh', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'NV003', 'BN000003');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0004', 'Cham cuu ket hop bam huyet', 'Khoi hoan toan', TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'NV004', 'BN000004');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0005', 'Vat ly tri lieu', 'Cai thien dang ke', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'NV005', 'BN000005');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0006', 'Phau thuat noi soi', 'Khoi benh', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'NV006', 'BN000006');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0007', 'Dieu tri noi khoa', 'Benh on dinh', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'NV007', 'BN000007');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0008', 'Phau thuat xuong khop', 'Hoi phuc tot', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'NV008', 'BN000008');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0009', 'Chieu xa', 'Benh thuyen giam', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'NV009', 'BN000009');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0010', 'Dieu tri bang thuoc', 'Khoi benh', TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'NV010', 'BN000010');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0011', 'Tiem phong ngua', 'Khoi hoan toan', TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'NV011', 'BN000011');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0012', 'Cham cuu ket hop thuoc', 'Tinh trang on dinh', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'NV012', 'BN000012');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0013', 'Xoa bop', 'Hoi phuc mot phan', TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'NV013', 'BN000013');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0014', 'Xet nghiem va theo doi', 'Hoi phuc nhanh', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'NV014', 'BN000014');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0015', 'Dieu tri tam ly', 'Tinh trang cai thien', TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'NV015', 'BN000015');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0016', 'Phau thuat lay soi', 'Khoi benh hoan toan', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'NV016', 'BN000016');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0017', 'Vat ly tri lieu ket hop cham cuu', 'Hoi phuc', TO_DATE('2024-04-25', 'YYYY-MM-DD'), 'NV017', 'BN000017');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0018', 'Phau thuat tim mach', 'Tinh trang on dinh', TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'NV018', 'BN000018');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0019', 'Uong thuoc chong viem', 'Thuyen giam', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'NV019', 'BN000019');

INSERT INTO GiayRaVien (SoGiay, PPDieuTri, KetQuaDieuTri, NgayRaVien, MaNhanVien, MaBenhNhan) 
VALUES ('MRV0020', 'Theo doi huyet ap', 'Tinh trang binh phuc', TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'NV020', 'BN000020');

--Them GiayChuyenVien
INSERT INTO GiayChuyenVien (MaChuyenVien, HinhThucChuyen, LyDoChuyen, NgayChuyen, MaNhanVien, MaBenhNhan, MaNhapVien, MaCSYT) 
VALUES ('MCV0001', 'Cung tuyen', 'Benh vien co dieu kien tot hon', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'NV005', 'BN000005', 'MNV0005', 'CSYT001');

INSERT INTO GiayChuyenVien (MaChuyenVien, HinhThucChuyen, LyDoChuyen, NgayChuyen, MaNhanVien, MaBenhNhan, MaNhapVien, MaCSYT) 
VALUES ('MCV0002', 'Tu tuyen duoi len tuyen tren', 'Dieu tri chuyen sau', TO_DATE('2024-08-30', 'YYYY-MM-DD'), 'NV009', 'BN000009', 'MNV0009', 'CSYT002');

INSERT INTO GiayChuyenVien (MaChuyenVien, HinhThucChuyen, LyDoChuyen, NgayChuyen, MaNhanVien, MaBenhNhan, MaNhapVien, MaCSYT) 
VALUES ('MCV0003', 'Cung tuyen', 'Chuyen sang khoa ngoai tong quat', TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'NV015', 'BN000015', 'MNV0015', 'CSYT001');

INSERT INTO GiayChuyenVien (MaChuyenVien, HinhThucChuyen, LyDoChuyen, NgayChuyen, MaNhanVien, MaBenhNhan, MaNhapVien, MaCSYT) 
VALUES ('MCV0004', 'Tu tuyen duoi len', 'Chuyen den benh vien tuyen tren', TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'NV017', 'BN000017', 'MNV0017', 'CSYT003');

INSERT INTO GiayChuyenVien (MaChuyenVien, HinhThucChuyen, LyDoChuyen, NgayChuyen, MaNhanVien, MaBenhNhan, MaNhapVien, MaCSYT) 
VALUES ('MCV0005', 'Tu tuyen duoi len', 'Can phau thuat khan cap', TO_DATE('2024-09-22', 'YYYY-MM-DD'), 'NV018', 'BN000018', 'MNV0018', 'CSYT002');

-- CAU 1: CHO BIET DANH SACH CAC BENH NHAN KHONG CO THE BAO HIEM Y TE.THONG TIN BAO GOM MA BENH NHAN VA HO TEN BENH NHAN
SELECT MaBenhNhan,HoTen
FROM BenhNhan
WHERE MaBenhNhan NOT IN (SELECT MaBenhNhan
                         FROM TheBHYT)
-- Câu 2 :Th?ng kê s? l??ng bác s? theo khoa 
SELECT k.Makhoa,TenKhoa, COUNT(MaNhanvien) AS SoLuong
FROM NhanVienYTe n JOIN Khoa k
ON n.MaKhoa=k.MaKhoa
GROUP BY k.Makhoa,TenKhoa
-- Câu3: Hien thi danh sach benh nhan chuyen vien tu ngay 1/4/2024 den 1/10/2024
SELECT bn.MaBenhNhan, Hoten, Ngaychuyen
FROM BenhNhan bn
JOIN Giaychuyenvien g
ON bn.MaBenhNhan = g.MaBenhNhan
WHERE Ngaychuyen BETWEEN TO_DATE('01/04/2024', 'dd/mm/yyyy') 
                     AND TO_DATE('01/10/2024', 'dd/mm/yyyy');
-- Câu 4: Thong ke cac thang co nhieu benh nhan kham nhat trong nam 2024
SELECT EXTRACT( MONTH FROM  NgayKham) AS Thang,COUNT(MaBenhNhan)  As SoLuong
FROM PhieuKham
WHERE EXTRACT(YEAR FROM NgayKham)=2024
GROUP BY EXTRACT( MONTH FROM  NgayKham)
HAVING COUNT(MaBenhNhan)= (SELECT MAX(SoLuong)
                           FROM (SELECT EXTRACT(MONTH FROM NgayKham),COUNT(MaBenhNhan)AS SoLuong
                                 FROM PhieuKham
                                 GROUP BY EXTRACT( MONTH FROM  NgayKham)
                                )
                            )
ORDER BY EXTRACT( MONTH FROM NgayKham)
                                 

-- CÂU 5: CHO BIET TONG SO GIUONG BENH CON TRONG MOI PHONG
SELECT pb.SoPhong,COUNT(SOGIUONG) as SoGiuongTrong
FROM PhongBenh pb join GIUONGBENH gb
ON pb.SoPhong=gb.SoPhong
WHERE TINHTRANG='Trong'
GROUP BY pb.SoPhong

-- CAU 6: DUA RA THONG BAO ( THE BAO HIEM CON HAN, TBH DA DEN NGAY HET HAN, THE BAO HIEM DA HET HAN) CHO MOI THE BAO HIEM TRONG BANG THEBHYT
SELECT bn.MaBenhNhan,HoTen,SotheBHYT,case 
                                  when ngayhethan<SysDate then 'The bao hiem da het han'
                                  when ngayhethan=SysDate then 'Da den ngay het han'
                                  else 'The bao hiem chua het han'
                                  end as "Thong bao"
FROM BenhNhan bn join TheBHYT t
ON bn.MaBenhNhan=t.MaBenhNhan;



-- CÂU 7: CHO BIET TONG TIEN DICH VU MA MOI BENH NHAN DA SU DUNG. THONG TIN HIEN THI BAO GOM MA BENH NHAN,HO TEN VA TONG CHI PHI
-- SAP XEP THEO COT TONG CHI PHI GIAM DAN 
SELECT bn.MaBenhNhan, bn.HoTen, SUM(Dongia*Solan) AS TongChiPhi
FROM BenhNhan bn JOIN PhieuSuDungDichVu psd
ON bn.MaBenhNhan = psd.MaBenhNhan
JOIN SuDungDichVu sddv ON psd.SoPhieu = sddv.SoPhieu
JOIN DichVu dv ON sddv.MaDichVu = dv.MaDichVu
GROUP BY bn.MaBenhNhan, bn.HoTen
ORDER BY TongChiPhi Desc;

-- Câu8: HIEN THI DANH SACH BENH NHAN SU DUNG DICH VU NHIEU NHAT 
SELECT bn.MaBenhNhan, bn.HoTen, SUM(SoLan)
FROM BenhNhan bn JOIN PhieuSuDungDichVu psd
ON bn.MaBenhNhan = psd.MaBenhNhan
JOIN SuDungDichVu sddv ON psd.SoPhieu = sddv.SoPhieu
GROUP BY  bn.MaBenhNhan, bn.HoTen
HAVING SUM (SoLan)=
                    (SELECT MAX(Tongso)
                     FROM (SELECT SUM(solan) AS  Tongso
                           FROM  sudungdichvu sddv join PhieuSuDungDichVu psd
                           ON sddv.Sophieu=psd.SoPhieu
                           GROUP BY  psd.MaBenhNhan
                           )
                    )
--Cau 9: Truy van benh nhan nam vien theo nhom tuoi 
SELECT   
    CASE   
        WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM B.NgaySinh) < 18 THEN 'Tre em'  
        WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM B.NgaySinh) BETWEEN 18 AND 65 THEN 'Nguoi lon'  
        ELSE 'Nguoi gia'  
    END AS NhomTuoi,  
    COUNT(B.MaBenhNhan) AS SoLuongBenhNhan  
FROM   
    BenhNhan B  
JOIN   
    GiayNhapVien GNV ON B.MaBenhNhan = GNV.MaBenhNhan  
GROUP BY   
    CASE   
        WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM B.NgaySinh) < 18 THEN 'Tre em'  
        WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM B.NgaySinh) BETWEEN 18 AND 65 THEN 'Nguoi lon'  
        ELSE 'Nguoi gia'  
    END;
--Cau 10: Thong ke tong tien dich vu theo cac thang trong nam 2024
SELECT EXTRACT(MONTH FROM NGAYXUATPHIEU) AS THANG,SUM(Dongia*Solan) AS TONGTIENDV
FROM PhieuSuDungDichVu p JOIN SuDungDichVu s
ON p.SoPhieu=s.SoPhieu
JOIN DichVu d ON s.MaDichVu=d.MaDichVu
WHERE  EXTRACT (YEAR FROM NGAYXUATPHIEU)=2024
GROUP BY EXTRACT(MONTH FROM NGAYXUATPHIEU)
ORDER BY EXTRACT(MONTH FROM NGAYXUATPHIEU)

-- Create roles
CREATE ROLE C##Admin;
CREATE ROLE C##BacSi;
CREATE ROLE C##YTa;
CREATE ROLE C##TiepTan;
CREATE ROLE C##KeToan;

-- Create users
CREATE USER c##quantri IDENTIFIED BY admin;
CREATE USER c##bbacsi IDENTIFIED BY bacsi;
CREATE USER c##yyta IDENTIFIED BY yta;
CREATE USER c##ttieptan IDENTIFIED BY tieptan;
CREATE USER c##kketoan IDENTIFIED BY ketoan;

-- Grant roles to users
GRANT C##Admin TO C##quantri;
GRANT C##BacSi TO C##bbacsi;
GRANT C##YTa TO C##yyta;
GRANT C##TiepTan TO C##ttieptan;
GRANT C##KeToan TO C##kketoan;

-- Quyên admin
GRANT ALL PRIVILEGES TO C##Admin;

-- quyen bac si
GRANT SELECT, INSERT, UPDATE ON BenhNhan TO C##BacSi;
GRANT SELECT, INSERT, UPDATE ON PhieuKham TO C##BacSi;
GRANT SELECT, INSERT, UPDATE ON DonThuoc TO C##BacSi;
GRANT SELECT, INSERT, UPDATE ON GiayNhapVien TO C##BacSi;
GRANT SELECT, INSERT, UPDATE ON GiayChuyenVien TO C##BacSi;
GRANT SELECT, INSERT, UPDATE ON GiayRaVien TO C##BacSi;
GRANT SELECT ON BenhLy TO C##BacSi;
GRANT SELECT ON Thuoc TO C##BacSi;

-- quyen y ta
GRANT SELECT, INSERT, UPDATE ON BenhNhan TO C##YTa;
GRANT SELECT, UPDATE ON GiayNhapVien TO C##YTa;
GRANT SELECT, UPDATE ON GiayRaVien TO C##YTa;
GRANT SELECT ON PhongBenh TO C##YTa;
GRANT SELECT ON GiuongBenh TO C##YTa;

-- Tiep Tan 
GRANT SELECT, INSERT, UPDATE ON BenhNhan TO C##TiepTan;
GRANT SELECT, INSERT ON TheBHYT TO C##TiepTan;
GRANT SELECT ON CoSoYTe TO C##TiepTan;

-- Ke Toan 
GRANT SELECT, INSERT, UPDATE ON DichVu TO C##KeToan;
GRANT SELECT, INSERT, UPDATE ON Thuoc TO C##KeToan;
GRANT SELECT, INSERT, UPDATE ON PhieuSuDungDichVu TO C##KeToan;
GRANT SELECT ON SuDungDichVu TO C##KeToan;

-- Only Admin can delete BenhNhan
GRANT DELETE ON BenhNhan TO C##Admin;

-- Only KeToan can delete DichVu
GRANT DELETE ON DichVu TO C##KeToan;

-- Only BacSi can update certain columns in PhieuKham
GRANT UPDATE (KetLuan, HuongDieuTri) ON PhieuKham TO C##BacSi;

-- Create profiles
CREATE PROFILE C##Admin_Profile LIMIT
  FAILED_LOGIN_ATTEMPTS 5
  PASSWORD_LIFE_TIME 90
  PASSWORD_REUSE_TIME 365
  PASSWORD_REUSE_MAX 5
  SESSIONS_PER_USER 3;

CREATE PROFILE C##BacSi_Profile LIMIT
  FAILED_LOGIN_ATTEMPTS 5
  PASSWORD_LIFE_TIME 90
  PASSWORD_REUSE_TIME 180
  PASSWORD_REUSE_MAX 5
  SESSIONS_PER_USER 2;

CREATE PROFILE C##YTa_Profile LIMIT
  FAILED_LOGIN_ATTEMPTS 5
  PASSWORD_LIFE_TIME 90
  PASSWORD_REUSE_TIME 180
  PASSWORD_REUSE_MAX 5
  SESSIONS_PER_USER 2;

CREATE PROFILE C##TiepTan_Profile LIMIT
  FAILED_LOGIN_ATTEMPTS 3
  PASSWORD_LIFE_TIME 90
  PASSWORD_REUSE_TIME 180
  PASSWORD_REUSE_MAX 5
  SESSIONS_PER_USER 1;

CREATE PROFILE C##KeToan_Profile LIMIT
  FAILED_LOGIN_ATTEMPTS 3
  PASSWORD_LIFE_TIME 60
  PASSWORD_REUSE_TIME 365
  PASSWORD_REUSE_MAX 3
  SESSIONS_PER_USER 1;


ALTER USER c##quantri PROFILE c##Admin_Profile;
ALTER USER C##bbacsi PROFILE c##BacSi_Profile;
ALTER USER C##yyta PROFILE c##YTa_Profile;
ALTER USER C##ttieptan PROFILE c##TiepTan_Profile;
ALTER USER C##kketoan PROFILE c##KeToan_Profile;


SELECT * FROM DBA_USERS;

SELECT USERNAME, ACCOUNT_STATUS, LOCK_DATE, EXPIRY_DATE 
FROM DBA_USERS;
select * from 