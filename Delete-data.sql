-- Task One
SELECT * FROM Flight WHERE Flight_number = 'ST401';

DELETE FROM Flight WHERE Flight_number = 'ST401';

-- Task Two
SELECT B.* FROM Booking B
JOIN Flight F ON B.FlightID = F.FlightID
WHERE F.Status = 'Cancelled';

DELETE FROM Booking WHERE BookingID = 4;

-- Task Three
SELECT * FROM Passenger WHERE PassengerID = 1;

DELETE FROM Passenger WHERE PassengerID = 1;

/* 
When this command runs, the passenger is successfully deleted AND their bookings 
are also deleted automatically. This happens because we defined the Foreign Key 
in the Booking table with "ON DELETE CASCADE". 
*/