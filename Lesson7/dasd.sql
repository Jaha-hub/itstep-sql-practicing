SELECT * FROM orders;
SELECT COUNT(*) FROM orders;
SELECT sum(price) FROM orders;
SELECT SUM(quantity) FROM orders WHERE product = 'Product A';
SELECT SUM(quantity) FROM orders WHERE product = 'Product B';
SELECT SUM(quantity) FROM orders WHERE product = 'Product C';
SELECT 
AVG(price * quantity)
FROM orders;
SELECT
customer_id,
SUM(price)
FROM orders
GROUP BY customer_id
ORDER BY SUM(price) ASC;
SELECT 
product,
SUM(quantity)
FROM orders
GROUP BY product;

SELECT
id,
AVG(quantity * price)
FROM orders
GROUP BY id;

SELECT
order_date,
COUNT(quantity)
FROM orders 
GROUP BY order_date;