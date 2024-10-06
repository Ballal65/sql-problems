SELECT
  department_name
  , name
  , salary
FROM(
  SELECT 
    employee.name
    , employee.salary
    , department.department_name
    , DENSE_RANK()OVER(PARTITION BY department.department_name ORDER BY employee.salary DESC) AS ranking
  FROM 
    employee
  JOIN
    department USING(department_id)) AS employees_salary_department_and_ranks
WHERE
  ranking <= 3
ORDER BY
  department_name;