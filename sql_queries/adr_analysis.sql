1. Which quarter has the highest Average Daily Rate(ADR)?
  
WITH cte AS (
SELECT
  hotel,
  year,
  month,
  EXTRACT(QUARTER FROM reservation_status_date) AS quarter,
  ROUND(AVG(adr)::NUMERIC,2) AS total_adr
FROM hotel
WHERE reservation_status_date BETWEEN '2014-10-17' AND '2017-09-14'  AND
canceled=0
GROUP BY hotel, year, month, EXTRACT(QUARTER FROM reservation_status_date)
ORDER BY total_adr DESC
)
SELECT
*,
DENSE_RANK() OVER(PARTITION BY hotel,year ORDER BY total_adr DESC) AS rank_by_total_adr
FROM cte
  
============================================================================================================================================================================

2. Month-over-Month (MoM) ADR Trend by Year?

WITH cte AS (
SELECT
  hotel,
  year,
  EXTRACT(MONTH FROM reservation_status_date) AS month_num,
  TO_CHAR(reservation_status_date,'Mon') AS month_char,
  SUM(CASE WHEN canceled= 0 THEN 1 ELSE 0 END) AS total_bookings,
  SUM(CASE WHEN canceled= 1 THEN 1 ELSE 0 END) AS total_cancellation,
  ROUND((SUM(CASE WHEN canceled= 0 THEN 1 ELSE 0 END)::NUMERIC/COUNT(*))*100,2) AS conversion_rate,
  ROUND(SUM(CASE WHEN canceled= 0 THEN adr ELSE 0 END)::NUMERIC,2) AS current_month_adr
FROM hotel
GROUP BY hotel, year,month_num,month_char
),
cte2 AS (
SELECT
*,
 LAG(current_month_adr) OVER(PARTITION BY hotel ORDER BY year ,month_num ASC) AS previous_month_adr
FROM cte
)
SELECT
 *,
 CONCAT(ROUND(((current_month_adr - previous_month_adr)*100)/NULLIF(previous_month_adr,0),1),'%') AS mom_percentage
FROM cte2
ORDER BY hotel, year, month_num;
