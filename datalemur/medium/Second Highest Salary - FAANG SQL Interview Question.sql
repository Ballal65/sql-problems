SELECT 
  salary
FROM(
    SELECT 
      salary
      , DENSE_RANK()OVER( ORDER BY SALARY DESC) AS rank
    FROM 
      employee) salary_and_ranks
WHERE 
  rank = 2;