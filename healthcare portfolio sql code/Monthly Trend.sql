SELECT
    DATENAME(month, AppointmentDay) + ' ' + CAST(YEAR(AppointmentDay) AS varchar) AS appt_month,
    YEAR(AppointmentDay) AS yr,
    MONTH(AppointmentDay) AS mn,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(100.0 * SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS no_show_rate_pct
FROM dbo.appointments_clean
GROUP BY
    YEAR(AppointmentDay),
    MONTH(AppointmentDay),
    DATENAME(month, AppointmentDay)
ORDER BY yr, mn;
