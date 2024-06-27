-- public.orders definition

-- Drop table

-- DROP TABLE public.orders;

CREATE TABLE public.orders (
	id serial4 NOT NULL,
	user_id int4 NULL,
	amount numeric(10, 2) NULL,
	created_at timestamp NULL,
	CONSTRAINT orders_pkey PRIMARY KEY (id)
);