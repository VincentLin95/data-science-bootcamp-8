https://replit.com/@SakonSukkhapany/bootcampbatch08sqlrestaurant#main.sql

--create table & insert table
.mode column
CREATE TABLE menu(menu_no INT,
  name NVARCHAR(20),
  price REAL);

INSERT INTO menu VALUES
(1, 'Tteok-bokki', 180),
(2, 'Ramyeon', 150),
(3, 'Kimchi-jjigae', 170),
(4, 'Bibimbap', 150),
(5, 'Naengmyeon', 160),
(6, 'Yangnyeom chicken', 200),
(7, 'Dakgalbi', 250),
(8, 'Bulgogi', 300),
(9, 'Japchae', 160),
(10, 'Bingsu', 60);

CREATE TABLE customers(customer_id NVARCHAR(3),
  customer_firstname NVARCHAR(20),
  customer_lastname NVARCHAR(20),
  phone_number INT,
  membership TEXT);

INSERT INTO customers VALUES
('FK1', 'Felix', 'Kim', 0826517, 'Annual'),
('SP2', 'Susie', 'Park', 0145779, 'Normal'),
('WS3', 'Wendy', 'Son', 0564564, 'Annual'),
('HL4', 'Harvey', 'Lee', 0369755, 'Normal'),
('ZK5', 'Zara', 'Kang', 0298146, 'Normal');

CREATE TABLE orders(order_no INT,
  menu_no INT,
  customer_id NVARCHAR(3),
  employee_id NVARCHAR(10),
  tables INT);

INSERT INTO orders VALUES
(1, 1, 'FK1', 'W.Paul', 2),
(1, 6, 'FK1', 'W.Paul', 2),
(1, 9, 'FK1', 'W.Paul', 2),
(2, 8, 'WS3', 'M.Edward', 3),
(2, 10, 'WS3', 'M.Edward', 3),
(3, 2, 'ZK5', 'W.Alice', 4),
(3, 4, 'ZK5', 'W.Alice', 4),
(3, 1, 'ZK5', 'W.Alice', 4),
(3, 10, 'ZK5', 'W.Alice', 4),
(4, 3, 'HL4', 'W.Paul', 5),
(4, 5, 'HL4', 'W.Paul', 5),
(5, 7, 'SP2', 'W.Alice', 1),
(5, 2, 'SP2', 'W.Alice', 1),
(5, 10, 'SP2', 'W.Alice', 1);

CREATE TABLE employees(employee_id NVARCHAR(10),
  employee_firstname NVARCHAR(20),
  employee_lastname NVARCHAR(20),
  position TEXT);

INSERT INTO employees VALUES
('W.Paul', 'Paul', 'Ku', 'waiter'),
('W.Alice', 'Alice', 'Pan', 'waitress'),
('M.Edward', 'Edward', 'Lee', 'manager');

CREATE TABLE reservation(tables INT,
  status TEXT,
  customer_id NVARCHAR(3));

INSERT INTO reservation VALUES
(1, 'YES', 'SP2'),
(2, 'NO', 'NULL'),
(3, 'YES', 'WS3'),
(4, 'YES', 'ZK5'),
(5, 'NO', 'NULL');

--display all tables
SELECT * FROM menu;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
SELECT * FROM reservation;

--join table
SELECT 
  menu.menu_no,
  menu.name,
  orders.customer_id
FROM menu
JOIN orders ON menu.menu_no = orders.menu_no
ORDER BY customer_id;

--aggregate function
--sorted by top spenders from receipt
SELECT
	orders.customer_id,
	COUNT(orders.customer_id) AS total_order,
	ROUND(AVG(menu.price), 2),
	SUM(menu.price),
	MIN(menu.price),
	MAX(menu.price)
FROM menu
JOIN orders on menu.menu_no = orders.menu_no
GROUP BY order_no
ORDER BY SUM(menu.price) DESC;

--JOIN TABLE
--assumed that this query is customers' receipts
SELECT
	orders.order_no,
	orders.tables,
	customers.customer_id,
	customers.customer_lastname,
	menu.name,
	menu.price,
	employees.employee_id
FROM orders
JOIN menu
	ON orders.menu_no = menu.menu_no
JOIN customers
	ON orders.customer_id = customers.customer_id
JOIN reservation
	ON orders.tables = reservation.tables
JOIN employees
	ON orders.employee_id = employees.employee_id
ORDER BY orders.order_no;

--subquery
--1. normal subquery (discount coupon lucky draw from membership)
SELECT * FROM
	(
	SELECT
	customer_firstname,
	customer_lastname,
	membership
	FROM
		(
		SELECT * FROM customers
		)
	)
WHERE membership = 'Annual';
--2. common table expression (discount coupon lucky draw for normal customer from picking randomly, 1 order = 1 attempt)
WITH lucky_draw AS(
SELECT * FROM customers
	WHERE customer_firstname LIKE 'H%'
), randomreciept AS(
SELECT * FROM orders
	WHERE employee_id = 'W.Paul'
)

SELECT
	lucky_draw.phone_number,
	lucky_draw.customer_firstname,
	lucky_draw.customer_lastname,
	randomreciept.menu_no,
	randomreciept.customer_id
FROM lucky_draw
JOIN randomreciept
ON lucky_draw.customer_id = randomreciept.customer_id;
