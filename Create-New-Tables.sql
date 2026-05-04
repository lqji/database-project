CREATE TABLE Airline (
    airline_id INT IDENTITY(1,1) PRIMARY KEY,
    iata_code VARCHAR(3) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Gate (
    gate_id INT IDENTITY(1,1) PRIMARY KEY,
    gate_code VARCHAR(10) NOT NULL,
    terminal VARCHAR(50) NOT NULL,
    airport_id INT NOT NULL,
    CONSTRAINT FK_Gate_Airport FOREIGN KEY (airport_id) REFERENCES Airport(airport_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT UQ_Gate_Airport UNIQUE (gate_code, airport_id)
);

CREATE TABLE Baggage (
    baggage_id INT IDENTITY(1,1) PRIMARY KEY,
    tag_number VARCHAR(50) NOT NULL UNIQUE,
    weight_kg DECIMAL(5,2) NOT NULL CHECK (weight_kg > 0),
    type VARCHAR(20) NOT NULL CHECK (type IN ('Cabin', 'Checked')),
    booking_id INT NOT NULL,
    CONSTRAINT FK_Baggage_Booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FlightDelayLog (
    delay_id INT IDENTITY(1,1) PRIMARY KEY,
    reason VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL CHECK (duration_minutes > 0),
    recorded_at DATETIME NOT NULL,
    flight_id INT NOT NULL,
    CONSTRAINT FK_Delay_Flight FOREIGN KEY (flight_id) REFERENCES Flight(flight_id) ON DELETE CASCADE ON UPDATE CASCADE
);