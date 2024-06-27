-- account.orders definition

-- Drop table

-- DROP TABLE account.orders;

CREATE TABLE account.orders (
	id int4 NOT NULL,
	user_id int4 NULL,
	amount numeric(10, 2) NULL,
	created_at timestamp NULL,
	CONSTRAINT orders_pkey PRIMARY KEY (id)
);

-- after create table, insert this data
INSERT INTO account.orders (id, user_id, amount, created_at) VALUES 
(1, 1, 100.00, '2022-01-02 10:30:00'), 
(2, 2, 50.00, '2022-01-03 09:00:00'), 
(3, 1, 150.00, '2022-01-04 14:15:00'), 
(4, 3, 200.00, '2022-01-05 17:45:00'), 
(5, 2, 75.00, '2022-01-06 11:20:00');