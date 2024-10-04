SELECT
    id AS Id
FROM
    (SELECT
        id
        , recordDate AS currDate
        , LAG(recordDate, 1)OVER() AS prevDate
        , temperature currTemp
        , LAG(temperature, 1)OVER() AS prevTemp

    FROM
        Weather
    ORDER BY
        currDate) AS prev_and_curr_compare
WHERE
    currDate = prevDate + INTERVAL 1 DAY
    AND currTemp IS NOT NULL
    AND prevTemp IS NOT NULL
    AND currTemp > prevTemp;