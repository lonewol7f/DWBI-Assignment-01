drop table if exists DimItemCategory;
create table DimItemCategory
(
	CategorySK	int identity(1,1) primary key,
	AlternateCategoryID int,
	CategoryName nvarchar(50),
	InsertDate	DateTime,
	ModifiedDate	DateTime
)