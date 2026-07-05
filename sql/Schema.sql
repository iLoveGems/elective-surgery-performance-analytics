CREATE DATABASE
    surgery_portfolio;

CREATE TABLE elective_surgery_category (
    facility_code INT,
    facility_name VARCHAR(255),
    date DATE,
    date_year INT,
    date_quarter INT,
    date_month INT,
    category VARCHAR(10), 
    vol_treated INT,
    pct_treated_in_time NUMERIC,
    pct_variation_treated_prior_year NUMERIC,
    vol_wait INT,
    vol_long_wait INT,
    pct_waiting_in_time_total NUMERIC,
    date_last_update DATE,
    vol_long_wait_RFS INT,
    vol_long_wait_NRFS INT,
    pct_waiting_in_time_RFS NUMERIC
);
-- Table for Category data

CREATE TABLE elective_surgery_specialty (
    facility_code INT,
    facility_name VARCHAR(255),
    date DATE,
    date_year INT,
    date_quarter INT,
    date_month INT,
    speciality_code VARCHAR(10),
    speciality_desc VARCHAR(255),
    vol_treated INT,
    pct_treated_in_time NUMERIC,
    pct_variation_treated_prior_year NUMERIC,
    vol_wait INT,
    vol_long_wait INT,
    pct_waiting_in_time_total NUMERIC,
    date_last_update DATE,
    vol_long_wait_RFS INT,
    vol_long_wait_NRFS INT,
    pct_waiting_in_time_RFS NUMERIC
);
-- Table for Specialty data
