CREATE TABLE students(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	fullname VARCHAR(512) DEFAULT 'Jahangir_sigma_boy',
	birth_of_date DATE NOT NULL,
	email TEXT UNIQUE
);
CREATE TABLE courses(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title VARCHAR(512) NOT NULL,
	description TEXT 
);
CREATE TABLE enrollments(
	id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	student_id BIGINT REFERENCES students(id) ON DELETE CASCADE,
	course_id BIGINT REFERENCES courses(id) ON DELETE CASCADE,
	enrolled_at DATE
);
INSERT INTO students(fullname,birth_of_date,email)
VALUES
('Nuratdinov Jahangir' , '2009-10-06' , 'sigma_boychik'),
('Hasanov Akbar' , '2008-02-14' , 'Hasanov'),
('Abbasov Timur' , '2001-9-11' , 'Hitler_Abrigan'),
('Yunusov Daniel' , '1945-05-09' , 'Sin_Hitlera');
SELECT * FROM students;
INSERT INTO courses(title,description)
VALUES
('Программирование' , 'тап тап по клаве и деньги тейкаешь'),
('Веб-рисование' , 'СУКА нормальное оформление сделай а не это дерьмо');
SELECT * FROM courses;
SELECT
    e.student_id,
    s.fullname,
    e.enrolled_at
FROM
    enrollments e
JOIN students s ON e.student_id = s.id;