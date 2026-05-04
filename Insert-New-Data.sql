INSERT INTO Airline (iata_code, name, country, contact_email) VALUES
('WY', 'Oman Air', 'Oman', 'contact@omanair.com'),
('EK', 'Emirates', 'United Arab Emirates', 'info@emirates.com'),
('QR', 'Qatar Airways', 'Qatar', 'support@qatarairways.com'),
('BA', 'British Airways', 'United Kingdom', 'help@ba.com');

INSERT INTO Gate (gate_code, terminal, airport_id) VALUES
('A1', 'Terminal 1', 1), ('A2', 'Terminal 1', 1), ('B1', 'Terminal 2', 1),
('C1', 'Main', 2), ('C2', 'Main', 2),
('D1', 'Terminal 3', 3), ('D2', 'Terminal 3', 3), ('E1', 'Terminal 4', 3);

UPDATE Flight SET airline_id = 1, gate_id = 1 WHERE flight_id = 1;
UPDATE Flight SET airline_id = 1, gate_id = 2 WHERE flight_id = 2;
UPDATE Flight SET airline_id = 2, gate_id = 4 WHERE flight_id = 3;
UPDATE Flight SET airline_id = 3, gate_id = 6 WHERE flight_id = 4;
UPDATE Flight SET airline_id = 4, gate_id = 8 WHERE flight_id = 5;
UPDATE Flight SET airline_id = 1, gate_id = NULL WHERE flight_id = 6;

ALTER TABLE Flight ALTER COLUMN airline_id INT NOT NULL;

INSERT INTO Baggage (tag_number, weight_kg, type, booking_id) VALUES
('TAG-001', 7.5, 'Cabin', 1), ('TAG-002', 23.0, 'Checked', 1),
('TAG-003', 20.5, 'Checked', 2), ('TAG-004', 8.0, 'Cabin', 3),
('TAG-005', 25.0, 'Checked', 4), ('TAG-006', 30.0, 'Checked', 4),
('TAG-007', 6.0, 'Cabin', 5), ('TAG-008', 22.0, 'Checked', 6),
('TAG-009', 15.0, 'Checked', 7), ('TAG-010', 8.5, 'Cabin', 8);

INSERT INTO FlightDelayLog (reason, duration_minutes, recorded_at, flight_id) VALUES
('Weather conditions', 45, '2026-05-01 10:00:00', 1),
('Technical issue', 120, '2026-05-02 14:30:00', 3),
('Crew availability', 30, '2026-05-03 09:15:00', 5),
('Air traffic control congestion', 60, '2026-05-03 10:45:00', 5);