DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN booking_time TIME, IN tableno INT)
BEGIN
DECLARE Taken INT DEFAULT 0;
	SELECT COUNT(Taken) INTO Taken
    FROM Bookings WHERE BookingSlot = booking_time AND TableNo = tableno;
    START TRANSACTION;
    INSERT INTO Bookings (BookingID, TableNo, BookingSlot, EmployeeID, CustomerID) VALUES (11, tableno, booking_time, 4, 2);
    IF Taken > 0 THEN
		SELECT "Spot is taken";
        ROLLBACK;
	ELSE
		SELECT "Available";
        COMMIT;
	END IF;
    
    
END //
DELIMITER ;