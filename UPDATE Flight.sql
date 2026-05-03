UPDATE Flight 
SET Status = 'Completed' 
WHERE Flight_number = 'ST301';

UPDATE Flight 
SET Status = 'Cancelled' 
WHERE Flight_number = 'ST201';

UPDATE Booking 
SET Price = Price * 1.10 
WHERE Class = 'Economy';

UPDATE Passenger 
SET Phone = '999-000-111' 
WHERE National_ID = 'P1001';

UPDATE CrewMember 
SET Role = 'Pilot' 
WHERE License_number = 'L-7766';