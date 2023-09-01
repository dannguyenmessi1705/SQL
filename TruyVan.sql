USE DAN
-- Truy van den 3 bang da chon
SELECT * FROM dbo.student
SELECT * FROM dbo.subject
SELECT * FROM dbo.teacher
GO

-- Truy van Khoa ngoai toi Khoa chinh, tu bang Sinh vien tra duoc Mon hoc
SELECT ST.name AS N'Họ tên', SJ.name AS N'Môn học' FROM dbo.student AS ST, dbo.subject AS SJ
-- Vi theo co che truy van VD (a, b) thuoc TABLE A, (c, d) thuoc TABLE B => ta co cac cap (ac, ad, bc, bd)
-- => de loc dung ra du lieu, ta can co them vai dieu kien tuy thuoc theo 2 bang
WHERE ST.id = SJ.id
GO

-- Dem so luong phan tu trong bang (So luong sinh vien co GPA >= 2.8)
SELECT COUNT(*) AS N'Số lượng sinh viên' FROM dbo.student AS ST
WHERE ST.gpa >= 2.8
GO