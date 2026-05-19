1. Which hotel has the highest cancellation rate?

SELECT 
    hotel,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) AS total_cancellations,
    ROUND(100.0 * SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate
FROM hotel
GROUP BY hotel
ORDER BY cancellation_rate DESC;

 ===========================================================================================================================================================
   
2. Which lead_time occurs in most cancellations?

WITH cte AS (
    SELECT
        hotel,
        CASE
            WHEN lead_time BETWEEN 0 AND 7 THEN 'Last Minute (0-7 days)'
            WHEN lead_time BETWEEN 8 AND 30 THEN 'Short Term (8-30 days)'
            WHEN lead_time BETWEEN 31 AND 90 THEN 'Medium Term (31-90 days)'
            WHEN lead_time BETWEEN 91 AND 180 THEN 'Long Term (91-180 days)'
            ELSE 'Very Long Term (181+ days)'
        END AS lead_time_segment,
        COUNT(*) AS total_bookings,
        SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) AS total_cancellations
    FROM hotel
    GROUP BY hotel, lead_time_segment
)
SELECT 
    *,
    ROUND(100.0 * total_cancellations / (total_bookings + total_cancellations), 2) AS cancellation_rate,
    DENSE_RANK() OVER (PARTITION BY hotel ORDER BY total_cancellations DESC) AS rank_by_cancellation
FROM cte
ORDER BY hotel, cancellation_rate DESC;

 ===========================================================================================================================================================
   
3. Which month has the highest cancellation rate?

WITH cte AS (
    SELECT
        hotel,
        year,
        month,
        COUNT(*) AS total_bookings,
        SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) AS total_cancellations,
        ROUND(100.0 * SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate
    FROM hotel
    GROUP BY hotel, year, month
)
SELECT 
    *,
    DENSE_RANK() OVER (PARTITION BY hotel, year ORDER BY cancellation_rate_percentage DESC) AS rank_by_cancellation
FROM cte
ORDER BY hotel, year, cancellation_rate DESC;

===========================================================================================================================================================
  
4. Repeat Guests vs Non-Repeat Guests Cancellation Rate

WITH cte AS (
SELECT
  repeat_guest,
  COUNT(*) AS total_counts,
  COUNT(CASE WHEN canceled=0 THEN 1 END ) AS total_bookings,
  COUNT(CASE WHEN canceled=1 THEN 1 END ) AS total_cancellations
FROM hotel
GROUP BY repeat_guest
)
SELECT
    *,
  ROUND(total_cancellation*100.0/(total_bookings + total_cancellations),2) AS cancel_pct
FROM cte  

    
===========================================================================================================================================================

    
5. Which Deposit Type Has the Highest Cancellation Rate?


WITH cte AS (
SELECT
  deposit,
  COUNT(*) AS total_counts,
  COUNT(CASE WHEN canceled=0 THEN 1 END ) AS total_bookings,
  COUNT(CASE WHEN canceled=1 THEN 1 END ) AS total_cancellations
FROM hotel
GROUP BY deposit
)
SELECT
    *,
  ROUND(total_cancellation*100.0/(total_bookings + total_cancellations),2) AS cancel_pct
FROM cte 
