use flight

CREATE TABLE Airport (
    IATA_code INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

CREATE TABLE Aircraft (
    reg_number VARCHAR(255) PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    manufacturer VARCHAR(255) NOT NULL,
    year_of_manufacture INT NOT NULL,
    capacity INT NOT NULL
)

CREATE TABLE Flight (
    flight_number VARCHAR(255) PRIMARY KEY,
    departure_airport INT NOT NULL,
    arrival_airport INT NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    aircraft_reg_number VARCHAR(255) NOT NULL,
    FOREIGN KEY (departure_airport) REFERENCES Airport(IATA_code),
    FOREIGN KEY (arrival_airport) REFERENCES Airport(IATA_code),
    FOREIGN KEY (aircraft_reg_number) REFERENCES Aircraft(reg_number)
);

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    flight_number VARCHAR(255) NOT NULL,
    passenger_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    booking_date DATETIME NOT NULL,
    FOREIGN KEY (flight_number) REFERENCES Flight(flight_number),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

CREATE TABLE Crew (
    crew_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);

CREATE TABLE Flight_Crew (
    flight_number VARCHAR(255) NOT NULL,
    crew_id INT NOT NULL,
    PRIMARY KEY (flight_number, crew_id),
    FOREIGN KEY (flight_number) REFERENCES Flight(flight_number),
    FOREIGN KEY (crew_id) REFERENCES Crew(crew_id)
);