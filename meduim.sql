SELECT F.Flight_number, A1.Name AS Origin, A2.Name AS Destination
FROM Flight F
JOIN Airport A1 ON F.Departure_airportID = A1.AirportID
JOIN Airport A2 ON F.Arrival_airportID = A2.AirportID;

SELECT B.BookingID, P.Full_name, F.Flight_number
FROM Booking B
JOIN Passenger P ON B.PassengerID = P.PassengerID
JOIN Flight F ON B.FlightID = F.FlightID;

SELECT C.Full_name, C.Role
FROM CrewMember C
JOIN FlightCrew FC ON C.CrewID = FC.CrewID
JOIN Flight F ON FC.FlightID = F.FlightID
WHERE F.Flight_number = 'ST101'; 

SELECT F.Flight_number, AC.Model
FROM Flight F
JOIN Aircraft AC ON F.AircraftID = AC.AircraftID
WHERE F.Status = 'Completed';

SELECT P.Full_name, COUNT(B.BookingID) AS TotalBookings
FROM Passenger P
LEFT JOIN Booking B ON P.PassengerID = B.PassengerID
GROUP BY P.Full_name
ORDER BY TotalBookings DESC;

SELECT Class, SUM(Price) AS TotalRevenue
FROM Booking
GROUP BY Class;

SELECT AC.Reg_number, AC.Model, COUNT(F.FlightID) AS FlightCount
FROM Aircraft AC
LEFT JOIN Flight F ON AC.AircraftID = F.AircraftID
GROUP BY AC.Reg_number, AC.Model;

SELECT Flight_number 
FROM Flight F
JOIN Booking B ON F.FlightID = B.FlightID
GROUP BY F.FlightID, F.Flight_number
HAVING COUNT(B.BookingID) > 1;

SELECT P.Full_name, F.Flight_number, A1.Name AS Origin, A2.Name AS Destination, B.Class, B.Price
FROM Booking B
JOIN Passenger P ON B.PassengerID = P.PassengerID
JOIN Flight F ON B.FlightID = F.FlightID
JOIN Airport A1 ON F.Departure_airportID = A1.AirportID
JOIN Airport A2 ON F.Arrival_airportID = A2.AirportID;