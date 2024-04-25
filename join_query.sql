SELECT Customers.CustomerID, CONCAT(Customers.FirstName, ' ', Customers.LastName) AS FullName, Orders.OrderID, Orders.BillAmount, Menus.Cuisine, MenuItems.Name, MenuItems.Price
FROM Customers INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
INNER JOIN Orders ON Bookings.BookingID = Orders.BookingID
INNER JOIN Menus ON Orders.MenuID = Menus.MenuID
INNER JOIN MenuItems ON Menus.ItemID = MenuItems.ItemID
WHERE BillAmount > 40
ORDER BY BillAmount ASC;