/*
PILLAR_3

Operational Backlog & Facility Risk

Business Question:
Which facilities and specialties contribute most to the overall surgical backlong?
*/

/*
QUERY_1: Facilities with Largest Waiting Lists
*/
SELECT
    facility_name,
    SUM(vol_wait) AS waiting,
    SUM(vol_long_wait) AS long_wait,
    SUM(vol_treated) AS treated,

    ROUND(
        SUM(vol_long_wait)::numeric
        /
        NULLIF(SUM(vol_wait),0),
        2
    ) AS backlog_index
FROM
    elective_surgery_specialty
WHERE
    facility_code !='99999'
    AND
    speciality_code !='ALL'
GROUP BY
    facility_name
ORDER BY
    backlog_index DESC;


/*
QUERY_2: Specialties with Highest Long Wait Burden
*/
SELECT
    speciality_desc,
    SUM(vol_wait) AS waiting,
    SUM(vol_long_wait) AS long_wait,
    SUM(vol_treated) AS treated,

    ROUND(
        SUM(vol_long_wait)::numeric
        /
        NULLIF(SUM(vol_wait),0),
        2
    )   AS backlog_index
FROM
    elective_surgery_specialty
WHERE
    facility_code !='99999'
    AND
    speciality_code !='ALL'
GROUP BY
    speciality_desc
ORDER BY
    backlog_index DESC;


/*
QUERY_3: Facilities Most At Risk
*/
SELECT
    facility_name,

    ROUND(AVG(pct_waiting_in_time_rfs),2)
        AS rfs_waiting,
    
    SUM(vol_long_wait_rfs) AS rfs_long_wait,
    SUM(vol_long_wait_nrfs) AS non_rfs_long_wait
FROM
    elective_surgery_specialty
WHERE
    facility_code !='99999'
    AND
    speciality_code !='ALL'
GROUP BY
    facility_name
ORDER BY
    rfs_waiting;


/*
QUERY_4: Executive Risk Ranking
*/
WITH facility_summary AS (

    SELECT
        facility_name,
        SUM(vol_wait) AS waiting,
        SUM(vol_treated) AS treated,
        SUM(vol_long_wait) AS long_wait,
        AVG(pct_treated_in_time) AS treated_in_time
    FROM
        elective_surgery_specialty
    WHERE
        facility_code !='99999'
        AND
        speciality_code !='ALL'
    GROUP BY
        facility_name
    )

SELECT
    facility_name,
    waiting,
    treated,
    long_wait,
    ROUND(treated_in_time,2) AS treated_in_time,

    ROUND(
        long_wait::numeric
        /
        NULLIF(waiting,0),
        2
    ) AS backlog_index,

    RANK() OVER(
        ORDER BY
            long_wait DESC
    ) AS risk_rank

FROM
    facility_summary
ORDER BY
    risk_rank;