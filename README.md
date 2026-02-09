# Outpatient No-Show Analysis & Access Optimization

## Overview
This project analyzes outpatient appointment data to identify drivers of no-shows and estimate operational impact. The goal is to explore how scheduling lead time affects attendance and access performance.

## Business Context

Missed outpatient appointments reduce clinic efficiency, delay care access, and increase operational costs. This analysis explores how scheduling lead time influences attendance behavior and estimates the potential operational impact of reducing wait times.

## Tools Used
- Microsoft SQL Server (SSMS)
- Power BI Desktop
- DAX

## Dataset
Public dataset: Medical Appointment No Shows (Brazil) – Kaggle  
Unit of analysis: One row = one appointment

---

## Approach

### 1. Data Preparation (SQL Server)
- Imported CSV into SQL Server
- Performed data quality checks (invalid ages, scheduling inconsistencies)
- Created cleaned view with engineered feature:
  - `lead_time_days`

### 2. Analysis
- Bucketed lead times (0–7, 8–14, 15–30, 31+ days)
- Calculated no-show rates by bucket
- Analyzed monthly trends
- Estimated potentially avoidable missed visits using baseline scenario

### 3. Dashboard (Power BI)
Key metrics:
- Total Appointments
- No-Show Rate %
- Avg Lead Time
- Potentially Avoidable Missed Visits

---

## Key Findings

- No-show rates increase as scheduling lead time increases.
- Same-week appointments had the lowest no-show rates (~24%).
- Appointments scheduled 31+ days out showed ~33% no-show rates.
- Approximately 2.9K missed visits could potentially be avoided under a reduced lead-time scenario (baseline comparison).

## Dashboard Preview
![Dashboard](dashboard_screenshot.png)


---

## Files Included
- `/sql` → SQL scripts used for data cleaning and analysis
- `/powerbi` → Dashboard screenshots
- 'powerbi file
