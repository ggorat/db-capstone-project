DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking(IN booking_id INT, IN booking_time TIME, IN tableno INT, IN emp_id INT, customer_id INT)
BEGIN
DECLARE Taken INT DEFAULT 0;
	SELECT COUNT(Taken) INTO Taken
    FROM Bookings WHERE BookingSlot = booking_time AND TableNo = tableno;
    START TRANSACTION;
    INSERT INTO Bookings (BookingID, TableNo, BookingSlot, EmployeeID, CustomerID) VALUES (booking_id, tableno, booking_time, emp_id, customer_id);
    IF Taken > 0 THEN
		SELECT "Spot is taken";
        ROLLBACK;
	ELSE
		SELECT "Booking was succesfully added.";
        COMMIT;
	END IF;
    
    
END //
DELIMITER ;