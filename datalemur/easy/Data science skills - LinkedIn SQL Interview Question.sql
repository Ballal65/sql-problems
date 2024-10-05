SELECT 
  DISTINCT candidate_id 
FROM 
  candidates
WHERE
  candidate_id IN (SELECT candidate_id FROM candidates WHERE skill = 'Python')
  AND candidate_id IN (SELECT candidate_id FROM candidates WHERE skill = 'Tableau')
  AND candidate_id IN (SELECT candidate_id FROM candidates WHERE skill = 'PostgreSQL');