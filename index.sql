CREATE INDEX idx_services_provider_id
ON services(provider_id);
-- Recommended index:
-- provider_id is frequently used to connect providers with services.
-- This index can improve lookup and join performance as the services table grows.
