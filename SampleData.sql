-- Departments
INSERT INTO department (name, office) VALUES
('Computer Science', 'CS Building 101'),
('Mathematics', 'Math Hall 210'),
('English', 'Language Center 4');

-- Instructors
INSERT INTO instructor (first_name, last_name, email, dept_id) VALUES
('Alice', 'Johnson', 'alice.johnson@tiny.edu', 1),
('Robert', 'Henrik', 'robert.henrik@tiny.edu', 3),
('Emily', 'Smith', 'emily.smith@tiny.edu', 2);

-- Students
INSERT INTO student (first_name, last_name, email, dob, major_dept_id) VALUES
('Ethan', 'Osmun', 'ethan.osmun@student.tiny.edu', '2002-03-14', 1),
('Fiona', 'Garcia', 'fiona.garcia@student.tiny.edu', '2003-07-02', 2),
('George', 'Herris', 'george.herris@student.tiny.edu', '2001-12-21', NULL); -- no major selected

-- Courses
INSERT INTO course (course_code, title, credits, dept_id, instructor_id, term, year, section, capacity) VALUES
('CS101', 'Intro to Computer Science', 4, 1, 1, 'Fall', 2025, '001', 30),
('CS201', 'Data Structures', 4, 1, 1, 'Fall', 2025, '001', 25),      -- technically, the instructor
('MATH101', 'Calculus I', 4, 2, 3, 'Fall', 2025, '001', 40),         -- does not have to be from the
('ENG101', 'English Composition', 3, 3, 2, 'Fall', 2025, '001', 35); -- same department as the class

-- Enrollments
INSERT INTO enrollment (student_id, course_id, enroll_date, grade, status) VALUES
(1, 1, '2025-08-20', '87' ,'enrolled'),
(1, 2, '2025-08-20', '91.25' ,'enrolled'),
(2, 3, '2025-08-21', '75.2' ,'enrolled'),
(3, 1, '2025-08-22', '83' ,'enrolled'),
(2, 4, '2025-08-22', '100' ,'enrolled');
