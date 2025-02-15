﻿CREATE DATABASE QLSVDEMO
CREATE TABLE THANHVIEN
(
	MSSV CHAR(10),
	HOTEN NVARCHAR(35),
	NGAYSINH DATETIME,
	VITRI NVARCHAR(55),
	EMAIL VARCHAR(100),
	PASS  VARCHAR(15),
	PRIMARY KEY (MSSV)
)
CREATE TABLE CONGVIEC
(
	MACV CHAR(10),
	TENCV NVARCHAR(25),
	TGBD  DATETIME,
	TGKT  DATETIME,
	TGTH  NVARCHAR(15),
	MADA  CHAR(10),
	STAWORK BIT, 
	PRIMARY KEY (MACV),
)
CREATE TABLE PHANCONG
(
	IDSTEAM CHAR(10),
	MSSV CHAR(10),
	MACV CHAR(10),
	PRIMARY KEY (IDSTEAM,MSSV,MACV)
)
CREATE TABLE DOAN
(
	MADA CHAR(10),
	TENDA NVARCHAR(55),
	NGAYNHAN DATETIME, 
	NGAYNOP  DATETIME,
	TGTH NVARCHAR(15),
	MAMH CHAR(10),
	TIENDO INT,
	PRIMARY KEY (MADA)
)
CREATE TABLE MONHOC
(
	MAMH CHAR(10),
	TENMH NVARCHAR(55),
	STC		INT,	
	TIENDO  INT,
	PRIMARY KEY (MAMH)
)
CREATE TABLE CTMH
(
	MSSV CHAR(10),
	MAMH CHAR(10),
	PRIMARY KEY (MSSV, MAMH),
)
CREATE TABLE SUBTEAM
(
	IDSTEAM CHAR(10),
	TENSTEAM NVARCHAR(55),
	SOLUONG INT,
	PRIMARY KEY (IDSTEAM)
)

ALTER TABLE PHANCONG
ADD CONSTRAINT L1
FOREIGN KEY (MSSV)
REFERENCES THANHVIEN(MSSV)

ALTER TABLE PHANCONG
ADD CONSTRAINT L2
FOREIGN KEY (MACV)
REFERENCES CONGVIEC(MACV)

ALTER TABLE CONGVIEC
ADD CONSTRAINT L3
FOREIGN KEY (MADA)
REFERENCES DOAN(MADA)

ALTER TABLE DOAN
ADD CONSTRAINT L4
FOREIGN KEY (MAMH)
REFERENCES MONHOC(MAMH)

ALTER TABLE CTMH
ADD CONSTRAINT L5
FOREIGN KEY (MAMH)
REFERENCES MONHOC(MAMH)

ALTER TABLE CTMH
ADD CONSTRAINT L6
FOREIGN KEY (MSSV)
REFERENCES THANHVIEN(MSSV)

ALTER TABLE PHANCONG
ADD CONSTRAINT L7
FOREIGN KEY (IDSTEAM)
REFERENCES SUBTEAM(IDSTEAM)

Insert THANHVIEN values ('3120410412','Nguyễn Thiên Phúc', '2002-03-02','Team Leader','Phucn0192@gmail.com','123456789' ),
						('3120410430','Đỗ Hoàng Quân', '2002-06-02','Coder','QuanDo0522@gmail.com','123456789' ),
						('3120410046','Đặng Chí Bảo', '2002-10-03','System Administrator','BaoDang12@gmail.com','123456789' ),
						('3120410030','Nguyễn Đức Anh', '2002-03-13','Coder','DucAnhNguyen@gmail.com','123456789' ),
						('3120410337','Trần Quốc Nam', '2002-07-05','Designer','NamQuoc515@gmail.com','123456789' ),
						('3120410327','Nhâm Chí Minh', '2002-08-01','Analyst','MinhChi33@gmail.com','123456789' )

Insert MONHOC values ('841048','Phân tích thiết kế HTTT',4,0)
					 
Insert DOAN values ('MOCHI','Nhà hàng Mochi','2022-03-02','2022-05-27','2 tháng 25 ngày','841048',0)

Insert SUBTEAM values ('STEAM1','Nhóm 1',4)

Insert CONGVIEC values ('PTHTTT','Phân tích HTTT','2022-03-03','2022-03-17','2 tuần','MOCHI',1),
						('TKHTTT','Thiết kế HTTT','2022-03-20','2022-04-20','1 tháng','MOCHI',1),
						('CDHTTT','Cài đặt HTTT','2022-04-23','2022-05-15','3 tuần 1 ngày','MOCHI',1),
						('KTHTTT','Kiểm Thử HTTT','2022-05-16','2022-05-26','1 tuần 3 ngày','MOCHI',0)

Insert CTMH values ('3120410412','841048'),
					('3120410430','841048'),
					('3120410046','841048'),
					('3120410030','841048')

Insert PHANCONG values ('STEAM1', '3120410412', 'PTHTTT'),
						('STEAM1', '3120410430', 'TKHTTT'),
						('STEAM1', '3120410030', 'CDHTTT'),
						('STEAM1', '3120410046', 'KTHTTT')

Select Count(MACV) from CONGVIEC where CONGVIEC.STAWORK=0