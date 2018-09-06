CREATE TABLE CUSTOMERS (
	Customer_ID BIGINT PRIMARY KEY,
	First_Name VARCHAR(20) NOT NULL,
	Last_Name VARCHAR(30) NOT NULL,
	Home_Street VARCHAR(30),
	Home_City VARCHAR(20),
	Home_State CHAR(2),
	Home_Zip CHAR(5),
	Phone_Number CHAR(11) NOT NULL
)

CREATE TABLE PRODUCTS (
	Product_Code INT PRIMARY KEY,
	Price FLOAT NOT NULL,
	Type VARCHAR(30),
	Manufacturer VARCHAR(30)
)

CREATE TABLE SHOPS (
	Shop_No SMALLINT PRIMARY KEY,
	Address VARCHAR(75),
	Name VARCHAR(20)
)

CREATE TABLE VENDORS (
	Staff_No SMALLINT PRIMARY KEY,
	Name VARCHAR(30)
)

CREATE TABLE STOCK (
	Product_Code INT FOREIGN KEY REFERENCES PRODUCTS(Product_Code),
	Shop_No SMALLINT FOREIGN KEY REFERENCES SHOPS(Shop_No),
	Quantity INT NOT NULL,
	PRIMARY KEY (Product_Code,Shop_No)
)

CREATE TABLE SALES (
	Sales_No SMALLINT PRIMARY KEY,
	Customer_ID BIGINT FOREIGN KEY REFERENCES CUSTOMERS(Customer_ID),
	Shop_No SMALLINT FOREIGN KEY REFERENCES SHOPS(Shop_No),
	Staff_No SMALLINT FOREIGN KEY REFERENCES VENDORS(Staff_No),
	Date TIMESTAMP,
	Sum_total FLOAT
)

CREATE TABLE SALES_DETAILS (
	Product_Code INT FOREIGN KEY REFERENCES PRODUCTS(Product_Code),
	Sales_No SMALLINT FOREIGN KEY REFERENCES SALES(Sales_No),
	Quantity INT NOT NULL,
	PRIMARY KEY (Product_Code,Sales_No)
)

INSERT INTO CUSTOMERS
VALUES ('00000000001', 'Michael', 'Scott', '1725 Slough Avenue', 'Scranton', 'PA', '18505', '1234567891'),
('00000000002', 'Blair', 'Waldorf', '100 5th Ave', 'New York', 'NY', '10001', '1011121314'),
('00000000003', 'VooDoo', 'Mama Juju', '246 Donuts Lane', 'Portland', 'OR', '97035', '1512382920'),
('00000000004', 'Seth', 'Cohen', '800 Laguna Hills', 'Malibu', 'CA', '90263', '5556667777'),
('00000000005', 'Lester', 'Patel', '123 Buy More', 'Echo Park', 'CA', '90026', '9876543210')

INSERT INTO PRODUCTS
VALUES ('00001', '115.00', 'Liquid Collagen', 'Algenist'),
('00002', '158.00', 'Lactic Acid Treatment', 'Sunday Riley'),
('00003', '38.00', 'Soy Face Cleanser', 'Fresh'),
('00004', '68.00', 'The Water Cream', 'Tatcha'),
('00005', '59.00', 'Charcoal Treatment', 'Glamglow')

INSERT INTO SHOPS
VALUES ('0001', '112 W 34th Street', '34th Street Location'), 
('0002', '45 E. 17th Street', 'Union Square Location'),
('0003', '580 5th Ave', '5th Avenue Location'),
('0004', '750 Lexington Ave', '60th and Lex Location'),
('0005', '1500 Broadway', 'Times Square Location')

INSERT INTO VENDORS
VALUES ('1234', 'Jeff Barnes'),
('5678', 'Morgan Grimes'),
('8765', 'Emmett Milbarge'),
('9090', 'Big Mike Tucker'),
('1010', 'John Casey')

INSERT INTO STOCK
VALUES ('00001', '0005', '452'),
('00002', '0005', '102'),
('00003', '0001', '86'),
('00004', '0002', '905'),
('00005', '0003', '117')

INSERT INTO SALES
VALUES ('1111', '00000000003', '0001', '1010', DEFAULT, '154.00'),
('2222', '00000000003', '0002', '9090', DEFAULT, '999.00'),
('3333', '00000000002', '0001', '8765', DEFAULT, '49.00'),
('4444', '00000000005', '0005', '5678', DEFAULT, '169.87'),
('5555', '00000000001', '0003', '1234', DEFAULT, '210.05')

INSERT INTO SALES_DETAILS
VALUES ('00001', '1111', '56'),
('00002', '2222', '12'),
('00003', '3333', '23'),
('00004', '4444', '4'),
('00005', '5555', '43');
