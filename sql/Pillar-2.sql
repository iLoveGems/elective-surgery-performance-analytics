/*
QUERY_1: Category Summary
*/
SELECT 
    category,
    SUM(vol_wait) AS total_waiting,
    SUM(vol_treated) AS total_treated,
    SUM(vol_long_wait) AS total_long_wait
FROM
    elective_surgery_category
WHERE
    facility_code !='99999'
    AND
    category !='ALL'
GROUP BY
    category
ORDER BY
    category;


/*
QUERY_2: Treatment Performance by Category
*/
SELECT
    category,

    ROUND(AVG(pct_treated_in_time),2)
        AS avg_pct_treated_in_time,

    ROUND(AVG(pct_waiting_in_time_total),2)
        AS avg_pct_waiting_in_time

FROM
    elective_surgery_category
WHERE
    facility_code !='99999'
    AND
    category !='ALL'
GROUP BY
    category
ORDER BY
    category;


/*
QUERY_3: Performance Trend Over Time
*/
SELECT
    date_year,
    category,

    ROUND(AVG(pct_treated_in_time),2)
        AS avg_treated_in_time,

    ROUND(AVG(pct_waiting_in_time_total),2)
        AS avg_waiting_in_time

FROM
    elective_surgery_category
WHERE
    facility_code !='99999'
    AND
    category !='ALL'
GROUP BY
    date_year,
    category
ORDER BY
    category,
    date_year;


/*
QUERY_4: Facility Performance
*/
SELECT
    facility_name,
    category,
    SUM(vol_wait) AS waiting,
    SUM(vol_treated) AS treated,

    ROUND(AVG(pct_treated_in_time),2)
        AS treated_in_time

FROM
    elective_surgery_category
WHERE
    facility_code !='99999'
    AND
    category !='ALL'
GROUP BY
    facility_name,
    category
ORDER BY
    facility_name,
    category;


/*
QUERY_5: RFS vs Non-RFS Long Waits
*/
SELECT
    category,
    SUM(vol_long_wait_rfs) AS rfs,
    SUM(vol_long_wait_nrfs) AS non_rfs
FROM
    elective_surgery_category
WHERE
    facility_code !='99999'
    AND
    category !='ALL'
GROUP BY
    category;
