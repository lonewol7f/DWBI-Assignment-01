CREATE PROCEDURE dbo.UpdateFactTransaction
@TransactionID int,
@CustomerKey int,
@ItemKey int,
@TransactionDateKey int,
@Quantity int,
@SellingPrice money,
@OtherDiscount money,
@CouponDiscount money,
@TotalDiscount numeric(30,4),
@TotalPrice numeric(31,4)
AS
BEGIN
if not exists(select TransactionID
from dbo.FactTransaction
where TransactionID = @TransactionID)
BEGIN
insert into dbo.FactTransaction
(TransactionID, CustomerKey, ItemKey, TransactionDateKey, Quantity, SellingPrice, OtherDiscount, CouponDiscount, TotalDiscount, TotalPrice, accm_txn_create_time, InsertDate, ModifiedDate)
values
(@TransactionID, @CustomerKey, @ItemKey, @TransactionDateKey, @Quantity, @SellingPrice, @OtherDiscount, @CouponDiscount, @TotalDiscount, @TotalPrice, GETDATE(), GETDATE(), GETDATE())
END;
if exists(select TransactionID
from dbo.FactTransaction
where TransactionID = @TransactionID)
BEGIN
update dbo.FactTransaction
set
ModifiedDate = GETDATE()
where TransactionID = @TransactionID
END;
END;