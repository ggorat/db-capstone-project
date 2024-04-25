PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, BillAmount FROM Orders INNER JOIN Bookings ON Orders.BookingID = Bookings.BookingID WHERE CustomerID = ?';
set @id = 1;
EXECUTE GetOrderDetail USING @id;