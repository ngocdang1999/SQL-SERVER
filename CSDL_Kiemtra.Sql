Create Database CSDL_KIEMTRA;
go
Use CSDL_KIEMTRA;
go

Create Table KHACHHANG(
	Makh varchar(5) PRIMARY KEY,
	Tenkh Nvarchar(30) not null,
	Diachi Nvarchar(50),
	Dt varchar(11),
	Email varchar(30));
	
Create Table VATTU(
	Mavt varchar(5) PRIMARY KEY,
	Tenvt Nvarchar(30) not null,
	Dvt Nvarchar(20),
	Giamua float CHECK (Giamua > 0),
	Slton int CHECK (Slton > 0)
	);
	
Create Table HOADON(
	Mahd varchar(10) PRIMARY KEY,
	Ngay smallDateTime,
	Makh varchar(5),
	Tongtg float,
	CONSTRAINT FK_KHACHHANG FOREIGN KEY (Makh) REFERENCES KHACHHANG(Makh),
	);
	
Create Table CHITIETHOADON(
	Mahd varchar(10),
	Mavt varchar(5),
	Sl int CHECK (Sl>0),
	Khuyenmai float,
	Giaban float,
	CONSTRAINT PF_Mahd_Mavt PRIMARY KEY (Mahd, Mavt),
	CONSTRAINT FK_Mahd FOREIGN KEY (Mahd) REFERENCES HOADON(Mahd),
	CONSTRAINT FK_Mavt FOREIGN KEY (Mavt) REFERENCES VATTU(Mavt),
	);



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

/*
--Câu 21. Lấy ra danh sách các hóa đơn gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn.

CREATE VIEW Cau21 AS
SELECT CHITIETHOADON.Mahd,Ngay,Tenkh,Diachi, SUM(Giaban) AS Tong
FROM CHITIETHOADON INNER JOIN HOADON ON HOADON.Mahd = CHITIETHOADON.Mahd
INNER JOIN dbo.KHACHHANG ON KHACHHANG.Makh = HOADON.Makh
GROUP BY CHITIETHOADON.Mahd,Ngay,Tenkh,Diachi

--Câu 22. Lấy ra hóa đơn có tổng trị giá lớn nhất gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn.

CREATE VIEW Cau22 AS
SELECT Mahd,Ngay,Tenkh,Diachi,Tong
FROM Cau21
WHERE Tong IN (SELECT MAX(Tong) FROM Cau21)

--Câu 23. Lấy ra hóa đơn có tổng trị giá lớn nhất trong tháng 5/2016 gồm các thông tin: Số hóa đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hóa đơn.

CREATE VIEW TongThang AS
SELECT CHITIETHOADON.Mahd,Ngay, CONVERT(INT,MONTH(Ngay)) AS Thang,Tenkh,Diachi, Sum(Giaban) AS Tong
FROM CHITIETHOADON INNER JOIN HOADON ON HOADON.Mahd = CHITIETHOADON.Mahd
INNER JOIN dbo.KHACHHANG ON KHACHHANG.Makh = HOADON.Makh
GROUP BY CHITIETHOADON.Mahd,Ngay,Tenkh,Diachi

CREATE VIEW TongT5 AS
SELECT Mahd,Ngay,Tenkh,Diachi,Tong
FROM TongThang
WHERE Thang = 5

CREATE VIEW Cau23 AS
SELECT Mahd,Ngay,Tenkh,Diachi,Tong
FROM TongT5
WHERE Tong IN (SELECT MAX(Tong) FROM TongT5)
select * from cau23

--Câu 24. Đếm xem mỗi khách hàng có bao nhiêu hóa đơn.

create view cau24 as
SELECT KHACHHANG.Makh, Tenkh, COUNT(DISTINCT CHITIETHOADON.Mahd) AS Tonghd
FROM KHACHHANG INNER JOIN HOADON ON HOADON.Makh = KHACHHANG.Makh
INNER JOIN CHITIETHOADON ON CHITIETHOADON.Mahd = HOADON.Mahd
GROUP BY KHACHHANG.Makh,Tenkh

--Câu 25. Đếm xem mỗi khách hàng, mỗi tháng có bao nhiêu hóa đơn.

CREATE VIEW DonThang1 AS
SELECT KhachHang.Makh,Tenkh,CONVERT(INT,MONTH(Ngay)) AS Thang, COUNT(DISTINCT CHITIETHOADON.Mahd) AS Tonghd
FROM KHACHHANG INNER JOIN HOADON ON HOADON.Makh = KHACHHANG.Makh
INNER JOIN CHITIETHOADON ON CHITIETHOADON.Mahd = HOADON.Mahd
GROUP BY Ngay, Tenkh,KHACHHANG.Makh

CREATE VIEW Cau25_1 AS
SELECT Makh,Tenkh, Thang, COUNT(Tonghd) AS HD
FROM DonThang1
GROUP BY Makh,Thang, Tenkh

--Câu 26. Lấy ra các thông tin của khách hàng có số lượng hóa đơn mua hàng nhiều nhất.

CREATE VIEW Cau26 AS
SELECT cau24.Makh,cau24.Tenkh,Diachi, Dt, Email
FROM KHACHHANG INNER JOIN cau24 ON dbo.KHACHHANG.Makh=cau24.Makh 
WHERE Tonghd IN (SELECT MAX(Tonghd) FROM cau24)

--Câu 27. Lấy ra các thông tin của khách hàng có số lượng hàng mua nhiều nhất.

CREATE VIEW TongSLHang AS
SELECT KHACHHANG.Makh, KHACHHANG.Tenkh, SUM(Sl) AS TongSL
FROM KHACHHANG INNER JOIN HOADON ON HOADON.Makh = KHACHHANG.Makh
INNER JOIN CHITIETHOADON ON CHITIETHOADON.Mahd = HOADON.Mahd
GROUP BY KHACHHANG.Makh, Tenkh

CREATE VIEW Cau27 AS
SELECT TongSLHang.Makh,TongSLHang.Tenkh,Diachi, Dt, Email
FROM KHACHHANG INNER JOIN TongSLHang ON dbo.KHACHHANG.Makh=TongSLHang.Makh 
WHERE TongSL IN (SELECT MAX(TongSL) FROM TongSLHang)

--Câu 28. Lấy ra các thông tin về các mặt hàng mà được bán trong nhiều hóa đơn nhất.

CREATE VIEW SoLanVT as
SELECT Mavt, COUNT(Mavt) AS Solan 
FROM dbo.CHITIETHOADON
GROUP BY Mavt

CREATE VIEW Cau28 AS
SELECT VATTU.Mavt, Tenvt
FROM VATTU, SoLanVT
WHERE VATTU.Mavt=SoLanVT.Mavt AND Solan IN (SELECT MAX(Solan) FROM SoLanVT)

--Câu 29. Lấy ra các thông tin về các mặt hàng mà được bán nhiều nhất.

CREATE VIEW TongVT as
SELECT Mavt, SUM(Sl) AS TongVT
FROM dbo.CHITIETHOADON
GROUP BY Mavt

CREATE VIEW Cau29 AS
SELECT VATTU.Mavt, Tenvt, TongVT
FROM VATTU, TongVT
WHERE VATTU.Mavt=TongVT.Mavt AND TongVT IN (SELECT MAX(TongVT) FROM TongVT)

--Câu 30. Lấy ra danh sách tất cả các khách hàng gồm Mã khách hàng, tên khách hàng, địa chỉ, số lượng hóa đơn đã mua (nếu khách hàng đó chưa mua hàng thì cột số lượng hóa đơn để trống)

CREATE VIEW SoHD AS 
SELECT Makh, COUNT(Mahd) AS SoHD
FROM dbo.HOADON
GROUP BY Makh

CREATE VIEW Cau30 AS
SELECT dbo.KHACHHANG.Makh, Tenkh, Diachi, CASE WHEN (SoHD IS NULL) THEN 0 ELSE SoHD END AS SoHoaDon
FROM KHACHHANG LEFT JOIN SoHD ON KHACHHANG.Makh=SoHD.Makh
SELECT * FROM Cau30
*/

--4.1 

CREATE PROC Cau01 @ngay smallDateTime AS
BEGIN
	SELECT Tenkh, Diachi 
	FROM KHACHHANG INNER JOIN HOADON on KHACHHANG.Makh = HOADON.Makh
	WHERE Ngay = @ngay
END

set DATEFORMAT DMY 
EXEC Cau01 '25/05/2016'

--4.3

CREATE PROC Cau03 @sokh int AS
BEGIN
	SELECT TOP (@sokh) Tenkh 
	FROM KHACHHANG, CHITIETHOADON, HOADON	
	WHERE KHACHHANG.Makh = HOADON.Makh AND HOADON.Mahd = CHITIETHOADON.Mahd AND (Sl*Giaban) > @sokh
	GROUP BY KHACHHANG.Tenkh
END

EXEC Cau03 @sokh = 5000


--4.3

