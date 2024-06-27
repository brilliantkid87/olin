-- account.order_items definition

-- Drop table

-- DROP TABLE account.order_items;

CREATE TABLE account.order_items (
	id int4 NOT NULL,
	order_id int4 NULL,
	product_name varchar(255) NULL,
	price numeric(10, 2) NULL,
	quantity int4 NULL,
	CONSTRAINT order_items_pkey PRIMARY KEY (id)
);

-- after create table, insert this data
INSERT INTO account.order_items (id, order_id, product_name, price, quantity) VALUES 
(1, 1, 'T-Shirt', 25.00, 2), 
(2, 1, 'Jeans', 50.00, 1), 
(3, 2, 'Socks', 10.00, 5), 
(4, 3, 'Shoes', 75.00, 2), 
(5, 4, 'Jacket', 100.00, 1), 
(6, 5, 'Sweater', 25.00, 3);