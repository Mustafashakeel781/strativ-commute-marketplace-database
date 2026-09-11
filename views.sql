CREATE VIEW active_services AS
SELECT
    s.service_id,
    p.provider_name,
    s.title,
    s.price,
    s.available_seats
FROM services s
JOIN providers p
    ON s.provider_id = p.provider_id
WHERE s.status = 'active';


CREATE VIEW provider_service_summary AS
SELECT
    p.provider_id,
    p.provider_name,
    COUNT(s.service_id) AS total_services,
    AVG(s.price) AS average_price
FROM providers p
LEFT JOIN services s
    ON p.provider_id = s.provider_id
GROUP BY
    p.provider_id,
    p.provider_name;
