/*
DATA QUALITY CHECKS
Purpose: Validate both datasets before beginning analysis
*/

/*
QUERY_1: Total Records
*/
SELECT
    COUNT (*) AS total_records
FROM 
    elective_surgery_category;

SELECT
    COUNT (*) AS total_records
FROM 
    elective_surgery_specialty;


/*
QUERY_2: Checks for Duplicate Rows
*/
SELECT
    facility_code,
    date,
    speciality_code,
    COUNT(*) AS duplicate_count
FROM
    elective_surgery_specialty
GROUP BY
    facility_code,
    date,
    speciality_code
HAVING COUNT(*) >1;


/*
QUERY_3: Missing Values
*/
SELECT
    COUNT (*) AS missing_facility
FROM
    elective_surgery_specialty
WHERE
    facility_name IS NULL;


SELECT
    COUNT (*) AS missing_facility
FROM
    elective_surgery_specialty
WHERE
    speciality_code IS NULL;


SELECT
    COUNT(*) AS missing_category
FROM
    elective_surgery_category
WHERE
    category IS NULL;


/*
QUERY_4: Check Date Range
*/
SELECT
    MIN(date) AS earliest_date,
    MAX(date) AS latest_date
FROM
    elective_surgery_specialty;


SELECT
    MIN(date) AS earliest_date,
    MAX(date) AS latest_date
FROM
    elective_surgery_category;


/*
QUERY_5: Percentage Values Check
*/
SELECT *
FROM
    elective_surgery_specialty
WHERE
    pct_treated_in_time < 0
    OR pct_treated_in_time > 100
    OR pct_waiting_in_time_total < 0
    OR pct_waiting_in_time_total > 100
    OR pct_waiting_in_time_rfs < 0
    OR pct_waiting_in_time_rfs >100;


SELECT *
FROM
    elective_surgery_category
WHERE
    pct_treated_in_time < 0
    OR pct_treated_in_time > 100
    OR pct_waiting_in_time_total < 0
    OR pct_waiting_in_time_total > 100
    OR pct_waiting_in_time_rfs < 0
    OR pct_waiting_in_time_rfs >100;


/*
QUERY_6: Negative Volume Check
*/
SELECT *
FROM
    elective_surgery_specialty
WHERE
    vol_wait < 0
    OR vol_treated < 0
    OR vol_long_wait < 0;


SELECT *
FROM
    elective_surgery_category
WHERE
    vol_wait < 0
    OR vol_treated < 0
    OR vol_long_wait < 0;


/*
QUERY_7: Distinc Facilities
*/
SELECT
    COUNT(DISTINCT facility_name) AS total_facilities
FROM
    elective_surgery_specialty;


SELECT
    COUNT(DISTINCT facility_name) AS total_facilities
FROM
    elective_surgery_category;


/*
QUERY_8: Distinct Specialities
*/
SELECT
    COUNT(DISTINCT speciality_desc) AS total_specialities
FROM
    elective_surgery_specialty
WHERE
    speciality_desc != 'ALL';


/*
QUERY_9: Distinct Categories
*/
SELECT
    COUNT(DISTINCT category) AS total_categories
FROM
    elective_surgery_category
WHERE
    category != 'ALL';