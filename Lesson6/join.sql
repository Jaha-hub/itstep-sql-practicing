SELECT * FROM users;
SELECT * FROM profiles;

SELECT 
u.first_name || ' ' || u.last_name AS fullname,
u.username AS Username,
u.id AS "ID",
p.bio AS "DIO",
p.avatar AS "PHOTO",
p.is_verified AS "Verified"
FROM users u
INNER JOIN profiles p
ON u.id = p.user_id

SELECT * FROM categories;
SELECT * FROM products;

SELECT 
p.name AS "Продукт",
p.price AS "Цена продукта",
p.description AS "Описание"

FROM products p
INNER JOIN categories c
ON p.category_id = c.id;


SELECT 
o.id AS "айди заказа",
p.name AS "Название продукта",
op.quantity AS "Кол-во",
u.first_name || '' || u.last_name AS "ФИО"
FROM orders o
INNER JOIN order_products op ON o.id = op.order_id
INNER JOIN products p ON op.product_id = p.id
INNER JOIN users u ON o.user_id = u.id;

