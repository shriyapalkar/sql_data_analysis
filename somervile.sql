CREATE DATABASE IF NOT EXISTS somerville;
use somerville;

create table crash(
Crash_Number int NOT NULL,
Date_and_Time  DATETIME,
Police_Shift varchar(50) NOT NULL,
Crash_loc varchar(50) NOT NULL,
Light_condn varchar(50) NOT NULL,
Weather varchar(50) NOT NULL, 
Road_surface varchar(50) not null,
Road_contributing varchar(50) NOT NULL,
Traffic_ctrl_device varchar(50) NOT NULL,
Roadway_Intersection varchar(50) NOT NULL,
Trafficway varchar(50) NOT NULL,
Collision varchar(50) NOT NULL,
Harmful_Event varchar(50) NOT NULL,
Event_Location varchar(50) NOT NULL,
Speed_Limit int NOT NULL,
Work_Zone int NOT NULL,
Count_Fatal_Injury int NOT NULL,
Count_Suspected_Serious_I int NOT NULL,
Count_Suspected_Minor_I  int NOT NULL,
Count_Possible_I int NOT NULL,
Count_No_Apparent_I int NOT NULL,
Count_Unknown_I int NOT NULL,
Count_Not_Reported_I int NOT NULL,
Total_Non_Motorists int NOT NULL,
Pedestrian_Involvement int NOT NULL,
Cyclist_Involvement int NOT NULL,
Other_Non_Motorist_Involvement int NOT NULL,
Hit_Run_Flag int NOT NULL,
Latitude FLOAT NOT NULL,
Longitude FLOAT NOT NULL,
Ward int NOT NULL,
Block_Code varchar(30) NOT NULL);

drop table crash;

select * from crash;

select Date_and_Time,
(CASE
	WHEN `Date_and_Time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
    WHEN `Date_and_Time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
    ELSE "Evening"
    END) AS time_of_day
    FROM crash;
    
    select * from crash;
    
    -- day_name column adding

ALTER TABLE crash DROP COLUMN time_of_day;
    
 SELECT Date_and_Time,
DAYNAME(Date_and_Time) AS day_name
FROM crash;

ALTER TABLE crash ADD COLUMN day_name VARCHAR(10);

UPDATE crash
SET day_name = DAYNAME(Date_and_Time);

 -- month_name column adding
    
 SELECT Date_and_Time,
DAYNAME(Date_and_Time) AS month_name
FROM crash;

ALTER TABLE crash ADD COLUMN month_name VARCHAR(10);

UPDATE crash
SET month_name = DAYNAME(Date_and_Time);

-- Exploratory Data Analysis (EDA):

-- 1 How many distinct cities are present?
SELECT COUNT(DISTINCT crash_loc) AS distinct_cities
FROM crash;

--  2 In which city is each police shift located?
SELECT * FROM crash;
SELECT DISTINCT police_shift,crash_loc FROM crash;

--  3 How many distinct crash locations are there?
SELECT COUNT(DISTINCT crash_loc) AS distinct_crash_locations
FROM crash;

-- 4 Most common weather condition during crashes?
SELECT weather, COUNT(weather) AS common
FROM crash
GROUP BY weather
ORDER BY common DESC
LIMIT 1;

-- 5 Which day of the week has the most accidents?
SELECT day_name, COUNT(*) AS accident_count
FROM crash
GROUP BY day_name
ORDER BY accident_count DESC
LIMIT 1;

-- 6 What was the most common type of collision?
SELECT collision, COUNT(collision) AS common
FROM crash
GROUP BY collision
ORDER BY common DESC
LIMIT 1;

-- 7 Which ward has the most reported accidents?
SELECT ward, COUNT(*) AS accident_count
FROM crash
GROUP BY ward
ORDER BY accident_count DESC
LIMIT 1;

-- 8 Analyze accidents involving fatalities vs non-fatal ones:
SELECT COUNT(*) AS total_accidents
FROM crash;

SELECT SUM(Count_Fatal_Injury) AS fatal_accidents
FROM crash;

-- 9 speedlimit descending to crash_loc 
SELECT crash_loc,SUM(speed_limit) AS speed
FROM crash
GROUP BY crash_loc
ORDER BY speed DESC;

-- 10 HIGHEST speedlimit descending to crash_loc 
SELECT crash_loc,SUM(speed_limit) AS speed
FROM crash
GROUP BY crash_loc
ORDER BY speed DESC LIMIT 1;

-- 11 lOWEST speedlimit descending to crash_loc 
SELECT crash_loc,SUM(speed_limit) AS speed
FROM crash
GROUP BY crash_loc
ORDER BY speed asc LIMIT 1;