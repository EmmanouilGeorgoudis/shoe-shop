use ShoeShop;

delimiter //

create procedure AddToCart (
    IN pCustomerID int, 
    IN pOrderID int, 
    IN pProductID int, 
    IN pOrderQuantity int
)
begin
    declare finalOrderID int;
    declare itemExists int;

    if pOrderID is null or pOrderID = 0 then
        insert into Orders (CustomerID, OrderDate)
        values (pCustomerID, CURRENT_DATE);
        set finalOrderID = LAST_INSERT_ID();
    else
        select count(*) into itemExists
        from Orders
        where ID = pOrderID and CustomerID = pCustomerID;

        if itemExists = 0 then
            insert into Orders (CustomerID, OrderDate, PaymentStatus)
            values (pCustomerID, CURRENT_DATE, false);
            set finalOrderID = LAST_INSERT_ID();
        else
            set finalOrderID = pOrderID;
        end if;
    end if;

    select count(*) into itemExists
    from OrderedItems
    where OrderID = finalOrderID and ProductID = pProductID;

    if itemExists > 0 then
        update OrderedItems
        set ItemQuantity = ItemQuantity + pOrderQuantity
        where OrderID = finalOrderID and ProductID = pProductID;
    else
        insert into OrderedItems (OrderID, ProductID, ItemQuantity)
        values (finalOrderID, pProductID, pOrderQuantity);
    end if;

    update Stock
    set StockQuantity = StockQuantity - pOrderQuantity
    where ProductID = pProductID;

    update Orders
    set PaymentStatus = true
    where ID = finalOrderID
    and CustomerID = pCustomerID;

end //

delimiter ;