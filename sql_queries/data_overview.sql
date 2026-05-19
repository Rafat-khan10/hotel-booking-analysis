1. Data Overview

SELECT
  COUNT(*) AS total_records,
  COUNT(DISTINCT hotel) AS number_of_hotel_types,
  SUM(CASE WHEN canceled = 0 THEN 1 ELSE 0 END) AS total_bookings,
  SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) AS total_cancellations,
  ROUND(100.0 * SUM(CASE WHEN canceled = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate_percentage,
  ROUND(AVG(adr)::NUMERIC, 2) AS average_adr
FROM hotel;
