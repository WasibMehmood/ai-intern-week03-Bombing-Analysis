--Select all columns for blasts that happened in Karachi.
SELECT * FROM suicide_blasts
WHERE "City" = 'Karachi';

----------------------------------------------------------
--Count total blasts recorded in the dataset.
SELECT COUNT("S#") AS total_blasts
FROM suicide_blasts;

----------------------------------------------------------
--Find the earliest and latest blast dates.
SELECT "S#","Date"
FROM suicide_blasts
ORDER BY "Date" DESC
LIMIT 5;

----------------------------------------------------------
--List all unique provinces where blasts occurred.
SELECT DISTINCT "Province"
FROM suicide_blasts;

----------------------------------------------------------
--Show the number of blasts per year.
SELECT COUNT("S#") AS total_blasts,"Year"
FROM suicide_blasts
GROUP BY "Year"
ORDER BY total_blasts DESC;

----------------------------------------------------------
--Find the top 5 cities with the highest number of blasts.
SELECT "City",COUNT("S#") as total_blast
FROM suicide_blasts
GROUP BY "City"
ORDER BY total_blast DESC
LIMIT 5;

----------------------------------------------------------
--Calculate the total killed and injured in each province.
SELECT "Province",SUM("Killed Min" + "Killed Max") as total_killed,
SUM("Injured Min" + "Injured Max") as total_injured
FROM suicide_blasts
GROUP BY "Province"
ORDER BY total_killed DESC;

----------------------------------------------------------
--Find average number of people killed in blasts per city.
SELECT "City",
ROUND(AVG(("Killed Min" + "Killed Max") / 2.0),2) AS avg_killed
FROM suicide_blasts
GROUP BY "City"
ORDER BY avg_killed DESC;

----------------------------------------------------------
--Show all incidents where more than 50 people were injured.
SELECT "Influencing Event/Event",SUM("Injured Min" + "Injured Max") as total_injured
FROM suicide_blasts
GROUP BY "Influencing Event/Event"
HAVING SUM("Injured Min" + "Injured Max") > 50;

----------------------------------------------------------
--Get blasts that occurred on Holidays vs Working Days and count them separately.
SELECT "Blast Day Type",
       COUNT(*) AS total_blasts
FROM suicide_blasts
GROUP BY "Blast Day Type"
ORDER BY total_blasts DESC;

----------------------------------------------------------
--Find the year with the highest casualties (Killed + Injured).
SELECT "Year",SUM("Injured Min" + "Injured Max" + "Killed Min" + "Killed Max") as casualties
FROM suicide_blasts
GROUP BY "Year"
ORDER BY casualties DESC
LIMIT 1 OFFSET 0;

----------------------------------------------------------
--Find the top 3 provinces where suicide blasts were most common.
SELECT "Province",
       COUNT(*) AS total_blasts
FROM suicide_blasts
WHERE "No. of Suicide Blasts" > 0
GROUP BY "Province"
ORDER BY total_blasts DESC
LIMIT 3;
----------------------------------------------------------
--List the most dangerous location categories (by average killed).
SELECT "Location Category",ROUND(AVG(("Killed Min" + "Killed Max") / 2.0),2)
AS avg_killed
FROM suicide_blasts
GROUP BY "Location Category"
ORDER BY avg_killed DESC
LIMIT 5;
----------------------------------------------------------
--Rank cities based on total killed using RANK().
SELECT "City",SUM("Killed Min" + "Killed Max") as total_killed,
RANK() OVER(ORDER BY SUM("Killed Min" + "Killed Max") DESC)
FROM suicide_blasts
GROUP BY "City";
----------------------------------------------------------
--Show blasts where hospitals were recorded and group by hospital name.
SELECT "Hospital Names"
FROM suicide_blasts
WHERE "Hospital Names" LIKE '%Hospital%'
GROUP BY "S#","Hospital Names";

----------------------------------------------------------
--Get blasts that occurred on 
--christans vs sunnis vs shiite and count them separately.
SELECT "Targeted Sect if any",
       COUNT(*) AS total_blasts
FROM suicide_blasts
GROUP BY "Targeted Sect if any"
ORDER BY total_blasts DESC;