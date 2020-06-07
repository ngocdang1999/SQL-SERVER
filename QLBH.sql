Create Database QuanLyBanHang;
go
Use QuanLyBanHang
go

Create Table KHACHHANG(
	Makh varchar(5) NOT NULL PRIMARY KEY ,
	Tenkh Nvarchar(30) not null,
	Diachi Nvarchar(50),
	Dt varchar(11),
	Email varchar(30)); 
	
Create Table VATTU(
	Mavt varchar(5) NOT NULL PRIMARY KEY,
	Tenvt Nvarchar(30) not null,
	Dvt Nvarchar(20),
	Giamua float CHECK (GIAMUA > 0),
	Slton int CHECK (SLTON >= 0));
	
Create Table HOADON(
	Mahd varchar(10) NOT NULL PRIMARY KEY,
	Ngay smallDateTime,
	Makh varchar(5) FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
	Tongtg float CHECK (TONGTG >= 0));
	
	alter table hoadon add
		constraint CH check (ngay < getdate())
	
Create Table CHITIETHOADON(
	Mahd varchar(10) FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD),
	Mavt varchar(5) FOREIGN KEY (MAVT) REFERENCES VATTU(MAVT),
	Sl int CHECK (SL > 0),
	Khuyenmai float CHECK (KHUYENMAI >= 0),
	CONSTRAINT KC PRIMARY KEY (MAHD, MAVT),
	Giaban float CHECK (GIABAN > 0));
			
SET DATEFORMAT dmy;

Insert Into VATTU Values('VT01',N'Xi măng',N'Bao',50000,5000)
Insert Into VATTU Values('VT02',N'Cát',N'Khối',45000,50000)
Insert Into VATTU Values('VT03',N'Gạch ống',N'Viên',120,800000)
Insert Into VATTU Values('VT04',N'Gạch thẻ',N'Viên',110,800000)
Insert Into VATTU Values('VT05',N'Đá lớn',N'Khối',25000,100000)
Insert Into VATTU Values('VT06',N'Đá nhỏ',N'Khối',33000,100000)
Insert Into VATTU Values('VT07',N'Lam gió',N'Cái',15000,50000)
Insert Into VATTU Values('VT08',N'Sắt',N'Mét',2030,10230)
Insert Into VATTU Values('VT09',N'Gỗ Sàng',N'Khối',66763,75576)
	
Insert Into KHACHHANG Values('KH01',N'Nguyễn Thị Bé',N'Tân Bình','8457895','bnt@yahoo.com')
Insert Into KHACHHANG Values('KH02',N'Lê Hoàng Nam',N'Bình Chánh','9878987','namlehoang @abc.com.vn')
Insert Into KHACHHANG Values('KH03',N'Trần Thị Chiêu',N'Tân Bình','8457895',null)
Insert Into KHACHHANG Values('KH04',N'Mai Thị Quế Anh',N'Bình Chánh',null,null)
Insert Into KHACHHANG Values('KH05',N'Lê Văn Sang',N'Quận 10',null,'sanglv@hcm.vnn.vn')
Insert Into KHACHHANG Values('KH06',N'Trần Hoàng Khải',N'Tân Bình','8457897',null)

Insert Into HOADON Values('HD001','12/01/2016','KH01',null)
Insert Into HOADON Values('HD002','25/03/2016','KH02',null)
Insert Into HOADON Values('HD003','25/05/2016','KH01',null)
Insert Into HOADON Values('HD004','25/05/2016','KH04',null)
Insert Into HOADON Values('HD005','26/05/2016','KH04',null)
Insert Into HOADON Values('HD006','02/06/2016','KH03',null)
Insert Into HOADON Values('HD007','22/06/2016','KH04',null)
Insert Into HOADON Values('HD008','25/06/2016','KH03',null)
Insert Into HOADON Values('HD009','15/08/2016','KH04',null)
Insert Into HOADON Values('HD010','30/09/2016','KH01',null)

Insert Into CHITIETHOADON Values('HD001','VT01',5,null,52000)
Insert Into CHITIETHOADON Values('HD001','VT05',10,null,30000)
Insert Into CHITIETHOADON Values('HD002','VT03',10000,null,150)
Insert Into CHITIETHOADON Values('HD003','VT02',20,null,55000)
Insert Into CHITIETHOADON Values('HD004','VT03',50000,null,150)
Insert Into CHITIETHOADON Values('HD004','VT04',20000,null,120)
Insert Into CHITIETHOADON Values('HD005','VT05',10,null,30000)
Insert Into CHITIETHOADON Values('HD005','VT06',15,null,35000)
Insert Into CHITIETHOADON Values('HD005','VT07',20,null,17000)
Insert Into CHITIETHOADON Values('HD006','VT04',10000,null,120)
Insert Into CHITIETHOADON Values('HD007','VT04',20000,null,125)
Insert Into CHITIETHOADON Values('HD008','VT01',100,null,55000)
Insert Into CHITIETHOADON Values('HD008','VT02',20,null,47000)
Insert Into CHITIETHOADON Values('HD009','VT02',25,null,48000)
Insert Into CHITIETHOADON Values('HD010','VT01',25,null,57000)

--Cau 1
SELECT Makh, Tenkh, Diachi, Dt, Email
FROM KHACHHANG
WHERE Diachi = N'Tân Bình'

GO
create view kh_tanbinh ([Ma khach hang], [Ten khach hang], [Dia chi], [Dien thoai], [Email])
as
SELECT Makh, Tenkh, Diachi, Dt, Email
FROM KHACHHANG
WHERE Diachi = N'Tân Bình'

select *
from kh_tanbinh

--CAU 2
create view khachhang_chuacodt
as
SELECT Makh, Tenkh, Diachi, Email
FROM KHACHHANG
WHERE Dt IS NULL

select *
from khachhang_chuacodt

--CAU 3
SELECT MAKH, TENKH, DIACHI
FROM KHACHHANG
WHERE Dt IS NULL AND Email IS NULL

--CAU 4
SELECT *
FROM KHACHHANG
WHERE Dt IS NOT NULL AND Email IS NOT NULL

--CAU 5
SELECT Mavt, Tenvt, Giamua
FROM VATTU
WHERE Dvt = N'Cái'

--CAU 6
SELECT *
FROM VATTU
WHERE Giamua > 25000

--CAU 7
SELECT *
FROM VATTU
WHERE Tenvt LIKE N'Gạch%'

--CAU 8
SELECT *
FROM VATTU
WHERE Giamua > 20000 AND Giamua < 40000

--CAU 9
SELECT Mahd, Ngay, Tenkh, Diachi, Dt
FROM HOADON INNER JOIN KHACHHANG ON KHACHHANG.Makh = HOADON.Makh

-- CAU 10
SELECT Mahd, Ngay, Tenkh, Diachi, Dt
FROM HOADON INNER JOIN KHACHHANG ON KHACHHANG.Makh = HOADON.Makh
WHERE Ngay = '25/5/2016'

--CAU 11
SELECT Mahd, Ngay, Tenkh, Diachi,  Dt
FROM HOADON INNER JOIN KHACHHANG ON KHACHHANG.Makh = HOADON.Makh
WHERE CAST(MONTH(Ngay) as int) = 6 AND CAST(YEAR(ngay) as int) = 2016

--CAU 12
SELECT Tenkh, Diachi,  Dt
FROM HOADON INNER JOIN KHACHHANG ON KHACHHANG.Makh = HOADON.Makh
WHERE CAST(MONTH(Ngay) as int) = 6 AND CAST(YEAR(ngay) as int) = 2016

--CAU 13
SELECT Tenkh, Diachi, Dt
FROM KHACHHANG
WHERE Makh NOT IN
(SELECT hoadon.Makh
FROM HOADON INNER JOIN KHACHHANG ON KHACHHANG.Makh = HOADON.Makh
WHERE CAST(MONTH(Ngay) as int) = 6 AND CAST(YEAR(ngay) as int) = 2016
)

--CAU 14
SELECT Mahd, VATTU.Mavt, Tenvt, Dvt, Giaban, Giamua, Sl,
	TRIGIAMUA = Giamua * Sl, TRIGIABAN = Giaban * Sl
FROM CHITIETHOADON INNER JOIN VATTU 
	ON CHITIETHOADON.Mavt = VATTU.Mavt
	
--CAU 15
SELECT Mahd, VATTU.Mavt, Tenvt, Dvt, Giaban, Giamua, Sl,
	TRIGIAMUA = Giamua * Sl, TRIGIABAN = Giaban * Sl
FROM CHITIETHOADON INNER JOIN VATTU 
	ON CHITIETHOADON.Mavt = VATTU.Mavt
WHERE Giaban >= Giamua

--CAU 16
SELECT Mahd, VATTU.Mavt, Tenvt, Dvt, Giaban, Giamua, Sl,
	TRIGIAMUA = Giamua * Sl, TRIGIABAN = Giaban * Sl,
	(CASE WHEN Sl > 100 THEN Giaban * Sl /10 ELSE 0 END)
		AS KHUYENMAI
FROM CHITIETHOADON INNER JOIN VATTU 
	ON CHITIETHOADON.Mavt = VATTU.Mavt

--CAU 17
SELECT Mavt, Tenvt
FROM VATTU
WHERE Mavt NOT IN
(SELECT VATTU.Mavt
FROM VATTU INNER JOIN CHITIETHOADON 
	ON VATTU.Mavt = CHITIETHOADON.Mavt)

--CAU 18
SELECT HOADON.Mahd, Ngay, Tenkh, Diachi, Dt, Tenvt, Dvt,
	Giamua, Giaban, Sl,TRIGIAMUA = Giamua * Sl, 
	TRIGIABAN = Giaban * Sl
FROM HOADON INNER JOIN CHITIETHOADON 
	ON HOADON.Mahd = CHITIETHOADON.Mahd 
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
	INNER JOIN VATTU ON CHITIETHOADON.Mavt = VATTU.Mavt

--CAU 19
SELECT HOADON.Mahd, Ngay, Tenkh, Diachi, Dt, Tenvt, Dvt,
	Giamua, Giaban, Sl, TRIGIAMUA = Giamua * Sl, 
	TRIGIABAN = Giaban * Sl
FROM HOADON INNER JOIN CHITIETHOADON 
	ON HOADON.Mahd = CHITIETHOADON.Mahd 
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
	INNER JOIN VATTU ON CHITIETHOADON.Mavt = VATTU.Mavt
WHERE CAST(MONTH(Ngay) AS INT) = 5 
		AND CAST(YEAR(NGAY) AS INT) = 2016
		
--CAU 20
SELECT HOADON.Mahd, Ngay, Tenkh, Diachi, Dt, Tenvt, Dvt,
	Giamua, Giaban, Sl, TRIGIAMUA = Giamua * Sl, 
	TRIGIABAN = Giaban * Sl
FROM HOADON INNER JOIN CHITIETHOADON 
	ON HOADON.Mahd = CHITIETHOADON.Mahd 
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
	INNER JOIN VATTU ON CHITIETHOADON.Mavt = VATTU.Mavt
WHERE CAST(MONTH(Ngay) AS INT) < 4
		AND CAST(YEAR(NGAY) AS INT) = 2016

--CAU 21
SELECT HOADON.Mahd, Ngay, Tenkh, Diachi,
	TONGGIATRI = SUM(Giaban * Sl)
FROM CHITIETHOADON INNER JOIN HOADON 
	ON CHITIETHOADON.Mahd = HOADON.Mahd
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
GROUP BY HOADON.Mahd, Ngay, Tenkh, Diachi

--CAU 22
SELECT HOADON.Mahd, Ngay, Tenkh, Diachi,
	TONGGIATRI = SUM(Sl * Giaban)
FROM CHITIETHOADON INNER JOIN HOADON 
	ON CHITIETHOADON.Mahd = HOADON.Mahd
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
GROUP BY HOADON.Mahd, Ngay, Tenkh, Diachi
HAVING SUM(Sl * Giaban) = ((SELECT MAX(TONGGIATRI)
	FROM ( 
	(SELECT HOADON.Mahd, Ngay, Tenkh, Diachi,
	TONGGIATRI = SUM(Giaban * Sl)
FROM CHITIETHOADON INNER JOIN HOADON 
	ON CHITIETHOADON.Mahd = HOADON.Mahd
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
GROUP BY HOADON.Mahd, Ngay, Tenkh, Diachi)) AS TEMP))

--CAU 22
SELECT HOADON.Mahd, Ngay, Tenkh, Diachi,
	TONGGIATRI = SUM(Sl * Giaban)
FROM CHITIETHOADON INNER JOIN HOADON 
	ON CHITIETHOADON.Mahd = HOADON.Mahd
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
WHERE CAST(MONTH(NGAY) AS INT) = 5 AND
	CAST(YEAR(Ngay)AS INT) = 2016
GROUP BY HOADON.Mahd, Ngay, Tenkh, Diachi
HAVING SUM(Sl * Giaban) = ((SELECT MAX(TONGGIATRI)
	FROM ( 
	(SELECT HOADON.Mahd, Ngay, Tenkh, Diachi,
	TONGGIATRI = SUM(Giaban * Sl)
FROM CHITIETHOADON INNER JOIN HOADON 
	ON CHITIETHOADON.Mahd = HOADON.Mahd
	INNER JOIN KHACHHANG ON HOADON.Makh = KHACHHANG.Makh
WHERE CAST(MONTH(NGAY) AS INT) = 5 AND
	CAST(YEAR(Ngay)AS INT) = 2016
GROUP BY HOADON.Mahd, Ngay, Tenkh, Diachi)) AS TEMP))

--CAU 24
SELECT KHACHHANG.Makh, Tenkh, COUNT(Mahd) AS SOHD
FROM KHACHHANG INNER JOIN HOADON
	ON KHACHHANG.Makh = HOADON.Makh
GROUP BY KHACHHANG.Makh, Tenkh

--CAU 25
SELECT KHACHHANG.Makh, MONTH(Ngay) AS THANG, COUNT(Mahd) AS SOHD
FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.Makh = HOADON.Makh
GROUP BY KHACHHANG.Makh, MONTH(Ngay)
ORDER BY KHACHHANG.Makh

--CAU 26
SELECT KHACHHANG.Makh, Tenkh, COUNT(Mahd) AS SOHD
FROM KHACHHANG INNER JOIN HOADON
	ON KHACHHANG.Makh = HOADON.Makh
GROUP BY KHACHHANG.Makh, Tenkh
HAVING COUNT(Mahd) = (SELECT MAX(SOHD)
FROM (SELECT KHACHHANG.Makh, Tenkh, COUNT(Mahd) AS SOHD
FROM KHACHHANG INNER JOIN HOADON
	ON KHACHHANG.Makh = HOADON.Makh
GROUP BY KHACHHANG.Makh, Tenkh) AS TEMP)

--
SELECT KHACHHANG.Makh, Tenkh, COUNT(Mahd) AS SOHD
FROM KHACHHANG INNER JOIN HOADON
	ON KHACHHANG.Makh = HOADON.Makh
GROUP BY KHACHHANG.Makh, Tenkh
order by SOHD desc

--CAU 27
SELECT KHACHHANG.Makh, Tenkh, SUM(Sl) AS SOLUONGHANG
FROM KHACHHANG INNER JOIN HOADON 
	ON KHACHHANG.Makh = HOADON.Makh INNER JOIN 
	CHITIETHOADON ON HOADON.Mahd = CHITIETHOADON.Mahd
GROUP BY KHACHHANG.Makh, Tenkh
HAVING SUM(Sl) = (SELECT MAX(SOLUONGHANG)
FROM (SELECT KHACHHANG.Makh, Tenkh, SUM(Sl) AS SOLUONGHANG
FROM KHACHHANG INNER JOIN HOADON 
	ON KHACHHANG.Makh = HOADON.Makh INNER JOIN 
	CHITIETHOADON ON HOADON.Mahd = CHITIETHOADON.Mahd
GROUP BY KHACHHANG.Makh, Tenkh) AS TEMP
)

--CAU 28
SELECT VATTU.Mavt, Tenvt, COUNT(Mahd) AS SOHOADON
FROM VATTU INNER JOIN CHITIETHOADON ON
	VATTU.Mavt = CHITIETHOADON.Mavt
GROUP BY VATTU.Mavt, Tenvt
HAVING COUNT(Mahd) = (SELECT MAX(SOHOADON)
FROM (SELECT VATTU.Mavt, Tenvt, COUNT(Mahd) AS SOHOADON
FROM VATTU INNER JOIN CHITIETHOADON ON
	VATTU.Mavt = CHITIETHOADON.Mavt
GROUP BY VATTU.Mavt, Tenvt) AS TEMP
)

--CAU 29
SELECT VATTU.Mavt, Tenvt, SUM(Sl) AS SLBAN
FROM VATTU INNER JOIN CHITIETHOADON ON
	VATTU.Mavt = CHITIETHOADON.Mavt
GROUP BY VATTU.Mavt, Tenvt
HAVING SUM(Sl) = (SELECT MAX(SLBAN)
FROM (SELECT VATTU.Mavt, Tenvt, SUM(Sl) AS SLBAN
FROM VATTU INNER JOIN CHITIETHOADON ON
	VATTU.Mavt = CHITIETHOADON.Mavt
GROUP BY VATTU.Mavt, Tenvt) AS TEMP
)

--CAU 30
SELECT KHACHHANG.Makh, Tenkh, Diachi, SLHD = COUNT(Mahd)
FROM KHACHHANG LEFT JOIN HOADON 
	ON KHACHHANG.Makh = HOADON.Makh
GROUP BY KHACHHANG.Makh, Tenkh, Diachi

--CAU 4.1
CREATE PROCEDURE ds_khachhang_muahang_vaongay
(@ngaymua smallDateTime)
AS
BEGIN
	SELECT *
	FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.Makh = HOADON.Makh
	WHERE Ngay LIKE @ngaymua
END

SET DATEFORMAT DMY 
EXEC ds_khachhang_muahang_vaongay @ngaymua = '02/06/2016'

--CAU 4.2
CREATE PROCEDURE ds_khachhang_tongtrigia_lonhon_x
(@trigia int)
AS
BEGIN
	SELECT KHACHHANG.Tenkh
	from KHACHHANG inner JOIN HOADON on KHACHHANG.Makh = HOADON.Makh inner JOIN CHITIETHOADON on CHITIETHOADON.Mahd = HOADON.Mahd
	GROUP by KHACHHANG.Makh, KHACHHANG.Tenkh
	having sum(Sl * Giaban) > @trigia
END;

EXEC ds_khachhang_tongtrigia_lonhon_x @trigia = 5000

--CAU 4.3
CREATE PROCEDURE x_khachhang (@x int)
AS
BEGIN
	SELECT top (@x) Tenkh
	from KHACHHANG inner JOIN HOADON on KHACHHANG.Makh = HOADON.Makh inner JOIN CHITIETHOADON on CHITIETHOADON.Mahd = HOADON.Mahd
	GROUP by KHACHHANG.Makh, KHACHHANG.Tenkh
	order by SUM(Sl * Giaban) desc
END;

EXEC x_khachhang @x = 3

--CAU 4.4
create PROCEDURE n_mathang_bannhieunhat_2 (@n int)
AS
BEGIN
	select top (@n) Tenvt
	from VATTU inner JOIN CHITIETHOADON on CHITIETHOADON.Mavt = VATTU.Mavt
	group by VATTU.Mavt, Tenvt
	order by SUM(Sl) desc
END;

EXEC n_mathang_bannhieunhat_2 @n = 3

--CAU 4.5
create PROCEDURE n_mathang_itlainhat (@n int)
AS
BEGIN
	select top (@n) Tenvt
	from VATTU inner JOIN CHITIETHOADON on CHITIETHOADON.Mavt = VATTU.Mavt
	group by VATTU.Mavt, Tenvt
	order by SUM((Giaban - Giaban) * Sl)asc
END;

EXEC n_mathang_itlainhat @n = 5

use QuanLyBanHang

--CAU 4.6
CREATE PROCEDURE n_hoadon_giatrilonnhat (@n int)
AS
BEGIN
	SELECT top (@n) Mahd
	from CHITIETHOADON
	GROUP by Mahd
	order by sum (Giaban * Sl) desc
end;

EXEC n_hoadon_giatrilonnhat @n = 3

--CAU 4.7
--CAU 4.8
--CAU 4.9
CREATE PROCEDURE giatri_hoadon
AS
BEGIN
	SELECT HOADON.Mahd, sum(Sl * Giaban) as Tong_Giatri
	from HOADON INNER JOIN CHITIETHOADON on HOADON.Mahd = CHITIETHOADON.Mahd
	GROUP by HOADON.Mahd
END

EXEC giatri_hoadon

--Cau 4.10

--cau 5.1

create function doanhthu_5 (@nam int)
returns int
begin
	declare @doanhthu int
	set @doanhthu = (select SUM (Sl * Giaban)
	from CHITIETHOADON inner join HOADON on CHITIETHOADON.Mahd = HOADON.Mahd
	group by YEAR(Ngay)
	having CAST(YEAR(Ngay) as int)= @nam)
	return @doanhthu
end

--CAU 5.2
create function doanhthu_thang (@thang int)
returns int
begin
	declare @doanhthu int
	set @doanhthu = (select SUM (Sl * Giaban)
	from CHITIETHOADON inner join HOADON on CHITIETHOADON.Mahd = HOADON.Mahd
	group by Month(Ngay)
	having CAST(month(Ngay) as int)= @thang)
	return @doanhthu
end

select dbo.doanhthu_thang (3)

use QuanLyBanHang

--Cau 5.3
create function doanhthu_khachhang(@makh varchar(5))
returns int
begin
	declare @doanhthu int
	set @doanhthu = (select SUM(Sl * Giaban)
	from KHACHHANG inner join HOADON on KHACHHANG.Makh = HOADON.Makh inner join CHITIETHOADON on CHITIETHOADON.Mahd = HOADON.Mahd
	where KHACHHANG.Makh = (@makh)
	group by KHACHHANG.makh)
	return @doanhthu
end

select dbo.doanhthu_khachhang('KH04')

--Cau 5.4
create function soluongban(@mavt varchar(5), @thang int)
returns @soluongban table (Mavt varchar(5), Thang int, Soluongban int)
as
begin
	if(@thang is null)
		insert into @soluongban
		select VATTU.Mavt, cast(MONTH(Ngay) as int), sum(Sl)
		from VATTU inner join CHITIETHOADON on VATTU.Mavt = CHITIETHOADON.Mavt inner join HOADON on CHITIETHOADON.Mahd = HOADON.Mahd
		where vattu.Mavt = @mavt
		group by VATTU.Mavt, MONTH(Ngay)
	else
		insert into @soluongban
		select VATTU.Mavt, cast(MONTH(Ngay) as int), sum(Sl)
		from VATTU inner join CHITIETHOADON on VATTU.Mavt = CHITIETHOADON.Mavt inner join HOADON on CHITIETHOADON.Mahd = HOADON.Mahd
		where @mavt = VATTU.Mavt and cast(MONTH(Ngay) as int) = @thang
		group by VATTU.Mavt, MONTH(Ngay)
	return
end

select *
from dbo.soluongban('VT01', 6)

--Cau 5.5
create function tinhlai(@mavt varchar (5))
returns @laisuat TABLE (Mavattu varchar(5), Laisuat int)
as
begin
	if(@mavt is null) insert into @laisuat
	 select VATTU.Mavt, cast(SUM((Giaban - Giamua)*Sl) as int)
	 from VATTU inner join CHITIETHOADON on VATTU.Mavt = CHITIETHOADON.Mavt
	 group by VATTU.Mavt
	 else insert into @laisuat
	 select vattu.mavt, CAST(SUM((Giaban - Giamua)*Sl) as int)
	 from VATTU inner join CHITIETHOADON on VATTU.Mavt = CHITIETHOADON.Mavt
	 where VATTU.Mavt = @mavt
	 group by VATTU.Mavt
	 return
end

select * from dbo.tinhlai(null)