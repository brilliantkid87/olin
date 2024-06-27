-- account.users definition

-- Drop table

-- DROP TABLE account.users;

CREATE TABLE account.users (
	id int4 NOT NULL,
	"name" varchar(255) NULL,
	email varchar(255) NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

-- after create table, insert this data
INSERT INTO account.users (id, name, email) VALUES 
(1, 'John Doe', 'johndoe@example.com'), 
(2, 'Jane Smith', 'janesmith@example.com'), 
(3, 'Bob Johnson', 'bobjohnson@example.com');