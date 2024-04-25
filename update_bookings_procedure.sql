DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_time TIME)
BEGIN
    UPDATE Bookings SET BookingSlot = booking_time WHERE BookingID = booking_id;
    SELECT "Booking has been updated.";
END //
DELIMITER ;