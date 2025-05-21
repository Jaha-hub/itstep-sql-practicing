CREATE TABLE users(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) NOT NULL,
	user_name VARCHAR(512) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE profiles(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
	bio TEXT
);

-- Хранимая процедура для создания пользователя и его простофиля
CREATE PROCEDURE add_user(u_fullname VARCHAR(512),u_user_name VARCHAR(320))
LANGUAGE plpgsql
AS $$
DECLARE new_user_id BIGINT;
BEGIN 
	-- Создаём Пользователя
 	INSERT INTO users(fullname,user_name)
	VALUES (u_fullname,u_user_name)
	-- Засовываем ид созданного пользователя в перемещёную
	RETURNING id INTO new_user_id;
	-- Создаём профиль
	INSERT INTO profiles(user_id)
	VALUES (new_user_id);
END;
$$;

CALL add_user('Ruslan Kan' , 'Li2008');

SELECT * FROM users;
SELECT * FROM profiles;