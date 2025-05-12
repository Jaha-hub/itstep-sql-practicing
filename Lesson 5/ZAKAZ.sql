INSERT INTO users(fname,lname,password,user_name)
VALUES
	('Rashid', 'Galiyev','1234','rashid'),
	('Yusuf','Ronaldo','127','cristiano'),
	('Malika','Raximberdiyeva','111','pashtet')
SELECT * FROM users;
INSERT INTO profiles(user_id)
VALUES (1),(2),(3)

INSERT INTO categories(name)
VALUES('фрукты') , ('Овощи'), ('Напитки')

SELECT * FROM categories;

INSERT INTO products(name,price, category_id)
VALUES
	('Banana' , 1000, 1),
	('Aplle', 990, 1),
	('Pineapple', 1500,1);
SELECT * FROM products WHERE category_id = 2;
-- OVOSHI
INSERT INTO products(name,price, category_id)
VALUES
	('Огурец' , 10000, 2),
	('Помидор', 9900, 2),
	('Мокровь', 5000,2);
-- Napitki
INSERT INTO products(name,price, category_id)
VALUES
	('Banana' , 1000, 1),
	('Aplle', 990, 1),
	('Pineapple', 1500,1);
INSERT INTO products(name,price, category_id)
VALUES
	('Милкшейк' , 1000, 3),
	('Спрайт', 990, 3),
	('Латте', 1500,3);
INSERT INTO orders(users_id)
VALUES (1), (1), (3), (3), (3);
SELECT * FROM orders;
SELECT * FROM order_products;
INSERT INTO order_products(product_id,order_id, quantity)
VALUES 
--	(1,1,5),
	(2,1,3)


SELECT
*
FROM orders;
SELECT * FROM users;
DELETE FROM users WHERE id = 2;

DELETE FROM products WHERE category_id = 3;