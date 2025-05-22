CREATE TABLE users(
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR(320) UNIQUE NOT NULL,
  age INT NOT NULL CHECK (age > 0),
  fullname VARCHAR(512) NOT NULL
);

CREATE PROCEDURE add_upd(u_username VARCHAR(320),u_age INT,u_fullname VARCHAR(512))
LANGUAGE plpgsql
AS $$
DECLARE user_count BIGINT;w
BEGIN
	-- Узнали кол-во пользователей с такими username
	SELECT COUNT(*) INTO user_count FROM users WHERE username =u_username; 
	IF user_count > 0 THEN
		UPDATE users
		SET age = u_age, fullname = u_fullname
		WHERE username = u_username;
	ELSE
		INSERT INTO users(username,age,fullname)
		VALUES(u_username,u_age,u_fullname);
	END IF;
END;
$$;
CALL add_upd('Jahangeeir','16','Nuratdinov Jahangir');
SELECT * FROM users;
CALL add_upd('Jahangir','17','HAY HITLER');





