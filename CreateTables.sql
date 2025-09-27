-- Department
CREATE TABLE department
(
  dept_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  office VARCHAR(50)
);

-- Instructor
CREATE TABLE instructor
(
  instructor_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE,
  dept_id INT NOT NULL REFERENCES department(dept_id) ON DELETE RESTRICT
);

-- Student
CREATE TABLE student
(
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE,
  dob DATE,
  major_dept_id INT REFERENCES department(dept_id) ON DELETE SET NULL
);

-- Course
CREATE TABLE course
(
  course_id SERIAL PRIMARY KEY,
  course_code VARCHAR(20) NOT NULL,
  title VARCHAR(200) NOT NULL,
  credits SMALLINT NOT NULL CHECK (credits BETWEEN 0 AND 10),
  dept_id INT NOT NULL REFERENCES department(dept_id) ON DELETE RESTRICT,
  instructor_id INT REFERENCES instructor(instructor_id) ON DELETE SET NULL,
  term VARCHAR(20) NOT NULL,
  year INT NOT NULL,
  section VARCHAR(10) NOT NULL DEFAULT '001',
  capacity INT CHECK (capacity >= 0),
  CONSTRAINT uq_course UNIQUE (course_code, term, year, section)
);

-- Enrollment
CREATE TABLE enrollment
(
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
  course_id INT NOT NULL REFERENCES course(course_id) ON DELETE CASCADE,
  enroll_date DATE DEFAULT CURRENT_DATE,
  grade VARCHAR(5),
  status VARCHAR(20) DEFAULT 'enrolled',
  CONSTRAINT uq_student_course UNIQUE (student_id, course_id)
);