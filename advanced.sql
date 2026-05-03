SELECT F.Flight_number, A1.Name AS Origin, A2.Name AS Destination, AC.Model, COUNT(B.BookingID) AS PassengerCount
FROM Flight F
JOIN Airport A1 ON F.Departure_airportID = A1.AirportID
JOIN Airport A2 ON F.Arrival_airportID = A2.AirportID
JOIN Aircraft AC ON F.AircraftID = AC.AircraftID
LEFT JOIN Booking B ON F.FlightID = B.FlightID
GROUP BY F.FlightID, F.Flight_number, A1.Name, A2.Name, AC.Model;

SELECT Full_name FROM Passenger
WHERE PassengerID NOT IN (SELECT PassengerID FROM Booking);

SELECT F.Flight_number, SUM(B.Price) AS TotalRevenue
FROM Flight F
JOIN Booking B ON F.FlightID = B.FlightID
GROUP BY F.FlightID, F.Flight_number
HAVING SUM(B.Price) > 500
ORDER BY TotalRevenue DESC;

SELECT C.Full_name, COUNT(FC.FlightID) AS FlightCount
FROM CrewMember C
JOIN FlightCrew FC ON C.CrewID = FC.CrewID
GROUP BY C.CrewID, C.Full_name
HAVING COUNT(FC.FlightID) > 1;

SELECT F.Flight_number, AVG(B.Price) AS AvgPrice
FROM Flight F
JOIN Booking B ON F.FlightID = B.FlightID
GROUP BY F.FlightID, F.Flight_number
HAVING AVG(B.Price) > (SELECT AVG(Price) FROM Booking);

SELECT TOP 1 F.Flight_number, A1.Name AS Origin, A2.Name AS Destination, COUNT(B.BookingID) AS TotalBookings
FROM Flight F
JOIN Airport A1 ON F.Departure_airportID = A1.AirportID
JOIN Airport A2 ON F.Arrival_airportID = A2.AirportID
JOIN Booking B ON F.FlightID = B.FlightID
GROUP BY F.FlightID, F.Flight_number, A1.Name, A2.Name
ORDER BY TotalBookings DESC;

SELECT Class, SUM(Price) AS TotalRevenue, COUNT(*) AS BookingCount, 
       AVG(Price) AS AvgPrice, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM Booking
GROUP BY Class;

SELECT P.Full_name, F.Flight_number, B.Booking_date
FROM Booking B
JOIN Passenger P ON B.PassengerID = P.PassengerID
JOIN Flight F ON B.FlightID = F.FlightID
WHERE F.Status = 'Cancelled';

SELECT F.Flight_number, COUNT(FC.CrewID) AS TotalCrew, F.Departure_datetime
FROM Flight F
JOIN FlightCrew FC ON F.FlightID = FC.FlightID
JOIN CrewMember C ON FC.CrewID = C.CrewID
WHERE F.FlightID IN (SELECT FlightID FROM FlightCrew FC2 JOIN CrewMember C2 ON FC2.CrewID = C2.CrewID WHERE C2.Role = 'Pilot')
  AND F.FlightID IN (SELECT FlightID FROM FlightCrew FC3 JOIN CrewMember C3 ON FC3.CrewID = C3.CrewID WHERE C3.Role = 'Flight Attendant')
GROUP BY F.FlightID, F.Flight_number, F.Departure_datetime;

SELECT F.Flight_number, A1.City AS OriginCity, A2.City AS DestCity, 
       AC.Model, AC.Manufacturer, 
       COUNT(DISTINCT B.BookingID) AS TotalPassengers, 
       COUNT(DISTINCT FC.CrewID) AS TotalCrew, 
       SUM(ISNULL(B.Price, 0)) AS TotalRevenue
FROM Flight F
JOIN Airport A1 ON F.Departure_airportID = A1.AirportID
JOIN Airport A2 ON F.Arrival_airportID = A2.AirportID
JOIN Aircraft AC ON F.AircraftID = AC.AircraftID
LEFT JOIN Booking B ON F.FlightID = B.FlightID
LEFT JOIN FlightCrew FC ON F.FlightID = FC.FlightID
GROUP BY F.FlightID, F.Flight_number, A1.City, A2.City, AC.Model, AC.Manufacturer
ORDER BY TotalRevenue DESC;