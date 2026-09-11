-- Query 1: for All Users
SELECT *
FROM users;

-- Query 2: for Karachi Users
SELECT *
FROM users
WHERE city = 'Karachi';

-- Query 3: for Active Services
SELECT *
FROM services
WHERE status = 'active';

-- Query 4: for Services with Provider Names
SELECT
    p.provider_name,
    s.title,
    s.price
FROM providers p
JOIN services s
    ON p.provider_id = s.provider_id;

-- Query 5:Services with Route Information
SELECT
    s.title,
    r.origin,
    r.destination,
    r.departure_time
FROM services s
JOIN routes r
    ON s.service_id = r.service_id;
-- Query 6:  Services from Karachi
SELECT
    s.title,
    r.origin,
    r.destination,
    s.price
FROM services s
JOIN routes r
    ON s.service_id = r.service_id
WHERE r.origin = 'Karachi';

-- Query 7:Most Expensive Service
SELECT *
FROM services
WHERE price = (
    SELECT MAX(price)
    FROM services
);

-- Query 8:Average Service Price
SELECT AVG(price) AS average_price
FROM services;

-- Query 9:Total Number of Services
SELECT COUNT(*) AS total_services
FROM services;

-- Query 10:Services per Provider
SELECT
    provider_id,
    COUNT(*) AS service_count
FROM services
GROUP BY provider_id;

-- Query 11:Providers with More Than One Service
SELECT
    provider_id,
    COUNT(*) AS service_count
FROM services
GROUP BY provider_id
HAVING COUNT(*) > 1;

-- Query 12: Pending Seat Requests
SELECT *
FROM seat_requests
WHERE status = 'pending';
-- Query 13: Seat Requests with User  Names
SELECT
    u.name,
    sr.request_id,
    sr.requested_seats,
    sr.status
FROM users u
JOIN seat_requests sr
    ON u.user_id = sr.user_id;
-- Query 14: Confirmed Bookings
SELECT
    b.booking_id,
    u.name,
    s.title,
    b.booking_date
FROM bookings b
JOIN users u
    ON b.user_id = u.user_id
JOIN services s
    ON b.service_id = s.service_id
WHERE b.status = 'confirmed';

-- Query 15:
SELECT
    service_id,
    AVG(rating) AS average_rating,
    COUNT(*) AS review_count
FROM reviews
GROUP BY service_id;
