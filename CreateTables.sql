-- Department table
CREATE TABLE department
(
  dept_id SERIAL PRIMARY KEY, -- auto assign id
  name VARCHAR(100) NOT NULL UNIQUE, -- must have a non-duplicate name
  office VARCHAR(50)
);

-- Instructor table
CREATE TABLE instructor
(
  instructor_id SERIAL PRIMARY KEY, -- auto id
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE,
  dept_id INT NOT NULL REFERENCES department(dept_id) ON DELETE RESTRICT -- cannot delete a department
);                                                                       -- that still has instructors

-- Student table
CREATE TABLE student
(
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE,
  dob DATE,
  major_dept_id INT REFERENCES department(dept_id) ON DELETE SET NULL -- if major is deleted,
);                                                                    -- set student major null

-- Course table
CREATE TABLE course
(
  course_id SERIAL PRIMARY KEY,
  course_code VARCHAR(20) NOT NULL,
  title VARCHAR(200) NOT NULL,
  credits SMALLINT NOT NULL CHECK (credits BETWEEN 0 AND 10), -- realistic amount
  dept_id INT NOT NULL REFERENCES department(dept_id) ON DELETE RESTRICT,
  instructor_id INT REFERENCES instructor(instructor_id) ON DELETE SET NULL,
  term VARCHAR(20) NOT NULL,
  year INT NOT NULL,
  section VARCHAR(10) NOT NULL DEFAULT '001', -- 001 makes sense for default, but can be changed
  capacity INT CHECK (capacity >= 0), -- no point having a class with 0 (or negative) students
  CONSTRAINT uq_course UNIQUE (course_code, term, year, section)
);

-- Enrollment table
CREATE TABLE enrollment
(
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT NOT NULL REFERENCES student(student_id) ON DELETE CASCADE, -- if student or course deleted,
  course_id INT NOT NULL REFERENCES course(course_id) ON DELETE CASCADE,    -- remove related enrollments
  enroll_date DATE DEFAULT CURRENT_DATE,
  grade VARCHAR(5), -- 5 spaces, enough for a realistic percentage (85.72)
  status VARCHAR(20) DEFAULT 'enrolled',
  CONSTRAINT uq_student_course UNIQUE (student_id, course_id) -- candidate key
);