-- =========================
-- Sample Data Population
-- =========================

-- Insert Users
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_pw1', '+2348012345678', 'guest'),
('David', 'Smith', 'david.smith@example.com', 'hashed_pw2', '+2348098765432', 'host'),
('Maria', 'Gonzalez', 'maria.g@example.com', 'hashed_pw3', '+2348076543210', 'host'),
('John', 'Doe', 'john.doe@example.com', 'hashed_pw4', '+2348061122334', 'guest');

-- Insert Properties
INSERT INTO properties (host_id, name, description, location, price_per_night)
VALUES
((SELECT user_id FROM users WHERE email='david.smith@example.com'),
 'Cozy Apartment in Lagos',
 'A modern 2-bedroom apartment with sea view and fast WiFi.',
 'Lagos, Nigeria',
 75.00),
((SELECT user_id FROM users WHERE email='maria.g@example.com'),
 'Beachfront Villa',
 'Spacious villa with private pool, perfect for families.',
 'Accra, Ghana',
 200.00);

-- Insert Bookings
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
((SELECT property_id FROM properties WHERE name='Cozy Apartment in Lagos'),
 (SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 '2025-09-10', '2025-09-15', 375.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Beachfront Villa'),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 '2025-09-20', '2025-09-25', 1000.00, 'pending');

-- Insert Payments
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
((SELECT booking_id FROM bookings WHERE total_price=375.00), 375.00, 'credit_card'),
((SELECT booking_id FROM bookings WHERE total_price=1000.00), 500.00, 'paypal'); -- partial payment

-- Insert Reviews
INSERT INTO reviews (property_id, user_id, rating, comment)
VALUES
((SELECT property_id FROM properties WHERE name='Cozy Apartment in Lagos'),
 (SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 5, 'Amazing stay! The apartment was clean and close to everything.'),
((SELECT property_id FROM properties WHERE name='Beachfront Villa'),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 4, 'Great villa, but WiFi could be better.');

-- Insert Messages
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
((SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 (SELECT user_id FROM users WHERE email='david.smith@example.com'),
 'Hello, I just booked your Lagos apartment. Can you confirm check-in details?'),
((SELECT user_id FROM users WHERE email='david.smith@example.com'),
 (SELECT user_id FROM users WHERE email='alice.johnson@example.com'),
 'Hi Alice, thanks for booking! Check-in is after 2 PM, I’ll send more details soon.');
