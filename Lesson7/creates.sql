CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) NOT NULL,
	date_of_birth DATE NOT NULL
);
CREATE TABLE grade(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	grade INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	student_id BIGINT REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students(fullname,date_of_birth) VALUES
('Ruslan','2008-11-25'),
('Jahangir','2009-10-06'),
('Rashid','2008-07-13'),
('Malika','1999-02-21');
SELECT * FROM students;
INSERT INTO grade(grade, student_id) VALUES
-- Jahangir
-- (9,2),
-- (10,2),
-- (8,2),
-- (0,2),
-- (12,2),
(9,3),
(10,3),
(0,3),
(0,3),
(12,3),
(9,1),
(10,1),
(8,1),
(10,1),
(12,1),
(9,4),
(10,4),
(8,4),
(0,4),
(12,4)
SELECT COUNT(*) FROM students;
SELECT 
s.fullname,
AVG(g.grade)
FROM students S
JOIN grade g ON g.student_id=s.id
GROUP BY s.fullname
HAVING AVG(g.grade) > 7;
SELECT * FROM grade;