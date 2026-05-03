INSERT INTO Airport (IATA_code, Name, City, Country) VALUES
('DXB', 'Dubai International', 'Dubai', 'UAE'),
('LHR', 'Heathrow Airport', 'London', 'UK'),
('JFK', 'John F. Kennedy', 'New York', 'USA'),
('HND', 'Haneda Airport', 'Tokyo', 'Japan'),
('CDG', 'Charles de Gaulle', 'Paris', 'France');

INSERT INTO Aircraft (Reg_number, Model, Manufacturer, Capacity, Year_of_manufacture) VALUES
('A6-EEO', 'A380', 'Airbus', 500, 2015),
('N123AF', '747-8', 'Boeing', 410, 2018),
('G-ZBJH', '787 Dreamliner', 'Boeing', 250, 2019),
('JA811A', 'A350', 'Airbus', 300, 2021),
('F-GZCK', 'A330', 'Airbus', 280, 2017);

INSERT INTO Flight (Flight_number, Departure_airportID, Arrival_airportID, AircraftID, Departure_datetime, Arrival_datetime, Status) VALUES
('ST101', 1, 2, 1, '2023-10-01 08:00', '2023-10-01 15:00', 'Completed'),
('ST102', 2, 1, 1, '2023-10-02 10:00', '2023-10-02 17:00', 'Completed'),
('ST201', 3, 4, 2, '2023-10-05 20:00', '2023-10-06 12:00', 'Delayed'),
('ST301', 5, 3, 5, '2023-10-10 09:00', '2023-10-10 16:30', 'Scheduled'),
('ST401', 4, 1, 4, '2023-10-12 14:00', '2023-10-12 23:00', 'Cancelled'),
('ST501', 1, 5, 3, '2023-10-15 01:00', '2023-10-15 07:00', 'Scheduled'),
('ST601', 2, 3, 3, '2023-10-18 22:00', '2023-10-19 06:00', 'Scheduled'),
('ST701', 4, 5, 4, '2023-10-20 11:00', '2023-10-20 19:00', 'Scheduled');

INSERT INTO Passenger (National_ID, Full_name, Email, Phone, Nationality, Date_of_birth) VALUES
('P1001', 'Alice Smith', 'alice@uk.com', '447123', 'British', '1990-05-15'),
('P1002', 'Ahmed Hassan', 'ahmed@uae.ae', '97150', 'Emirati', '1985-02-20'),
('P1003', 'John Doe', 'john@usa.net', '121255', 'American', '1992-11-30'),
('P1004', 'Yuki Tanaka', 'yuki@jp.jp', '81900', 'Japanese', '1995-07-12'),
('P1005', 'Marie Dupont', 'marie@fr.fr', '33612', 'French', '1988-03-05'),
('P1006', 'Hans Muller', 'hans@de.de', '49151', 'German', '1982-09-18'),
('P1007', 'Sofia Rossi', 'sofia@it.it', '39333', 'Italian', '1998-12-01'),
('P1008', 'Li Wei', 'li@cn.cn', '86138', 'Chinese', '1991-06-25');

INSERT INTO Booking (PassengerID, FlightID, Seat_number, Class, Price, Booking_date) VALUES
(1, 1, '12A', 'Economy', 450.00, '2023-09-01'),
(2, 1, '1A', 'First', 2500.00, '2023-09-02'),
(3, 2, '5C', 'Business', 1200.00, '2023-09-05'),
(4, 3, '22F', 'Economy', 600.00, '2023-09-10'),
(5, 4, '2A', 'First', 2800.00, '2023-09-15'),
(6, 6, '15D', 'Economy', 500.00, '2023-09-20'),
(7, 7, '8B', 'Business', 1350.00, '2023-09-22'),
(8, 8, '30A', 'Economy', 480.00, '2023-09-25'),
(1, 6, '14B', 'Economy', 520.00, '2023-09-26'),
(2, 4, '1C', 'First', 3000.00, '2023-09-27');

INSERT INTO CrewMember (Full_name, License_number, Role) VALUES
('Capt. Robert King', 'L-9988', 'Pilot'),
('Mark Sloan', 'L-7766', 'Co-Pilot'),
('Sarah Connor', 'L-5544', 'Flight Attendant'),
('James Bond', 'L-0077', 'Flight Attendant'),
('Bruce Wayne', 'L-1122', 'Engineer'),
('Capt. Linda Sky', 'L-3344', 'Pilot');

INSERT INTO FlightCrew (FlightID, CrewID) VALUES
(1, 1), (1, 3), 
(3, 1), (3, 3),
(4, 6), (4, 4),
(5, 1), (5, 3), 
(6, 6), (6, 4), 
(7, 1), (7, 3), 
(8, 6), (8, 4); 

