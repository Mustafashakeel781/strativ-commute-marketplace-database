CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(100) NOT NULL
);

CREATE TABLE providers (
    provider_id INTEGER PRIMARY KEY,
    user_id INTEGER UNIQUE NOT NULL,
    provider_name VARCHAR(150) NOT NULL,
    vehicle_type VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE services (
    service_id INTEGER PRIMARY KEY,
    provider_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description VARCHAR(500),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    available_seats INTEGER NOT NULL CHECK (available_seats >= 0),
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('active', 'inactive')),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

CREATE TABLE routes (
    route_id INTEGER PRIMARY KEY,
    service_id INTEGER UNIQUE NOT NULL,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    departure_time VARCHAR(20) NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE seat_requests (
    request_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    requested_seats INTEGER NOT NULL CHECK (requested_seats > 0),
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('pending', 'accepted', 'rejected')),
    request_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE bookings (
    booking_id INTEGER PRIMARY KEY,
    request_id INTEGER UNIQUE NOT NULL,
    user_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    booking_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('confirmed', 'cancelled')),
    FOREIGN KEY (request_id) REFERENCES seat_requests(request_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE reviews (
    review_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(500),
    review_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);
