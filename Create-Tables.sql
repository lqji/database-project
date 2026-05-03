USE flight;
CREATE TABLE Airport (
    AirportID INT IDENTITY(1,1) PRIMARY KEY,
    IATA_code VARCHAR(10) UNIQUE NOT NULL,
    Name VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL
);

CREATE TABLE Aircraft (
    AircraftID INT IDENTITY(1,1) PRIMARY KEY,
    Reg_number VARCHAR(50) UNIQUE NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Manufacturer VARCHAR(255) NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity > 0),
    Year_of_manufacture INT NOT NULL
);

CREATE TABLE Flight (
    FlightID INT IDENTITY(1,1) PRIMARY KEY,
    Flight_number VARCHAR(50) UNIQUE NOT NULL,
    Departure_airportID INT NOT NULL,
    Arrival_airportID INT NOT NULL,
    AircraftID INT NOT NULL,
    Departure_datetime DATETIME NOT NULL,
    Arrival_datetime DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',
    CONSTRAINT CK_Flight_Time CHECK (Arrival_datetime > Departure_datetime),
    CONSTRAINT CK_Flight_Status CHECK (Status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
    FOREIGN KEY (Departure_airportID) REFERENCES Airport(AirportID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (Arrival_airportID) REFERENCES Airport(AirportID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Passenger (
    PassengerID INT IDENTITY(1,1) PRIMARY KEY,
    National_ID VARCHAR(50) UNIQUE NOT NULL,
    Full_name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(50),
    Nationality VARCHAR(100) NOT NULL,
    Date_of_birth DATE NOT NULL
);

CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    Seat_number VARCHAR(10) NOT NULL,
    Class VARCHAR(20) NOT NULL CHECK (Class IN ('Economy', 'Business', 'First')),
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    Booking_date DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CrewMember (
    CrewID INT IDENTITY(1,1) PRIMARY KEY,
    Full_name VARCHAR(255) NOT NULL,
    License_number VARCHAR(50) UNIQUE NOT NULL,
    Role VARCHAR(50) NOT NULL CHECK (Role IN ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer'))
);

CREATE TABLE FlightCrew (
    FlightID INT NOT NULL,
    CrewID INT NOT NULL,
    PRIMARY KEY (FlightID, CrewID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CrewID) REFERENCES CrewMember(CrewID) ON DELETE CASCADE ON UPDATE CASCADE
);