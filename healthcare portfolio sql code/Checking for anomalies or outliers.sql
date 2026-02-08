SELECT
    MIN(ScheduledDay) AS earliest_scheduled,
    MAX(ScheduledDay) AS latest_scheduled,
    MIN(AppointmentDay) AS earliest_appt,
    MAX(AppointmentDay) AS latest_appt
FROM [dbo].[KaggleV2-May-2016];


SELECT COUNT(*) AS bad_age_count
FROM [dbo].[KaggleV2-May-2016]
WHERE Age < 0 OR Age > 110;

SELECT COUNT(*) AS bad_lead_time
FROM [dbo].[KaggleV2-May-2016]
WHERE ScheduledDay > AppointmentDay;
