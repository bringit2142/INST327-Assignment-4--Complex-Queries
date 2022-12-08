USE ischool_v2;

/*Question 1*/
SELECT CONCAT(lname, ', ', fname) AS student_name,
	COUNT(*) AS enrollments,
	SUM(credits) AS credit_count,
    TIME_FORMAT(MAX(start_time), '%h:%i:%s %p') AS latest_start
    FROM people
		JOIN enrollments USING(person_id)
        JOIN course_sections USING(section_id)
        JOIN courses USING(course_id)
GROUP BY student_name WITH ROLLUP
HAVING SUM(credits) > 9;

/*Question 2*/
/*I chose to use a subquery for this question, because I feel more comfortable using that over a CTE. 
I think of a subquery as another way to join 2 tables, and it's easier for me to understand the concept of joining tables.
By writing a smaller query, it's simpler to pull the data that I want and then embed it into another query.*/
SELECT CONCAT(course_code, ' ', course_number) AS course, 
	course_description, COUNT(*) AS section_count, enrollment_count
FROM courses
	JOIN course_sections USING (course_id)
JOIN(
SELECT course_id, COUNT(*) AS enrollment_count
FROM people
	JOIN enrollments USING(person_id)
	JOIN course_sections USING(section_id)
	JOIN courses USING(course_id)
    GROUP BY course_id
) t USING(course_id)
GROUP BY course_id
HAVING COUNT(*) >= 2
ORDER BY course


    



	
	
		