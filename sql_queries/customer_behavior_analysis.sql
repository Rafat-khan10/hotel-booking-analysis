1. Which Customer Type Generates the Highest ADR?

WITH cte AS (SELECT
   hotel,
   customer_type,
   ROUND(AVG(adr)::NUMERIC ,2) AS avg_adr
FROM hotel
GROUP BY hotel,customer_type
)
SELECT
  *,
  DENSE_RANK() OVER(PARTITION BY hotel ORDER BY avg_adr DESC) AS rank_by_avg_adr
FROM cte

====================================================================================================================================================================================  

  
2.Which customer_type has the highest cancellation_rate ?


WITH cte AS 
(SELECT
  hotel,
  customer_type,
  COUNT(CASE WHEN canceled=0 THEN 1 END ) AS total_bookings,
  COUNT(CASE WHEN canceled=1 THEN 1 END ) AS total_cancellation,
  ROUND(AVG(adr)::NUMERIC ,2) AS avg_adr,
   ROUND(AVG(
    CASE
      WHEN canceled=1 THEN 1 
      ELSE 0
    END),2) AS Avg_cancellation
FROM hotel
GROUP BY hotel,customer_type
)
SELECT
   *,
 CONCAT(ROUND(total_cancellation * 100.0 / NULLIF(total_bookings, 0), 2), '%') AS cancel_pct,
  DENSE_RANK() OVER(PARTITION BY hotel ORDER BY Avg_cancellation DESC ) AS rank_by_avg_cancellation
FROM cte
