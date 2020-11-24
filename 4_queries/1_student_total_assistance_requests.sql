SELECT COUNT(assistance_requests.id) AS total_assistances, name
FROM assistance_requests
JOIN students ON student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY name;