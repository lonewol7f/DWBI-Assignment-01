drop table if exists FactTransaction;
create table FactTransaction (
	TransactionID int,
	CustomerKey int foreign key references DimCustomer(CustomerSK),
	ItemKey int foreign key references DimItem(ItemSK),
	TransactionDateKey int foreign key references DimDate(DateKey),
	Quantity int,
	SellingPrice money,
	OtherDiscount money,
	CouponDiscount money,
	TotalDiscount numeric(30,4),
	TotalPrice numeric(31,4),
	accm_txn_create_time datetime,
	accm_txn_complete_time datetime,
	txn_process_time_hours float,
	InsertDate datetime,
	ModifiedDate datetime
)