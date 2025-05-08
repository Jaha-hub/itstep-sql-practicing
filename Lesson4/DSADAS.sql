CREATE TABLE IF NOT EXISTS users (
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, -- Автоматически будет генерить айди
	fname VARCHAR(255) NOT NULL,
	lname VARCHAR(255) NOT NULL,
	username VARCHAR(512) UNIQUE NOT NULL, -- Нужно давать уникальное значение 
	birth_date DATE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- TIMESTAMP тот же самый DATETIME
);
CREATE TABLE IF NOT EXISTS posts(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	content VARCHAR(2048) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	user_id BIGINT REFERENCES users(id)
); 
SELECT * FROM users;
SELECT * FROM posts;
-- Добавляем лишь одну запись
INSERT INTO users(fname,lname,username,birth_date) 
VALUES('Жахангир','Нуратдинов','jahangir_it46','2009-10-06');

-- сразу несколько записей
INSERT INTO users(fname,lname,username,birth_date)
VALUES
('das','sas','sds','2001-11-01'),
('ken','takakuro','katakuri','1939-06-19');
UPDATE WHERE id = 17 FROM posts 
INSERT INTO posts(content, user_id)
VALUES
('REAL MARDIR', 2),
('ARSEN 3 - 0 REAL', 2),
('FUCK', 2);