Create Database DL_KIEMTRA;
go
Use CSDL_KIEMTRA;
go


SELECT * INTO VATTU FROM DL_Kiemtra.dbo.VATTU

ALTER Table VATTU ADD CONSTRAINT  CHECK_GIAMUA CHECK (Giamua>0)
ALTER Table VATTU ADD CONSTRAINT  CHECK_SLT CHECK (Slton>0)
ALTER Table HOADON ADD CONSTRAINT  CHECK_TONGTG CHECK (Tongtg>0)
ALTER Table CHITIETHOADON ADD CONSTRAINT  CHECK_SL CHECK (SL>0)
ALTER Table CHITIETHOADON ADD CONSTRAINT  CHECK_GIABAN CHECK (Giaban>0)

ALTER TABLE VATTU ALTER COLUMN Mavt VARCHAR(5) NOT NULL
ALTER TABLE KHACHHANG ALTER COLUMN Makh VARCHAR(10) NOT NULL
ALTER TABLE HOADON ALTER COLUMN Mahd VARCHAR(10) NOT NULL
ALTER TABLE CHITIETHOADON ALTER COLUMN Mahd VARCHAR(10) NOT NULL
ALTER TABLE CHITIETHOADON ALTER COLUMN Mavt VARCHAR(5) NOT NULL

ALTER TABLE VATTU ADD CONSTRAINT PK_MAVT PRIMARY KEY (Mavt)
ALTER TABLE KHACHHANG ADD CONSTRAINT PK_MAKH PRIMARY KEY (Makh)
ALTER TABLE HOADON ADD CONSTRAINT PK_HD PRIMARY KEY (Mahd)
ALTER TABLE CHITIETHOADON ADD CONSTRAINT PK_CTHD PRIMARY KEY (Mahd,Mavt)

ALTER TABLE HOADON ADD CONSTRAINT KP_HD_KH FOREIGN KEY (Makh) REFERENCES KHACHHANG (Makh)
ALTER TABLE CHITIETHOADON ADD CONSTRAINT KP_HD_KH FOREIGN KEY (Mahd) REFERENCES KHACHHANG (Mahd)
ALTER TABLE CHITIETHOADON ADD CONSTRAINT KP_HD_KH FOREIGN KEY (Mavt) REFERENCES KHACHHANG (Mavt)
--1)
SELECT *
FROM VATTU
WHERE Tenvt LIKE 'GẠCH%'
--2)
SELECT TOP 1  Diachi, SUM(Sl*Giaban) AS DOANHTHU
FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.Makh = HOADON.Makh
				INNER JOIN CHITIETHOADON ON HOADON.Mahd = CHITIETHOADON.Mahd
GROUP BY Diachi
ORDER BY DOANHTHU DESC
--3)
SELECT VATTU.Mavt, Tenvt , Dvt 
FROM VATTU LEFT JOIN CHITIETHOADON ON VATTU.Mavt = CHITIETHOADON.Mavt
WHERE CHITIETHOADON.Mavt IS NULL


Create Table KHACHHANG(
	Makh varchar(5) ,
	Tenkh Nvarchar(30) not null,
	Diachi Nvarchar(50),
	Dt varchar(11),
	Email varchar(30));
	
Create Table VATTU(
	Mavt varchar(5) ,
	Tenvt Nvarchar(30) not null,
	Dvt Nvarchar(20),
	Giamua float,
	Slton int);
	
Create Table HOADON(
	Mahd varchar(10),
	Ngay smallDateTime,
	Makh varchar(5),
	Tongtg float);
	
Create Table CHITIETHOADON(
	Mahd varchar(10),
	Mavt varchar(5),
	Sl int,
	Khuyenmai float,
	Giaban float);
	
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

--Câu 1:Hiển thị danh sách các khách hàng có địa chỉ là “Tân Bình” gồm mã khách hàng, tên khách hàng, địa chỉ, điện thoại, và địa chỉ E-mail.

SELECT Makh AS [MÃ KHÁCH HÀNG], Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ], Email AS EMAIL
FROM KHACHHANG
WHERE Diachi = 'Tân Bình'

--Câu 2: Hiển thị danh sách các khách hàng gồm các thông tin mã khách hàng, tên khách hàng, địa chỉ và địa chỉ E-mail của những khách hàng chưa có số điện thoại.

SELECT Makh AS [MÃ KHÁCH HÀNG], Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ], Email AS EMAIL
FROM KHACHHANG
WHERE Dt is NULL

--Câu 3: Hiển thị danh sách các khách hàng chưa có số điện thoại và cũng chưa có địa chỉ Email gồm mã khách hàng, tên khách hàng, địa chỉ.

SELECT Makh AS [MÃ KHÁCH HÀNG], Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ], Email AS EMAIL
FROM KHACHHANG
WHERE Dt IS NULL AND Email IS NULL

--Câu 4: Hiển thị danh sách các khách hàng đã có số điện thoại và địa chỉ E-mail gồm mã khách hàng, tên khách hàng, địa chỉ, điện thoại, và địa chỉ E-mail.

SELECT Makh AS [MÃ KHÁCH HÀNG], Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ], Email AS EMAIL
FROM KHACHHANG
WHERE Dt IS NOT NULL AND Email IS NOT NULL

--Câu 5:  Hiển thị danh sách các vật tư có đơn vị tính là “Cái” gồm mã vật tư, tên vật tư và giá mua.

SELECT  Mavt AS [MÃ VẬT TƯ], Tenvt AS [TÊN VẬT TƯ], Giamua AS [GIÁ MUA]
FROM VATTU
WHERE Dvt = 'Cái'

--Câu 6: 6. Hiển thị danh sách các vật tư gồm mã vật tư, tên vật tư, đơn vị tính và giá mua mà có giá mua trên 25000.

SELECT  Mavt AS [MÃ VẬT TƯ], Tenvt AS [TÊN VẬT TƯ], Dvt AS [ĐƠN VỊ TÍNH], Giamua AS [GIÁ MUA]
FROM VATTU
WHERE Giamua > 25000

--Câu 7: Hiển thị danh sách các vật tư là “Gạch” (bao gồm các loại gạch) gồm mã vật tư, tên vật tư, đơn vị tính và giá mua.

SELECT  Mavt AS [MÃ VẬT TƯ], Tenvt AS [TÊN VẬT TƯ], Dvt AS [ĐƠN VỊ TÍNH], Giamua AS [GIÁ MUA]
FROM VATTU
WHERE Tenvt LIKE 'G%'

--Câu 8:  Hiển thị danh sách các vật tư gồm mã vật tư, tên vật tư, đơn vị tính và giá mua mà có giá mua nằm trong khoảng từ 20000 đến 40000.

SELECT  Mavt AS [MÃ VẬT TƯ], Tenvt AS [TÊN VẬT TƯ], Dvt AS [ĐƠN VỊ TÍNH], Giamua AS [GIÁ MUA]
FROM VATTU
WHERE Giamua <= 40000 AND Giamua >= 20000

--Câu 9: Lấy ra các thông tin gồm Mã hóa đơn, ngày lập hóa đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại.

SELECT Mahd AS [MÃ HOÁ ĐƠN], Ngay AS [NGÀY LẬP HÓA ĐƠN], KHACHHANG.Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI]
FROM HOADON, KHACHHANG
WHERE KHACHHANG.Makh=HOADON.Makh 

--Câu 10: Lấy ra các thông tin gồm Mã hóa đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại của ngày 25/5/2016.

SELECT DISTINCT HOADON.Mahd AS [MÃ HOÁ ĐƠN], Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI]
FROM HOADON, KHACHHANG
WHERE KHACHHANG.Makh=HOADON.Makh AND DAY(NGAY)=25 AND MONTH(Ngay)=5 AND YEAR(Ngay)=2016

--Câu 11: Lấy ra các thông tin gồm Mã hóa đơn, ngày lập hóa đơn, tên khách hàng, địa chỉ khách hàng và số điện thoại của những hóa đơn trong tháng 6/2016.

SELECT DISTINCT Mahd AS [MÃ HOÁ ĐƠN], Ngay AS [NGÀY LẬP HÓA ĐƠN], KHACHHANG.Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI]
FROM HOADON, KHACHHANG
WHERE KHACHHANG.Makh=HOADON.Makh AND MONTH(Ngay)=6 AND YEAR(Ngay)=2016

--Câu 12: Lấy ra danh sách những khách hàng (tên khách hàng, địa chỉ, số điện thoại) đã mua hàng trong tháng 6/2016.

SELECT DISTINCT Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI]
FROM HOADON, KHACHHANG
WHERE KHACHHANG.Makh=HOADON.Makh AND MONTH(Ngay)=6 AND YEAR(Ngay)=2016

--Câu 13: Lấy ra danh sách những khách hàng không mua hàng trong tháng 6/2016 gồm các thông tin tên khách hàng, địa chỉ, số điện thoại.

SELECT DISTINCT Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI]
FROM HOADON, KHACHHANG
WHERE KHACHHANG.Makh=HOADON.Makh AND MONTH(Ngay)<>6 AND YEAR(Ngay)=2016

--Câu 14: Lấy ra các chi tiết hóa đơn gồm các thông tin mã hóa đơn, mã vật tư, tên vật tư, đơn vị tính, giá bán, giá mua, số lượng, trị giá mua (giá mua * số lượng), trị giá bán (giá bán * số lượng).

SELECT DISTINCT Mahd AS [ MÃ HÓA ĐƠN], VATTU.Mavt AS [MÃ VẬT TƯ], Tenvt AS [TÊN VẬT TƯ], Dvt AS [ĐƠN VỊ TÍNH], Giaban AS [GIÁ BÀN], Giamua [GIÁ MUA], Sl, [TRỊ GIÁ MUA] = Giamua * Sl, [TRỊ GIÁ BÀN] = Giaban * Sl
FROM CHITIETHOADON, VATTU
WHERE VATTU.Mavt=CHITIETHOADON.Mavt

--Câu 15: Lấy ra các chi tiết hóa đơn gồm các thông tin mã hóa đơn, mã vật tư, tên vật tư, đơn vị tính, giá bán, giá mua, số lượng, trị giá mua (giá mua * số lượng), trị giá bán (giá bán * số lượng) mà có giá bán lớn hơn hoặc bằng giá mua.

SELECT DISTINCT Mahd AS [ MÃ HÓA ĐƠN], VATTU.Mavt AS [MÃ VẬT TƯ], Tenvt AS [TÊN VẬT TƯ], Dvt AS [ĐƠN VỊ TÍNH], Giaban AS [GIÁ BÀN], Giamua [GIÁ MUA], Sl, [TRỊ GIÁ MUA] = Giamua * Sl, [TRỊ GIÁ BÀN] = Giaban * Sl
FROM CHITIETHOADON, VATTU
WHERE VATTU.Mavt=CHITIETHOADON.Mavt AND Giaban >= Giamua

--Câu 16:  Lấy ra các thông tin gồm mã hóa đơn, mã vật tư, tên vật tư, đơn vị tính, giá bán, giá mua, số lượng, trị giá mua (giá mua * số lượng), trị giá bán (giá bán * số lượng) và cột khuyến mãi với khuyến mãi 10% cho những mặt hàng bán trong một hóa đơn lớn hơn 100.

SELECT DISTINCT Mahd AS [ MÃ HÓA ĐƠN], VATTU.Mavt AS [MÃ VẬT TƯ], Tenvt AS [TÊN VẬT TƯ], Dvt AS [ĐƠN VỊ TÍNH], Giaban AS [GIÁ BÀN], Giamua [GIÁ MUA], Sl, [TRỊ GIÁ MUA] = Giamua * Sl, [TRỊ GIÁ BÀN] = Giaban * Sl, Khuyenmai
FROM CHITIETHOADON, VATTU
WHERE VATTU.Mavt=CHITIETHOADON.Mavt AND Khuyenmai IS NULL AND Sl>100

--Câu 17. Tìm ra những mặt hàng chưa bán được.

SELECT  DISTINCT  VATTU.Mavt, Tenvt
FROM CHITIETHOADON, VATTU
WHERE NOT EXISTS (SELECT Mavt FROM CHITIETHOADON WHERE Mavt=VATTU.Mavt)

--Câu 18: Tạo bảng tổng hợp gồm các thông tin: mã hóa đơn, ngày hóa đơn, tên khách hàng, địa chỉ, số điện thoại, tên vật tư, đơn vị tính, giá mua, giá bán, số lượng, trị giá mua, trị giá bán.

SELECT DISTINCT HOADON.Mahd AS [MÃ HOÁ ĐƠN],NGAY AS [NGÀY LẬP HOÁ ĐƠN] ,Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI],tenvt AS [Tên vật tư], Dvt AS [Đơn vị tính ] , Sl AS [SỐ LƯỢNG], Giaban AS [Giá Bán],Giamua AS [Giá Mua], [TRỊ GIÁ MUA] = Giamua * Sl, [TRỊ GIÁ BÀN] = Giaban * Sl
FROM HOADON, KHACHHANG, CHITIETHOADON , VATTU
WHERE KHACHHANG.Makh=HOADON.Makh AND CHITIETHOADON.Mavt = VATTU.Mavt

--Câu 19: Tạo bảng tổng hợp tháng 5/2010 gồm các thông tin: mã hóa đơn, ngày hóa đơn, tên khách hàng, địa chỉ, số điện thoại, tên vật tư, đơn vị tính, giá mua, giá bán, số lượng, trị giá mua, trị giá bán.

SELECT DISTINCT HOADON.Mahd AS [MÃ HOÁ ĐƠN],NGAY AS [NGÀY LẬP HOÁ ĐƠN] ,Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI],tenvt AS [Tên vật tư], Dvt AS [Đơn vị tính ] , Sl AS [SỐ LƯỢNG], Giaban AS [Giá Bán],Giamua AS [Giá Mua], [TRỊ GIÁ MUA] = Giamua * Sl, [TRỊ GIÁ BÀN] = Giaban * Sl
FROM HOADON, KHACHHANG, CHITIETHOADON , VATTU
WHERE KHACHHANG.Makh=HOADON.Makh AND CHITIETHOADON.Mavt = VATTU.Mavt AND MONTH(NGAY)=5 AND YEAR(NGAY)= 2016

--Câu 20. Tạo bảng tổng hợp quý 1 – 2016 gồm các thông tin: mã hóa đơn, ngày hóa đơn, tên khách hàng, địa chỉ, số điện thoại, tên vật tư, đơn vị tính, giá mua, giá bán, số lượng, trị giá mua, trị giá bán.

SELECT DISTINCT HOADON.Mahd AS [MÃ HOÁ ĐƠN],NGAY AS [NGÀY LẬP HOÁ ĐƠN] ,Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Dt AS [ĐIỆN THOẠI],tenvt AS [Tên vật tư], Dvt AS [Đơn vị tính ] , Sl AS [SỐ LƯỢNG], Giaban AS [Giá Bán],Giamua AS [Giá Mua], [TRỊ GIÁ MUA] = Giamua * Sl, [TRỊ GIÁ BÀN] = Giaban * Sl
FROM HOADON, KHACHHANG, CHITIETHOADON , VATTU
WHERE KHACHHANG.Makh=HOADON.Makh AND CHITIETHOADON.Mavt = VATTU.Mavt AND Ngay BETWEEN '01-01-2016 00:00:00' AND '01-04-2016 00:00:00'


--Câu 21. Lấy ra danh sách các hóa đơn gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn.HOA
SELECT HOADON.Mahd, Ngay, Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Tongtg = CHITIETHOADON.Sl * CHITIETHOADON.Giaban
FROM KHACHHANG, HOADON, CHITIETHOADON
WHERE KHACHHANG.Makh=HOADON.Makh AND CHITIETHOADON.Mahd = HOADON.Mahd

SELECT *
FROM CHITIETHOADON
--Câu 22. Lấy ra hóa đơn có tổng trị giá lớn nhất gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn.
SELECT HOADON.Mahd, Ngay, Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Tongtg = CHITIETHOADON.Sl * CHITIETHOADON.Giaban 
FROM KHACHHANG, HOADON, CHITIETHOADON
WHERE G AND CHITIETHOADON.Mahd = HOADON.Mahd
--Câu 23. Lấy ra hóa đơn có tổng trị giá lớn nhất trong tháng 5/2010 gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn.
CREATE VIEW MAXSUM AS
SELECT HOADON.Mahd, Ngay, Tenkh AS [TÊN KHÁCH HÀNG], Diachi AS [ĐỊA CHỈ KHÁCH HÀNG], Tongtg = CHITIETHOADON.Sl * CHITIETHOADON.Giaban
FROM KHACHHANG, HOADON, CHITIETHOADON



SELECT Ngay,MAX(Tongtg)
FROM MAXSUM


DROP VIEW MAXSUM



SELECT *
FROM MAXSUM

--Câu 24. Đếm xem mỗi khách hàng có bao nhiêu hóa đơn.
--Câu 25. Đếm xem mỗi khách hàng, mỗi tháng có bao nhiêu hóa đơn.
--Câu 26. Lấy ra các thông tin của khách hàng có số lượng hóa đơn mua hàng nhiều nhất.
--Câu 27. Lấy ra các thông tin của khách hàng có số lượng hàng mua nhiều nhất.
--Câu 28. Lấy ra các thông tin về các mặt hàng mà được bán trong nhiều hóa đơn nhất.
--Câu 29. Lấy ra các thông tin về các mặt hàng mà được bán nhiều nhất.
--Câu 30. Lấy ra danh sách tất cả các khách hàng gồm Mã khách hàng, tên khách hàng, địa chỉ, số lượng hóa đơn đã mua (nếu khách hàng đó chưa mua hàng thì cột số lượng hóa đơn để trống)


--Câu 4: Tạo các procedure sau
--1. Lấy ra danh các khách hàng đã mua hàng trong ngày X, với X là tham số truyền vào.
CREATE proc CAU1 @ngay smalldatetime AS
	BEGIN
		SELECT Tenkh,Diachi
		FROM KHACHHANG INNER JOIN HOADON ON KHACHHANG.Makh = HOADON.Makh
		WHERE NGAY = @ngay
	END
SET DATEFORMAT DAY
EXEC CAU1 '05/09/2016'
GO
--2. Lấy ra danh sách khách hàng có tổng trị giá các đơn hàng lớn hơn X (X là tham số).
CREATE PROC CAU2 
@X INT
AS
BEGIN
	SELECT *
	FROM KHACHHANG
	WHERE 
END
--3. Lấy ra danh sách X khách hàng có tổng trị giá các đơn hàng lớn nhất (X là tham số).
--4. Lấy ra danh sách X mặt hàng có số lượng bán lớn nhất (X là tham số).
--5. Lấy ra danh sách X mặt hàng bán ra có lãi ít nhất (X là tham số).
--6. Lấy ra danh sách X đơn hàng có tổng trị giá lớn nhất (X là tham số).
--7. Tính giá trị cho cột khuyến mãi như sau: Khuyến mãi 5% nếu SL >100, 10% nếu SL>500.
--8. Tính số lại số lượng tồn cho tất cả các mặt hàng (SLTON = SLTON – tổng SL bán được).Bài thực hành Hệ quản trị CSDL số 2 5
--9. Tính trị giá cho mỗi hóa đơn.
--10. Tạo ra table KH_VIP có cấu trúc giống với cấu trúc table KHACHHANG. Lưu các khách hàng
--có tổng trị giá của tất cả các đơn hàng >=100.000.000 vào table KH_VIP
