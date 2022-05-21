drop table if exists DimItem;
create table DimItem (
	ItemSK int identity(1,1) primary key,
	AlternateItemID int,
	Brand int,
	BrandType nvarchar(50),
	CategoryKey int foreign key references DimItemCategory(CategorySK),
	InsertDate datetime, 
	ModifiedDate datetime
)