

/*
QUERY_1: Overall Demand by Specialty
*/
SELECT 
    speciality_desc, SUM(vol_wait) AS total_waiting, 
    SUM(vol_treated) AS total_treated, SUM(vol_long_wait) AS total_long_wait, 
    ROUND( SUM(vol_wait)::numeric / NULLIF(SUM(vol_treated),0), 2 ) AS backlog_pressure 
FROM 
    elective_surgery_specialty 
WHERE
    facility_name != 'Queensland'
    AND
    speciality_code != 'ALL'
GROUP BY 
    speciality_desc 
ORDER BY 
    total_waiting DESC;

/*
QUERY_2: Overall Demand by Facility
*/
SELECT 
    facility_name, SUM(vol_wait) AS total_waiting, 
    SUM(vol_treated) AS total_treated, 
    SUM(vol_long_wait) AS total_long_wait, 
    ROUND( AVG(pct_treated_in_time), 2 ) AS avg_pct_treated_in_time 
FROM 
    elective_surgery_specialty 
WHERE
    facility_name != 'Queensland'
    AND
    speciality_code != 'ALL'
GROUP BY 
    facility_name 
ORDER BY 
    total_waiting DESC;

/*
QUERY_3: Demand Trend by Year
*/
SELECT
    date_year,
    speciality_desc,
    SUM(vol_wait) AS total_waiting,
    SUM(vol_treated) AS total_treated
FROM
    elective_surgery_specialty
WHERE
    facility_name != 'Queensland'
    AND
    speciality_code != 'ALL'
GROUP BY
    date_year,
    speciality_desc
ORDER BY
    speciality_desc,
    date_year;

/*
QUERY_4: Year-on-Year Growth
*/
WITH yearly_summary AS (
SELECT 
    speciality_desc,
    date_year,
    SUM(vol_wait) AS waiting
FROM 
    elective_surgery_specialty
WHERE
    facility_name != 'Queensland'
    AND
    speciality_code != 'ALL'
GROUP BY
    speciality_desc,
    date_year

)

SELECT
    speciality_desc,
    date_year,
    waiting,
    LAG(waiting)
        OVER (
            PARTITION BY speciality_desc
            ORDER BY date_year
        ) AS previous_year_waiting,

    ROUND (
        (
            waiting - LAG(waiting)
                OVER(
                    PARTITION BY speciality_desc
                    ORDER BY date_year
                    )
        ) *100.0 / NULLIF (
                LAG(waiting)
                    OVER(
                        PARTITION BY speciality_desc
                        ORDER BY date_year
                        ),
                0
                            ),
                2
             ) AS pct_growth
FROM 
    yearly_summary
ORDER BY
    speciality_desc,
    date_year;



    