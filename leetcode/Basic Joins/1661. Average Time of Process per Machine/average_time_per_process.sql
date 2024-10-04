SELECT
    machine_id
    , ROUND(AVG(diff),3) AS processing_time
FROM
    (SELECT
        start_time_process.machine_id
        , start_time_process.process_id
        , end_time_process.end_time - start_time_process.start_time as diff
    FROM
    (
        SELECT
            machine_id
            , process_id
            , activity_type
            , timestamp AS end_time
        FROM
            Activity
        WHERE
            activity_type = 'end'
        ) end_time_process
    JOIN
        (
        SELECT
            machine_id
            , process_id
            , activity_type
            , timestamp AS start_time
        FROM
            Activity
        WHERE
            activity_type = 'start'
        ) start_time_process
    ON 
    start_time_process.machine_id = end_time_process.machine_id
    AND start_time_process.process_id = end_time_process.process_id) AS sub
GROUP BY
    machine_id