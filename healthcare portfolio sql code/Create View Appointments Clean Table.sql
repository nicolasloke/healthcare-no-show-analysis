GO
CREATE VIEW appointments_clean AS
SELECT
    *,
    DATEDIFF(DAY, ScheduledDay, AppointmentDay) AS lead_time_days
FROM [dbo].[KaggleV2-May-2016]
WHERE
    Age BETWEEN 0 AND 110
    AND ScheduledDay <= AppointmentDay;


SELECT TOP 10
    ScheduledDay,
    AppointmentDay,
    lead_time_days
FROM appointments_clean
ORDER BY ScheduledDay;

CREATE OR ALTER VIEW dbo.appointments_clean AS
SELECT
    *,
    DATEDIFF(DAY, CAST(ScheduledDay AS date), AppointmentDay) AS lead_time_days
FROM dbo.[Kagglev2-May-2016]
WHERE Age BETWEEN 0 AND 110
  AND CAST(ScheduledDay AS date) <= AppointmentDay;


SELECT TOP 10
    ScheduledDay,
    AppointmentDay,
    lead_time_days
FROM dbo.appointments_clean
ORDER BY lead_time_days ASC;
