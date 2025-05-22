-- CREATE PROCEDURE check_number(n INT)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	IF n < 10 THEN
-- 		RAISE NOTICE 'Ты щегол';
-- 	ELSIF n<18 THEN
-- 		RAISE NOTICE 'хаххахахахаахах ШКАЛНИК, АААЗАЗАЗАЗЗАЗАВХАХАХПАХЗПААПАЗАХПЪАЪХП';
-- 	ELSE
-- 	 	RAISE NOTICE 'Нихренасебе кремень вырос';
-- 	END IF;
-- END;
-- $$;
-- DROP PROCEDURE check_number(INT);

-- CALL check_number(432);
-- CALL check_number(12);

-- CREATE TABLE users(
-- 	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
-- 	name VARCHAR(512) UNIQUE,
-- 	age BIGINT
-- )
CREATE PROCEDURE number(n INT)
LANGUAGE plpgsql
AS $$
BEGIN 
	IF n % 2 = 0 THEN 
		RAISE NOTICE 'CHETNOE';
	ELSE
		RAISE NOTICE 'UNCHETNOE';
END;
$$;