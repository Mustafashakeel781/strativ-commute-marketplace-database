Database and SQL Learning Notes
Database

A database is used to store, organize and manage data.

Relational Database

A relational database stores data in multiple related tables.

Table

A table stores data in rows and columns.

Primary Key

A primary key uniquely identifies each record in a table.

Example:

user_id INTEGER PRIMARY KEY

Foreign Key

A foreign key creates a relationship between two tables.

Constraints

Constraints are rules used to prevent invalid data.

Common constraints:

PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
Relationships
One-to-One

One record is connected to one related record.

One-to-Many

One record can be connected to multiple records.

Example:

One Provider can create multiple Services.

Many-to-Many

Multiple records from one table can be connected to multiple records from another table.

SELECT

SELECT is used to retrieve data.

Example:

SELECT * FROM users;

WHERE

WHERE is used to filter data.

Example:

SELECT * FROM users WHERE city = 'Karachi';

ORDER BY

ORDER BY is used to sort data.

Example:

SELECT * FROM users ORDER BY name;

COUNT

COUNT is used to count records.

Example:

SELECT COUNT(*) FROM users;

SUM

SUM is used to calculate the total value.

Example:

SELECT SUM(price) FROM services;

AVG

AVG is used to calculate the average value.

Example:

SELECT AVG(price) FROM services;

MIN and MAX

MIN returns the smallest value.

MAX returns the largest value.

GROUP BY

GROUP BY is used to group similar values.

Example:

SELECT city, COUNT(*) FROM users GROUP BY city;

JOIN

JOIN is used to combine related data from multiple tables.

Example:

SELECT users.name, services.title FROM users JOIN services ON users.user_id = services.provider_id;
