-- Boi den dong nao thi luc chay cau lenh se chi thuc thi dong do
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Tao Database DAN
CREATE DATABASE DAN
GO

-- Lenh de truy cap vao Database, thao tac tao bang,... tren databse do
USE DAN 
GO

-- Tao bang dbo.student
-- --- DEFAULT <value>: Tao gia tri mac dinh 
-- --- UNIQUE: gia tri duy nhat trong cot, cac gia tri khac khong duoc giong
-- --- NOT NULL: Khong cho phep de gia tri rong
-- --- IDENTITY: Gia tri tu dong tang len, khong can phai nhap
-- --- PRIMARY KEY: Khoa chinh cho 1 TABLE, = UNIQUE + NOT NULL, dung de cac khoa chinh cua bang khac tham chieu toi (bat buoc cac truong phai de NOT NULL neu muon set lam PRIMARY KEY)
CREATE TABLE dbo.student( 
	id INT UNIQUE NOT NULL IDENTITY,
	age INT,
	name NVARCHAR(50),
	address NVARCHAR(50),
	dob DATE,
	gpa FLOAT,
    -- Tao Primary key ngay khi tao bang
	CONSTRAINT PK_student -- Tao 1 name cho Primary Key de sau nay thuan tien cho viec xoa PrimaryKey cua TABLE nay
	PRIMARY KEY (id)
)
GO


-- Tao TABLE moi tu cac cot co san tu TABLE cu (Du lieu cung lay tu TABLE cu sang)
SELECT age, name, address INTO dbo.teacher FROM dbo.student --WHERE <condition>
GO

-- Them truong du lieu vao TABLE (ADD, DROP COLUMN, RENAME ... to ..., ALTER COLUMN)
ALTER TABLE dbo.teacher 
	ADD id INT NOT NULL IDENTITY
GO

-- Them Khoa chinh PRIMARY KEY cho bang o ben ngoai
ALTER TABLE dbo.teacher
	ADD CONSTRAINT PK_teacher -- Tao 1 name rieng cho Primary Key
	PRIMARY KEY (id)
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sua truong du lieu trong TABLE
ALTER TABLE dbo.student 
	ALTER COLUMN address NVARCHAR(100)
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Them record vao TABLE teacher
INSERT dbo.teacher
(
    age,
    name,
    address
)
VALUES
(   61,  -- age - int
    'Ngoc', -- name - varchar(50)
    N'Nghệ An'  -- address - varchar(50)
    )
GO

-- Them record vao cac cot trong TABLE student
SET IDENTITY_INSERT dbo.student ON -- Neu co truong la IDENTITY, thi phai bat che do INSERT ON
INSERT dbo.student
(
    id,
    age,
    name,
    address,
    dob,
	gpa
)
VALUES
(   1,        -- id - int
    (2022-2002),        -- age - int
    N'Hải',       -- name - nvarchar(50) (voi 'nvarchar' them N thanh N'...' de co ky tu unicode)
    N'Hà Nội',       -- address - nvarchar(50)
    '20020718', -- dob - date
	3.2
    )
SET IDENTITY_INSERT dbo.student OFF -- Sau khi them, phai tat che do IDENTITY INSERT = OFF 
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Chon cot tu bang de dua ra du lieu
SELECT * --ten cot
FROM dbo.student -- ten TABLE
GO

-- Chon cot tu bang, nhung chi lay du lieu khac nhau (loai bo nhung gia tri trung lap)
SELECT DISTINCT * --ten cot
FROM dbo.student -- ten TABLE
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Xoa Database DAN
DROP DATABASE DAN
GO -- Lenh ngan viec thuc thi cac cau lenh 1 cach dong thoi

 -- Xoa bang dbo.student
DROP TABLE dbo.student
GO

-- Xoa toan bo du lieu dang co trong TABLE
TRUNCATE TABLE dbo.student
GO

-- Xoa du lieu trong cua 1 record trong TABLE voi dieu kien (WHERE <column> <condition> AND, OR, NOT, IN, BETWEEN, >, <, =, >=, <=, !=)
DELETE dbo.student WHERE gpa < 3.2 AND gpa > 2.5
GO

-- Xoa Khoa chinh Primary KEY cua TABLE student
ALTER TABLE dbo.student 
	DROP CONSTRAINT  PK_student
GO

-- Xoa khoa ngoai Foreign KEY cua TABLE teacher
ALTER TABLE dbo.teacher
	DROP CONSTRAINT FK_teacher
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cap nhat Du lieu cua cot SET <...>, <...>
UPDATE dbo.student SET gpa = 2.3, address = 'Ha Noi' WHERE gpa IS NULL
GO




