CREATE TABLE customers(
	customer_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	email VARCHAR(100) UNIQUE
);
CREATE TABLE orders(
	order_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	customer_id INT,
	order_date DATE
);
CREATE TABLE order_items(
	order_item_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	order_id INT,
	product_name VARCHAR(100),
	quantity INT,
	price NUMERIC(10,2)
);
INSERT INTO customers(name,email)
VALUES
('Jahangir','Jaha-hub'),
('Timur','Гитлер в стрингах'),
('Akbar','Akbarsa228');
INSERT INTO orders(customer_id,order_date)
VALUES 
('1','2025-05-25'),
('2','2026-05-25'),
('3','2027-5-25');
SELECT * FROM customers;
INSERT INTO order_items(order_id,product_name,quantity,price)
VALUES
-- ('1','CUCUMBER','34682','11.2'),
('1','BANANA','24231','54.99');
-- ('3','PS5','12','599.99');
SELECT * FROM order_items;
DROP TABLE order_items;
SELECT * FROM orders;
DROP TABLE orders;
UPDATE customers SET email = 'Hassanov' WHERE customer_id = 3;
DELETE FROM customers WHERE customer_id = 2;
SELECT 
customers.name, 
orders.order_date, 
order_items.product_name 
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id 
INNER JOIN order_items ON orders.order_id = order_items.order_id;
SELECT (price * quantity) FROM order_items;
SELECT * FROM order_items WHERE quantity = 34682;
SELECT AVG(price * 3) FROM order_items WHERE order_item_id = 2;
