SELECT name, country FROM Airline ORDER BY name ASC;
SELECT g.gate_code, g.terminal, a.name AS airport_name FROM Gate g JOIN Airport a ON g.airport_id = a.airport_id;
SELECT tag_number, type, weight_kg FROM Baggage ORDER BY weight_kg DESC;
SELECT f.flight_number, d.reason, d.duration_minutes, d.recorded_at FROM FlightDelayLog d JOIN Flight f ON d.flight_id = f.flight_id ORDER BY d.recorded_at ASC;
SELECT flight_number FROM Flight WHERE gate_id IS NULL;