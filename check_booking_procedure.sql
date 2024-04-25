DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_time TIME, IN tableno INT)
BEGIN
DECLARE Taken INT DEFAULT 0;
	SELECT COUNT(Taken) INTO Taken
    FROM Bookings WHERE BookingSlot = booking_time AND TableNo = tableno;
    IF Taken > 0 THEN
		SELECT "Spot is taken";
		ELSE
			SELECT "Available";
	END IF;
END //
DELIMITER ;