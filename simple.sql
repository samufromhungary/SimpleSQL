DROP TABLE IF EXISTS customers cascade;
DROP TABLE IF EXISTS orders cascade;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
	customerId int NOT NULL,
	companyName character varying(30) NOT NULL,
	contactName character varying(30) NOT NULL,
	contactTitle character varying(30) NOT NULL,
	adress character varying(60) NOT NULL,
	city character varying(20) NOT NULL,
	region character varying(20) NOT NULL,
	postalCode int NOT NULL,
	country character varying(20) NOT NULL,
	phone character varying(20),
	fax character varying(20),
	PRIMARY KEY(customerId)
);

CREATE TABLE orders (
	orderId int NOT NULL,
	customerId int,
	emlpoyeeId int NOT NULL,
	oderDate date NOT NULL,
	requiredDate date NOT NULL,
	shippedDate date NOT NULL,
	shipVia int NOT NULL,
	freight real NOT NULL,
	shipName character varying(20) NOT NULL,
	shipAddress character varying(60) NOT NULL,
	shipCity character varying(20) NOT NULL,
	shipRegion character varying(20),
	shipPostalCode character varying(20) NOT NULL,
	shipCountry character varying(20) NOT NULL,
	PRIMARY KEY(orderId),
	FOREIGN KEY(customerId) REFERENCES customers(customerId)
);

CREATE TABLE products (
	productId int NOT NULL,
	productName character varying(60) NOT NULL,
	supplierId int,
	categoryId int,
	quantityPerUnit character varying(20),
	unitPrice real,
	unitsInStock int,
	unitsOnOrder int,
	reorderLevel int,
	discontinued integer NOT NULL,
	PRIMARY KEY(productId)
);

CREATE TABLE order_details (
	orderId int NOT NULL,
	productId int NOT NULL,
	unitPrice real NOT NULL,
	quantity int NOT NULL,
	discount real NOT NULL,
	FOREIGN KEY(orderId) REFERENCES orders(orderId),
	FOREIGN KEY(productId) REFERENCES products(productId)
);


INSERT INTO customers VALUES (1, 'valami', 'valaki', 'ember', 'otthon', 'talán', 'yolo', 6969, 'idk', 0690785578, 0680678876);
INSERT INTO customers VALUES (2, 'semmi', 'senki', 'állat', 'híd alatt', 'néha', 'oloy', 9696, 'idc', 06701337, 1337);

INSERT INTO orders VALUES (11111, 1, 5, '1969-09-08', '1966-09-23', '1991-01-10', 5, 69.696969, 'tényleg idk', 'sumthin', 'oof', NULL, '1337', 'kukutyin');
INSERT INTO orders VALUES (22222, 2, 6, '1999-09-10', '1999-11-08', '1998-10-22', 1, 11.111111, 'soklesz', 'apu', 'veddmeg', NULL, '7331', 'nem kukutyin');

INSERT INTO products VALUES (1, 'soha', 30, 3, '1 liter', 15, 16, 0, 1, 2);
INSERT INTO products VALUES (2, 'mindig', 40, 4, '2 kilo', 17, 18, 1, 3, 4);

INSERT INTO order_details VALUES (11111, 1, 21.21312, 40, 0.00001);
INSERT INTO order_details VALUES (22222, 2, 32.321321, 80, 0.001);