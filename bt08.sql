use session06;

-- 2,
SELECT 
    s.student_id, 
    s.name AS student_name, 
    s.email, 
    c.course_name, 
    e.enrollment_date
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id IN (
    SELECT student_id 
    FROM enrollments 
    GROUP BY student_id 
    HAVING COUNT(course_id) > 1
)
ORDER BY s.student_id, e.enrollment_date;

-- 3,
SELECT 
    s.name AS student_name, 
    s.email, 
    e.enrollment_date, 
    c.course_name, 
    c.fee
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_id IN (
    SELECT e.course_id 
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    WHERE s.name = 'Nguyen Van An'
)
AND s.name <> 'Nguyen Van An'
ORDER BY c.course_name, e.enrollment_date;

-- 4,
SELECT 
    c.course_name, 
    c.duration, 
    c.fee, 
    COUNT(e.student_id) AS total_students
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name, c.duration, c.fee
HAVING COUNT(e.student_id) > 2
ORDER BY total_students DESC;

-- 5,
SELECT 
    s.name AS student_name, 
    s.email, 
    SUM(c.fee) AS total_fee_paid, 
    COUNT(e.course_id) AS courses_count
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id IN (
    SELECT student_id 
    FROM enrollments e
    JOIN courses c ON e.course_id = c.course_id
    GROUP BY student_id
    HAVING COUNT(e.course_id) >= 2 
    AND MIN(c.duration) > 30
)
GROUP BY s.student_id, s.name, s.email
ORDER BY total_fee_paid DESC;
