# Database Normalization Notes

## First Normal Form (1NF)

The database tables use atomic values.
Each column stores a single value and repeating groups are avoided.

## Second Normal Form (2NF)

The tables use primary keys to identify records.
Non-key attributes depend on the appropriate primary key of their table.

## Third Normal Form (3NF)

Non-key attributes are kept in the table where they logically belong.
For example, provider information is stored in the providers table instead of being repeated in every service record.

## Benefits

Normalization helps reduce duplicate data, improve consistency and make the database easier to maintain.
