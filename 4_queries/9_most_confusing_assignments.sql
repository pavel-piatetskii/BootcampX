SELECT 
  assignments.id as id, name, day, chapter,
  COUNT(assistance_requests.id) as total_requests
FROM assistance_requests
JOIN assignments ON assignment_id = assignments.id
GROUP BY assignments.id
ORDER BY total_requests DESC;

