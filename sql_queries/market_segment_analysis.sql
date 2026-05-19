1. Which market segment has the highest cancellation rate?

WITH cte AS (
SELECT
  hotel,
  market_segment,
  SUM(CASE WHEN canceled=0 THEN 1 ELSE 0 END ) AS total_bookings,
  SUM(CASE WHEN canceled=1 THEN 1 ELSE 0 END ) AS total_cancellations, 
  ROUND(SUM(CASE WHEN canceled=1 THEN 1 ELSE 0 END )*100.0/COUNT(*),2) AS cancellation_rate 
FROM hotel
GROUP BY hotel,market_segment
)
SELECT
  *,
  DENSE_RANK() OVER(PARTITION BY hotel ORDER BY cancellation_rate DESC) AS rank_by_cancellation    
FROM cte
  
=============================================================================================================================================================================
  
2. Which market segment has the highest Average lead time and Average cancellation by hotel?

WITH cte AS (
SELECT
  hotel,
  market_segment,
  ROUND(AVG(adr)::NUMERIC,2) AS avg_adr,
  ROUND(AVG(
       CASE 
	     WHEN canceled=1 THEN lead_time 
	   END
       )::NUMERIC,2) Avg_lead_time,

 ROUND(AVG(
    CASE
      WHEN canceled=1 THEN 1 
      ELSE 0
    END),2) AS Avg_cancellation

FROM hotel
GROUP BY hotel,market_segment
ORDER BY Avg_lead_time DESC,Avg_cancellation DESC
)
SELECT
 *,
 DENSE_RANK() OVER(PARTITION BY hotel ORDER BY Avg_lead_time DESC) AS rank_by_avg_lead_time
FROM cte
  
=========================================================================================================================================================================

3. Which market_segment has the highest Average Daily Rate(ADR)?

WITH cte AS 
(SELECT
  hotel,
  market_segment,
  SUM(CASE WHEN canceled= 0 THEN 1 ELSE 0 END) AS total_bookings,
  SUM(CASE WHEN canceled= 1 THEN 1 ELSE 0 END) AS total_cancellations,
  ROUND(AVG(adr)::NUMERIC,2) AS avg_adr

FROM hotel
GROUP BY hotel,market_segment
)
SELECT
  *,
  CONCAT(ROUND((total_cancellations *100.0)/(total_cancellations + total_bookings),2),'%') AS cancellation_rate,
  DENSE_RANK() OVER(PARTITION BY hotel ORDER BY avg_adr DESC) AS rank_by_avg_adr
FROM cte

