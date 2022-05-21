CREATE PROCEDURE dbo.UpdateItemCategory
@CategoryID int,
@CategoryName nvarchar(50)
AS
BEGIN
if not exists(select CategorySK
from dbo.DimItemCategory
where AlternateCategoryID = @CategoryID)
BEGIN
insert into dbo.DimItemCategory
(AlternateCategoryID, CategoryName, InsertDate, ModifiedDate)
values
(@CategoryID, @CategoryName, GETDATE(), GETDATE())
END;
if exists(select CategorySK
from dbo.DimItemCategory
where AlternateCategoryID = @CategoryID)
BEGIN
update dbo.DimItemCategory
set 
AlternateCategoryID = @CategoryID,
CategoryName = @CategoryName,
ModifiedDate = GETDATE()
where AlternateCategoryID = @CategoryID
END;
END;