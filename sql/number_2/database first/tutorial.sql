CREATE DATABASE first; 

CREATE SERVER second_db_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (dbname 'second');

DROP FOREIGN TABLE IF EXISTS orders;

CREATE FOREIGN TABLE orders (
    id INT,
    user_id INT,
    amount NUMERIC(10,2),
    created_at TIMESTAMP
)

SERVER second_db_server
OPTIONS (schema_name 'public', table_name 'orders');

CREATE USER MAPPING FOR postgres
    SERVER second_db_server
    OPTIONS (user 'postgres', password 'root');