# Queensland Elective Surgery Performance Analytics (2015–2025)

## Project Overview

This project analyses ten years of Queensland elective surgery data to investigate statewide demand, treatment performance, waiting list growth, and operational backlog across Queensland public hospitals.

Using PostgreSQL, SQL, Power Query, and Power BI, publicly available Queensland Health datasets were transformed into a validated analytical dataset before being explored through a series of SQL analyses and interactive dashboards.

The project focuses on three key business questions:

- How has elective surgery demand changed over time?
- Are patients receiving treatment within recommended timeframes?
- Which specialties and urgency categories contribute most to waiting list pressure?

---

## Project Architecture

The project follows a complete analytics workflow:

```
Queensland Open Data
        │
        ▼
 Power Query (ETL)
        │
        ▼
 PostgreSQL Database
        │
        ▼
 SQL Analysis
        │
        ▼
 Power BI Dashboard
```

---

## Data Engineering

Historical datasets were downloaded from the Queensland Government Open Data Portal.

Because the files were supplied across multiple reporting periods, they contained inconsistencies in file format, column structure, facility naming conventions, and reporting standards. Power Query was used to prepare a consistent analytical dataset.

The data preparation process included:

- Converting Excel files into a consistent CSV format
- Combining historical and current reporting periods
- Standardising facility names
- Removing unnecessary columns
- Creating Year, Quarter and Month fields
- Validating data types
- Cleaning invalid records
- Preparing separate Specialty and Urgency Category datasets

The final cleaned datasets were exported for SQL analysis.

![Power Query Workflow](images/01_power_query_cleaning_steps.png)

*Figure 1. Power Query data preparation workflow.*

---

![Cleaned Dataset](images/02_cleaned_master_dataset_excel.png)

*Figure 2. Final analytical dataset.*

---

## Database Validation

The cleaned datasets were imported into PostgreSQL for validation and analysis.

Validation queries were used to confirm:

- Record counts
- Date ranges
- Duplicate records
- Missing values
- Percentage ranges
- Volume totals

These checks ensured the analytical datasets were suitable for dashboard reporting.

![SQL Analysis](images/03_sql_pillar3_query.png)

*Figure 3. Example SQL analysis.*

---

## Data Model

Power BI was connected to PostgreSQL using a relational data model.

Separate fact tables were created for Specialty and Urgency Category reporting, while dimension tables supported interactive filtering across facilities, Health Services and reporting periods.

![Power BI Data Model](images/04_powerbi_data_model.png)

*Figure 4. Power BI data model.*

---

## Analytical Framework

The project was organised into three analytical pillars.

### Pillar One — Statewide Demand & Capacity

**Business Question**

How has elective surgery demand changed across Queensland?

This section examines:

- Total patients waiting
- Total patients treated
- Waiting list trends
- Facility performance
- Specialty demand

![Dashboard 1](images/05_dashboard_pillar1_exec_sum.png)

---

### Pillar Two — Capacity & Operational Performance

**Business Question**

Which specialties are experiencing the greatest operational pressure?

This dashboard investigates:

- Waiting versus treated patients
- Backlog Pressure Index
- Treatment performance
- Long wait patient distribution

![Dashboard 2](images/06_dashboard_pillar2_capacity_operational_perf.png)

---

### Pillar Three — Clinical Performance & Timeliness

**Business Question**

Are patients receiving treatment within clinically recommended timeframes?

This section analyses:

- Treatment performance by urgency category
- Waiting patients by urgency
- Long wait patients
- RFS versus Non-RFS waiting lists
- Treatment performance trends

![Dashboard 3](images/07_dashboard_pillar3_clinical_perf_timeliness.png)

---

## Repository Structure

```
elective-surgery-performance-analytics
│
├── data/
├── documentation/
├── images/
├── powerbi/
├── sql/
└── README.md
```

---

## Technical Skills

This project demonstrates practical experience in:

- SQL
- PostgreSQL
- Power Query
- Power BI
- DAX
- Data Cleaning
- Data Validation
- Data Modelling
- Dashboard Development
- Healthcare Analytics
- Data Visualisation

---

## About

This project forms part of my healthcare analytics portfolio while transitioning from Registered Nurse to Clinical Data Analyst.

It demonstrates the complete workflow of preparing, validating, analysing, and visualising healthcare data to support operational decision-making.
