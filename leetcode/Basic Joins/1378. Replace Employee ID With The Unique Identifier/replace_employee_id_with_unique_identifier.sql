SELECT 
    EN.unique_id
    , E.name
FROM
    Employees E
LEFT JOIN
    EmployeeUNI EN
USING(id);