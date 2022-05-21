CREATE PROCEDURE dbo.UpdateItemData
@ItemID int,
@Brand int,
@BrandType nvarchar(50),
@CategorySK int
AS
BEGIN
if not exists(select ItemSK
from dbo.DimItem
where AlternateItemID = @ItemID)
BEGIN
insert into dbo.DimItem 
(AlternateItemID, Brand, BrandType, CategoryKey, InsertDate, ModifiedDate)
values
(@ItemID, @Brand, @BrandType, @CategorySK, GETDATE(), GETDATE())
END;
if exists(select ItemSK
from dbo.DimItem
where AlternateItemID = @ItemID)
BEGIN
update dbo.DimItem
set
AlternateItemID = @ItemID,
Brand = @Brand,
BrandType = @BrandType,
CategoryKey = @CategorySK,
ModifiedDate = GETDATE()
where AlternateItemID = @ItemID
END;
END;