-- Фильтр
SELECT
*
FROM posts
WHERE user_id in (4);
-- Поиск
SELECT
*
FROM users
WHERE fname LIKE '%Акба%';
-- Сортировка
SELECT
*
FROM posts
ORDER BY content DESC; --ASC
-- Фильтр и Сортировка
SELECT
*
FROM users
WHERE id in (1,3)
ORDER BY birth_date ASC;
-- Обьединение двух таблиц
SELECT
p.id AS "ИД",
p.content AS "Контент" ,
p.created_at AS "Дата создания",
p.user_id  AS "ИД пользователя",
u.fname || ' ' || u.lname AS "ФИО",
u.username AS "ИМЯ пользователя"
FROM posts p
INNER JOIN users u ON u.id = p.user_id
WHERE p.user_id in (2) AND p.id > 2 
ORDER BY p.created_at ASC;