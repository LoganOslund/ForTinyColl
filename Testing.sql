-- Run these one at a time for best results

-- Student Enrollments
SELECT s.first_name || ' ' || s.last_name AS student,
       c.course_code, c.title, c.term, c.year, c.section,
       i.first_name || ' ' || i.last_name AS instructor,
       e.status, e.grade
FROM enrollment e
JOIN student s ON e.student_id = s.student_id
JOIN course c ON e.course_id = c.course_id
LEFT JOIN instructor i ON c.instructor_id = i.instructor_id
WHERE s.student_id = 1;

-- Course Offerings
SELECT c.course_code, c.title, c.term, c.year, c.section,
       i.first_name || ' ' || i.last_name AS instructor,
       c.capacity,
       COUNT(e.enrollment_id) AS enrolled_count
FROM course c
LEFT JOIN instructor i ON c.instructor_id = i.instructor_id
LEFT JOIN enrollment e ON e.course_id = c.course_id AND e.status = 'enrolled'
WHERE c.term = 'Fall' AND c.year = 2025
GROUP BY c.course_id, c.course_code, c.title, c.term, c.year, c.section, i.first_name, i.last_name, c.capacity
ORDER BY c.course_code;

-- Instructor Assignments
SELECT i.first_name || ' ' || i.last_name AS instructor,
       c.course_code, c.title, c.term, c.year, c.section
FROM instructor i
JOIN course c ON c.instructor_id = i.instructor_id
WHERE c.term = 'Fall' AND c.year = 2025;

-- Department Details
SELECT d.name AS department,
       COUNT(DISTINCT c.course_id) AS num_courses,
       COUNT(DISTINCT i.instructor_id) AS num_instructors
FROM department d
LEFT JOIN course c ON c.dept_id = d.dept_id
LEFT JOIN instructor i ON i.dept_id = d.dept_id
GROUP BY d.name;
