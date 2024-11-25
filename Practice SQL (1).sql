CREATE DATABASE music;
USE music;

-- DROP DATABASE music;

/*
DROP TABLE 
DROP TABLE
DROP TABLE
DROP TABLE
DROP TABLE
DROP TABLE
*/

CREATE TABLE MsBranch
(
BranchID VARCHAR(6) PRIMARY KEY,
BranchName VARCHAR(50) NOT NULL,
Address VARCHAR(100) NOT NULL,
Phone VARCHAR(50),
CONSTRAINT CheckBran1 CHECK (CHAR_LENGTH(BranchID)=5),
CONSTRAINT CheckBran2 CHECK (BranchID REGEXP '^BR[0-9][0-9][0-9]$')
);

CREATE TABLE MsMusicInsType
(
MusicInsTypeID VARCHAR(6) PRIMARY KEY,
MusicInsType VARCHAR(50) NOT NULL,
CONSTRAINT CheckMsct1 CHECK (CHAR_LENGTH(MusicInsTypeID)=5),
CONSTRAINT CheckMsct2 CHECK (MusicInsTypeID REGEXP 'MT[0-9][0-9][0-9]')
);

CREATE TABLE MsEmployee
(
EmployeeID VARCHAR(6) PRIMARY KEY,
EmployeeName VARCHAR(50) NOT NULL,
Address VARCHAR(100) NOT NULL,
Phone VARCHAR(20) NOT NULL,
Gender CHAR(1) NOT NULL, -- M/F 
DateOfBirth DATETIME,
Salary DECIMAL (10,2), 
BranchID VARCHAR(6),
CONSTRAINT ChekckEmpl1 CHECK (CHAR_LENGTH(EmployeeID)=5),
CONSTRAINT ChekckEmpl2 CHECK (EmployeeID REGEXP 'EM[0-9][0-9][0-9]'),
CONSTRAINT ChekckEmpl3 CHECK (GENDER IN ('M','F')),
CONSTRAINT FK_MsEmployee_MsBranch FOREIGN KEY (BranchID) REFERENCES MsBranch(BranchID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE MsMusicIns
(
MusicInsID VARCHAR(6) PRIMARY KEY,
MusicIns VARCHAR (50) NOT NULL,
Price DECIMAL(10,2) NOT NULL,
Stock INT NOT NULL,
MusicInsTypeID VARCHAR(6), 
CONSTRAINT CheckMsci1 CHECK (CHAR_LENGTH(MusicInsID)=5),
CONSTRAINT CheckMsci2 CHECK (MusicInsID REGEXP 'MI[0-9][0-9][0-9]'),
CONSTRAINT CheckMsci3 CHECK (Stock >= 0),
CONSTRAINT FK_MsMusicIns_MsMusicInsType FOREIGN KEY (MusicInsTypeID) REFERENCES MsMusicInsType(MusicInsTypeID) ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE HeaderTransaction
(
  TransactionID VARCHAR(6) PRIMARY KEY,
  TransactionDate DATETIME NOT NULL,
  EmployeeID VARCHAR(6) REFERENCES MsEmployee(EmployeeID) ON UPDATE CASCADE ON DELETE SET NULL,
  CustomerName VARCHAR(50),
  CHECK (CHAR_LENGTH(TransactionID)=5),
  CHECK (TransactionID REGEXP 'TR[0-9][0-9][0-9]')
);

CREATE TABLE DetailTransaction
(
  TransactionID VARCHAR(6) REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
  MusicInsID VARCHAR(6) REFERENCES MsMusicIns(MusicInsID) ON UPDATE CASCADE ON DELETE CASCADE,
  Qty INT NOT NULL,
  PRIMARY KEY(TransactionID, MusicInsID)
);

SELECT * FROM MsBranch;
SELECT * FROM MsEmployee;
SELECT * FROM MsMusicIns;
SELECT * FROM MsMusicInsType;
SELECT * FROM HeaderTransaction ;
SELECT * FROM DetailTransaction;

INSERT INTO MsBranch VALUES ('BR001','Cabang Merdeka','Jl. Gang Merdeka No. 17','021-7771234');
INSERT INTO MsBranch VALUES ('BR002','Cabang Sejahtera','Jl. Sejahtera Sehat Selalu No. 88','022-2008972');
INSERT INTO MsBranch VALUES ('BR003','Cabang Adil','Jl. Adil No. 33','021-8983234');
INSERT INTO MsBranch VALUES ('BR004','Cabang Makmur','Jl. Gang Makmur No. 12','021-6526321');
INSERT INTO MsBranch VALUES ('BR005','Cabang Damai','Jl. Damai Aman Sentosa No. 45','044-8989898');

INSERT INTO MsEmployee VALUES ('EM001','Kikis Sabrina Mona','Jl. Putar-Putar No. 8','022-1239995','F','1989-03-21','3500000','BR001');
INSERT INTO MsEmployee VALUES ('EM002','Marlene Martani','Jl. Gajebo No. 32','022-5675542','F','1988-06-14','4250000','BR002');
INSERT INTO MsEmployee VALUES ('EM003','Rakhmat Suryahadi','Gang Gansing No. 19','021-3451232','M','1988-01-30','3670000','BR002');
INSERT INTO MsEmployee VALUES ('EM004','Suhandi','Jl. Pintu Lima No. 5','022-4519377','M','1985-02-10','5600000','BR001');
INSERT INTO MsEmployee VALUES ('EM005','Lisye Mareta Cahya','Jl. Gang Medan Merdeka No. 25','021-9798123','F','1986-12-12','5400000','BR001');
INSERT INTO MsEmployee VALUES ('EM006','Sofian Chandra','Jl. Putar-Putar No. 12','021-8763445','M','1987-12-11','5500000','BR005');
INSERT INTO MsEmployee VALUES ('EM007','William Salim','Jl. Pusing-Pusing No. 76','022-4859345','M','1987-08-14','5490000','BR005');
INSERT INTO MsEmployee VALUES ('EM008','William Wijaya','Jl. Gichung No. 10','022-7859123','M','1989-11-04','5590000','BR003');

INSERT INTO MsMusicInsType values ('MT001','Guitar');
INSERT INTO MsMusicInsType values ('MT002','Violin');
INSERT INTO MsMusicInsType values ('MT003','Piano');
INSERT INTO MsMusicInsType values ('MT004','Drum');
INSERT INTO MsMusicInsType values ('MT005','Keyboard');

INSERT INTO MsMusicIns values ('MI001','Yamaha CX-40','1150000','23','MT001');
INSERT INTO MsMusicIns values ('MI002','Yamaha KX-5000','5950000','12','MT005');
INSERT INTO MsMusicIns values ('MI003','Yamaha C-390','1250000','10','MT001');
INSERT INTO MsMusicIns values ('MI004','Excellent P-77','25700000','17','MT003');
INSERT INTO MsMusicIns values ('MI005','Board B-123','5650000','30','MT005');
INSERT INTO MsMusicIns values ('MI006','Pearl Q-300','9570000','26','MT004');
INSERT INTO MsMusicIns values ('MI007','Supernova X-23','4510000','56','MT002');
INSERT INTO MsMusicIns values ('MI008','Yamaha Grand X-1','49750000','12','MT003');

INSERT INTO HeaderTransaction values ('TR001','2010-10-02 15:30:00.000','EM003','Veronica');
INSERT INTO HeaderTransaction values ('TR002','2010-10-15 09:50:00.000','EM008','Richard Parker');
INSERT INTO HeaderTransaction values ('TR003','2010-10-16 13:26:00.000','EM005','Steven Michael');
INSERT INTO HeaderTransaction values ('TR004','2010-11-22 10:55:00.000','EM004','Anabelle Setiawan Wati');
INSERT INTO HeaderTransaction values ('TR005','2010-11-25 15:30:00.000','EM003','Michelle Regina');
INSERT INTO HeaderTransaction values ('TR006','2010-12-13 08:23:00.000','EM001','Dian Sastro');
INSERT INTO HeaderTransaction values ('TR007','2010-12-13 18:19:00.000','EM001','Cathy');
INSERT INTO HeaderTransaction values ('TR008','2010-12-27 15:21:00.000','EM006','Stephanie Meyer');
INSERT INTO HeaderTransaction values ('TR009','2010-01-02 10:28:00.000','EM007','Michael J.');
INSERT INTO HeaderTransaction values ('TR010','2010-01-03 12:39:00.000','EM002','Arnold Swasana Segar');

INSERT INTO DetailTransaction values ('TR001','MI001','1');
INSERT INTO DetailTransaction values ('TR001','MI004','2');
INSERT INTO DetailTransaction values ('TR002','MI003','1');
INSERT INTO DetailTransaction values ('TR002','MI005','2');
INSERT INTO DetailTransaction values ('TR002','MI008','5');
INSERT INTO DetailTransaction values ('TR003','MI007','4');
INSERT INTO DetailTransaction values ('TR004','MI004','3');
INSERT INTO DetailTransaction values ('TR004','MI006','3');
INSERT INTO DetailTransaction values ('TR005','MI002','1');
INSERT INTO DetailTransaction values ('TR006','MI001','2');
INSERT INTO DetailTransaction values ('TR007','MI003','3');
INSERT INTO DetailTransaction values ('TR007','MI006','5');
INSERT INTO DetailTransaction values ('TR008','MI002','3');
INSERT INTO DetailTransaction values ('TR008','MI004','2');
INSERT INTO DetailTransaction values ('TR008','MI008','1');
INSERT INTO DetailTransaction values ('TR009','MI002','2');
INSERT INTO DetailTransaction values ('TR009','MI005','4');
INSERT INTO DetailTransaction values ('TR010','MI001','2');
INSERT INTO DetailTransaction values ('TR010','MI003','2');
INSERT INTO DetailTransaction values ('TR010','MI004','2');
INSERT INTO DetailTransaction values ('TR011','MI004','1');
INSERT INTO DetailTransaction values ('TR011','MI005','1');

SELECT MusicIns, MusicInsTypeID FROM MsMusicIns;
SELECT MusicInsID, Qty FROM DetailTransaction WHERE TransactionID = 'TR011';	

UPDATE DetailTransaction 
SET Qty = 1
WHERE TransactionID = 'TR011' AND MusicInsID = 'MI004';

UPDATE DetailTransaction 
SET Qty = 5
WHERE TransactionID = 'TR011';

DELETE FROM DetailTransaction WHERE TransactionID = 'TR011';

UPDATE DetailTransaction SET Qty = 5;


-- 1.	Tampilkan top 2 dari EmployeeID, EmployeeName, Gender dimana Gender adalah 'F' 
-- (LIMIT)

SELECT EmployeeID, EmployeeName, Gender
FROM MsEmployee
WHERE Gender = 'F'
LIMIT 2;


-- 2. 	Tampilkan tabel MsEmployee dimana digit terakhir dari Phone adalah kelipatan 5 dan 
-- salary lebih besar dari 4000000 (RIGHT)

SELECT *
FROM MsEmployee
WHERE Salary > 4000000 AND RIGHT(Phone,1) % 5 = 0; -- 12345 -> 35 % 5 = 35 - 35 = 0


-- 3.	Buatlah view dengan nama view_1 lalu tampilkan tabel MsMusicIns dimana price
-- antara 5000000 dan 10000000, dengan MusicIns diawali dengan kata Yamaha.
-- Tampilkan view tersebut dan buat syntax untuk menghapus view tersebut
-- (CREATE VIEW, BETWEEN, LIKE) 

CREATE VIEW view_1 AS
SELECT *
FROM MsMusicIns
WHERE Price BETWEEN 5000000 AND 10000000 AND MusicIns LIKE 'Yamaha%'; -- Wildcard -> Yamaha PX500 / Yamah CX1000

SELECT *
FROM view_1;
	
-- 4.	Tampilkan BranchEmployee ( didapat dari employeename dan nama depan employeename diganti dengan branchID )
-- dimana employeename memiliki minimal 3 kata. (REPLACE, CONCAT, SUBSTRING, LOCATE, LIKE)

-- Concatenate -> BR001 
SELECT CONCAT(BranchID, ' ', SUBSTRING(EmployeeName, LOCATE(' ', EmployeeName)+1)) AS BranchEmployee -- ALIAS
FROM MsEmployee
WHERE CHAR_LENGTH(EmployeeName) - CHAR_LENGTH(REPLACE(EmployeeName, ' ', '')) >= 2;
-- WHERE EmployeeName LIKE '% % %';

-- Hansen Tanjaya Wilfridus-> HansenTanjayaWilfridus

-- 5.	Tampilkan Brand (didapat dari kata pertama MusicIns), Price (didapat dari price ditambahkan kata 'Rp. ' didepannya),
-- Stock, Instrument Type(didapat dari MusicInsType) (SUBSTRING_INDEX,CONCAT, JOIN)

SELECT SUBSTRING_INDEX(MusicIns, ' ', 1) AS Brand,
CONCAT('Rp. ', Price) AS Price, 
Stock, MusicInsType
FROM MsMusicIns
JOIN MsMusicInsType ON  MsMusicInsType.MusicInsTypeID = MsMusicIns.MusicInsTypeID ;

-- 6.	Tampilkan EmployeeName, Employee Gender(didapat dari gender), Tanggal dengan format dd mm yyyy,
-- CustomerName dimana Gender merupakan 'Male' dan EmployeeName memiliki 2 kata atau lebih.
-- (CASE WHEN, DATE_FORMAT, JOIN, LIKE, ORDER BY)
SELECT EmployeeName, 
       CASE WHEN Gender = 'M' THEN 'Male' ELSE 'Female' END AS EmployeeGender,
       DATE_FORMAT(TransactionDate, '%d %M %Y') AS TransactionDate, 
       CustomerName 
FROM MsEmployee AS a 
JOIN HeaderTransaction AS b ON a.EmployeeID = b.EmployeeID 
WHERE EmployeeName LIKE '% %' 
  AND Gender = 'M' 
ORDER BY EmployeeName DESC;

-- 7.	Tampilkan EmployeeID, EmployeeName, DateofBirth dengan format dd mm yyyy, CustomerName, Transactiondate dimana
-- DateOfBirth adalah bulan ‘December’ dan TransactionDate adalah tanggal 16. (DATE_FORMAT, JOIN, MONTHNAME, DAYOFMONTH) 

SELECT a.EmployeeID, 
       EmployeeName, 
       DATE_FORMAT(DateOfBirth, '%d-%m-%Y') AS DateOfBirth, 
       CustomerName, 
       DATE_FORMAT(TransactionDate, '%d %m %Y') AS TransactionDate 
FROM MsEmployee AS a 
JOIN HeaderTransaction AS b ON a.EmployeeID = b.EmployeeID 
WHERE MONTHNAME(DateOfBirth) = 'December' 
  AND DAYOFMONTH(TransactionDate) = 16;


-- 8.	Tampilkan BranchName,EmployeeName dimana transaksi terjadi bulan Oktober dan Qty lebih dari sama dengan 5.
-- (EXISTS, JOIN, MONTHNAME) 

-- Subquery
SELECT BranchName, EmployeeName 
FROM MsEmployee AS a 
JOIN MsBranch AS b ON a.BranchID = b.BranchID 
WHERE EXISTS (
    SELECT * 
    FROM HeaderTransaction AS x 
    JOIN DetailTransaction AS y ON x.TransactionID = y.TransactionID 
    WHERE MONTHNAME(TransactionDate) = 'October' 
      AND Qty >= 5 
      AND a.EmployeeID = x.EmployeeID
);


-- 9.	Buatlah store procedure untuk fungsi search dengan nama search yang menampilkan EmployeeName,
-- Address, Phone, Gender. Fungsi ini akan mencari ke seluruh kolom sesuai inputan. (CREATE PROCEDURE, LIKE, CONCAT)

DELIMITER $$

CREATE PROCEDURE search (IN input VARCHAR(255))
BEGIN
	SELECT  EmployeeName, Address, Phone, Gender 
    FROM MsEmployee
    WHERE EmployeeName LIKE CONCAT('%', input, '%') -- 
      OR Address LIKE CONCAT('%', input, '%') 
      OR Phone LIKE CONCAT('%', input, '%') 
      OR Gender LIKE CONCAT('%', input, '%');
END$$

DELIMITER ;

DROP PROCEDURE search;
SELECT * FROM MSEMPLOYEE;

CALL search("Je");

-- 10.	Buatlah Stored Procedure dengan nama “Check_Transaction” yang menampilkan data CustomerName,
-- EmployeeName, BranchName, MusicIns, Price berdasarkan TransactionID yang diinput.

DELIMITER $$

CREATE PROCEDURE Check_Transaction (IN input VARCHAR(255))
BEGIN
	SELECT CustomerName, EmployeeName, BranchName, MusicIns, Price 
    FROM HeaderTransaction AS a
    JOIN MsEmployee AS b ON a.EmployeeId = b.EmployeeId
    JOIN MsBranch AS c ON b.BranchID = c.BranchID
    JOIN DetailTransaction AS d ON a.TransactionId = d.TransactionID
    JOIN MsMusicIns AS e ON d.MusicInsID = e.MusicInsID
    WHERE a.TransactionID LIKE input;
END$$

DELIMITER ;

DROP PROCEDURE Check_Transaction;

SELECT * FROM headertransaction;

CALL Check_Transaction("TR001");


-- 11.	Tampilkan data yang menunjukan detail jumlah transaksi musicins per employee
-- JumlahTransaksi, EmployeeName

SELECT COUNT(a.TransactionID) AS JumlahTransaksi, EmployeeName 
FROM HeaderTransaction AS a 
-- JOIN DetailTransaction AS b ON a.TransactionID = b.TransactionID 
JOIN MsEmployee AS c ON a.EmployeeID = c.EmployeeID 
GROUP BY EmployeeName;

-- 12.	Buatlah Stored Procedure dengan nama "Add_Stock_MusicIns" untuk menambah stock MusicIns.
-- Jika stock yang diinput lebih kecil atau sama dengan 0, maka akan dimunculkan pesan
-- "Stok yang di input harus lebih besar dari 0" 

DELIMITER $$

CREATE PROCEDURE Add_Stock_MusicIns (IN inputID VARCHAR(255), IN inputStock INT)
BEGIN
	IF EXISTS (SELECT * FROM MsMusicIns WHERE MusicInsID = inputID) THEN
		IF inputstock <= 0 THEN
			SELECT 'Stock yang di input harus lebih besar dari 0';
        ELSE
			UPDATE MsmusicIns SET stock = stock + inputstock WHERE MusicInsID = inputID;
		END IF;
	ELSE 
		SELECT 'Data tidak ditemukan / Kode yang dimasukan salah';
	END IF;
END$$

DELIMITER ;

SELECT * FROM MsMusicIns;

CALL Add_Stock_MusicIns ("MI001", 2);

-- 13. Buatlah Stored Procedure dengan nama “Check_Sale” untuk melihat MusicInsType
-- apa saja yang terjual pada bulan tertentu beserta jumlah yang terjualnya.

DELIMITER $$

CREATE PROCEDURE Check_Sale (IN input VARCHAR(255))
BEGIN
	SELECT a.MusicInsTypeID, SUM(c.Qty) AS Qty
    FROM MsMusicInsType AS a
    JOIN MsmusicIns AS b ON a.MusicInsTypeID = b.MusicInsTypeID
    JOIN DetailTransaction AS c ON b.MusicInsID = c.MusicInsID
    JOIN HeaderTransaction AS d  ON c.TransactionID = d.TransactionID
    WHERE MONTHNAME(TransactionDate) = input
    GROUP BY a.MusicInsTypeID;
END$$


DELIMITER ;
CALL Check_Sale ('December');
DROP PROCEDURE  Check_Sale;
    
-- 14.	Buatlah Stored Procedured dengan nama “Check_Employee”
-- yang berfungsi untuk memberikan informasi employeename, address, phone,
-- DateOfBirth, dan BranchName berdasarkan TransactionID. Jika TransactionID
-- tidak dimasukan, maka akan dimunculkan semua data employee yang ada.

DELIMITER $$
START PROCEDURE 
	
