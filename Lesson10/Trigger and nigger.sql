CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(255) NOT NULL,
	age INT NOT NULL CHECK (age > 0)
);

CREATE TABLE student_logs(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	student_id BIGINT REFERENCES students(id),
	action VARCHAR(20) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE FUNCTION log_student_insert()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO student_logs(student_id,action)
	VALUES (NEW.id,'Rashid GAY');
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION log_student_insert();
DROP TRIGGER  trg_log_insert ON students;

CREATE TRIGGER trg_log_insert
AFTER INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION log_student_insert();
INSERT INTO students(fullname,age)
VALUES
('Nuratdinov Jahangir',16),
('Kan Ruslan',17),
('Abbasov Timur',5);

SELECT * FROM students;
SELECT * FROM student_logs;

