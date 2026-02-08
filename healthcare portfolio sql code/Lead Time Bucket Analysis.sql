SELECT
    MIN(lead_time_days) AS min_lead,
    MAX(lead_time_days) AS max_lead,
    AVG(CAST(lead_time_days AS float)) AS avg_lead
FROM dbo.appointments_clean;

SELECT
    CASE
        WHEN lead_time_days BETWEEN 0 AND 7 THEN '0-7 days'
        WHEN lead_time_days BETWEEN 8 AND 14 THEN '8-14 days'
        WHEN lead_time_days BETWEEN 15 AND 30 THEN '15-30 days'
        ELSE '31+ days'
    END AS lead_time_bucket,

    COUNT(*) AS total_appointments,

    SUM(CASE WHEN [No_show] = 'Yes' THEN 1 ELSE 0 END) AS no_shows,

    ROUND(
        100.0 * SUM(CASE WHEN [No_show] = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_pct

FROM dbo.appointments_clean
GROUP BY
    CASE
        WHEN lead_time_days BETWEEN 0 AND 7 THEN '0-7 days'
        WHEN lead_time_days BETWEEN 8 AND 14 THEN '8-14 days'
        WHEN lead_time_days BETWEEN 15 AND 30 THEN '15-30 days'
        ELSE '31+ days'
    END
ORDER BY lead_time_bucket;