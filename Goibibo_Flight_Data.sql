/* What is the average price of flights from Chennai to New Delhi? */

SELECT AVG(Price) AS AveragePrice
FROM Project..Flight_Data
WHERE [From] = 'Chennai' AND [To] = 'New Delhi';

/* Which airline offers the cheapest flights for this route? */

SELECT TOP 1 Flight_Name,Price
FROM Project..Flight_Data
WHERE [From] = 'Chennai' AND [To] = 'New Delhi'
ORDER BY Price;

/* Which airline offers the expensive flights for this route? */

SELECT TOP 1 Flight_Name,Price
FROM Project..Flight_Data
WHERE [From] = 'Chennai' AND [To] = 'New Delhi'
ORDER BY Price DESC;

/* What is the distribution of flight durations for this route? */

SELECT 
	  Total_Duration_Hours,
	  COUNT(*) AS Frequency
FROM Project..Flight_Data
WHERE [From] = 'Chennai' AND [To] = 'New Delhi'
GROUP BY Total_Duration_Hours
ORDER BY Total_Duration_Hours;

/* Top 3 airlines with longest duration */

SELECT TOP 3 Flight_Name,Total_Duration_Hours
FROM Project..Flight_Data
WHERE [From] = 'Chennai' AND [To] = 'New Delhi'
ORDER BY Total_Duration_Hours DESC;

/* Which layover cities are the most common for flights between Chennai and New Delhi? */

SELECT Layover_city,COUNT(*) AS Layover_Count
FROM Project..Flight_Data
WHERE Layover='Yes'
GROUP BY Layover_city
ORDER BY Layover_Count DESC;

/* How does layovers affect flight prices? */

SELECT Layover,AVG(Price) AS Avg_Price
FROM Project..Flight_Data
GROUP BY Layover;

/* How many flights have layovers, and what is the average duration of layovers? */
SELECT
	  COUNT(*) AS Flights_with_Layovers,
	  AVG(DATEPART(HOUR, Layover_Duration) * 60 + DATEPART(MINUTE, Layover_Duration)) AS Avg_Layover_Duration_Minutes
FROM Project..Flight_Data
WHERE Layover='Yes';

/* Which airlines have the highest number of flights on this route? */
SELECT
	   Flight_Name,
	   COUNT(*) AS No_of_Flights
FROM Project..Flight_Data
WHERE [From] = 'Chennai' AND [To] = 'New Delhi'
GROUP BY Flight_Name
ORDER BY No_of_Flights DESC;

 /* list the flights with layovers, along with their layover cities and durations, 
 for flights departing from Chennai to New Delhi? */

 WITH Layover_Info AS 
 (
 SELECT 
		Flight_Name,
		Layover_city,
		Layover_Duration
 FROM Project..Flight_Data
 WHERE Layover='Yes' AND [From] = 'Chennai' AND [To] = 'New Delhi'
 )
 SELECT *
 FROM Layover_Info;
							