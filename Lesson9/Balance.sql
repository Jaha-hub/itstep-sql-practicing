DROP PROCEDURE add_user(VARCHAR,VARCHAR);

CREATE TABLE balances(
 	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10,2) DEFAULT 0
);
CREATE TABLE transactions(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	amount NUMERIC(10, 2) CHECK (amount > 1), 
	sender_id BIGINT REFERENCES balances(id),
	getter_id BIGINT REFERENCES balances(id)
);

CREATE PROCEDURE add_balances(u_amount NUMERIC(10,2))
LANGUAGE plpgsql
AS $$
DECLARE balance_id BIGINT;
BEGIN
	INSERT INTO balances(amount)
	VALUES (u_amount)
	
	RETURNING id INTO balance_id;
	
	INSERT INTO transaction(sender_id,getter_id)
	VALUES (balance_id);
END;
$$;
SELECT * FROM transactions;