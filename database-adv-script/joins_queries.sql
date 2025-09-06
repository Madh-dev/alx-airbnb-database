-- INNER JOIN: Get all bookings with their respective users
SELECT 
    b.booking_id,
    u.first_name,
    u.last_name,
    b.start_date,
    b.end_date,
    b.total_price
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- LEFT JOIN: Get all properties and their reviews (including properties with no reviews)
SELECT 
    p.property_id,
    p.name,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY  p.property_id, r.review_id;

-- FULL OUTER JOIN: Get all users and all bookings (even if user has no booking or booking has no user)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;

