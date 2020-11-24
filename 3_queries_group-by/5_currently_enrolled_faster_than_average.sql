/*
SELECT students.name AS student,
  AVG(assignment_submissions.duration) 
  AS average_assignment_duration,

  (SELECT AVG(duration)
FROM assignment_submissions
JOIN students ON student_id = students.id
WHERE students.end_date IS NULL) as average_estimated_duration

FROM students
JOIN assignment_submissions ON student_id = students.id
GROUP BY student
HAVING AVG(assignment_submissions.duration) < average_estimated_duration
ORDER BY average_assignment_duration;

average_estimated_duration
*/


SELECT students.name AS student,
  AVG(assignment_submissions.duration) AS average_assignment_duration,
  AVG(assignments.duration) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
FULL JOIN assignments ON assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_assignment_duration;