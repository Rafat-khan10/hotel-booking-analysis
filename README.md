# 🏨 Hotel Booking Performance & Cancellation Analysis

---

## 📌 Project Overview

This project analyzes **3 years of hotel booking data (2015–2017)** from two hotel types — City Hotel and Resort Hotel — covering over **116,000 bookings** across multiple countries.

Using **SQL (PostgreSQL)** and **Power BI**, the analysis uncovers cancellation patterns, revenue trends, guest behavior, and market segment performance to support data-driven decision-making for hotel management.

---

## 📌 Business Problem

Hotel cancellations directly impact revenue, resource planning, and operational efficiency. This project aims to identify the key drivers of cancellation behavior and revenue fluctuation — and provide actionable recommendations to reduce cancellation risk and maximize ADR (Average Daily Rate).

---

## ❓ Key Business Questions Explored

1. Which hotel type has a higher cancellation rate — City Hotel or Resort Hotel?
2. How does lead time affect cancellation probability?
3. Which market segments contribute the most bookings and cancellations?
4. How does deposit type influence cancellation behavior?
5. Which months record the highest and lowest ADR?
6. How does revenue change month-over-month across years?
7. Do repeat guests cancel less than new guests?
8. Does room mismatch (reserved vs assigned) increase cancellations?
9. Which customer types generate the highest ADR?
10. What is the estimated revenue loss caused by cancellations?

> ✨ *...and additional insights derived from 15+ SQL queries.*

---

## 📊 Dataset

| Property | Details |
|---|---|
| Source | Hotel Booking Demand Dataset (Kaggle) |
| Period | July 2015 – September 2017 |
| Total Rows | 116,959 |
| Hotel Types | 2 (City Hotel, Resort Hotel) |
| Total Bookings | ~75,000 (non-cancelled) |
| Total Cancellations | ~44,000 |
| Overall Cancellation Rate | ~37% |
| Countries | 178 |

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| Python (Pandas) | Data cleaning & preprocessing |
| PostgreSQL | Data storage & SQL queries |
| pgAdmin 4 | Query execution & output |
| Power BI | Interactive dashboard |

---

## 📁 Project Structure

```
hotel-booking-analysis/
│
├── dataset/
│   └── hotel_bookings_clean.csv
│
├── sql_queries/
│   ├── data_overview.sql
│   ├── cancellation_analysis.sql
│   ├── adr_analysis.sql
│   ├── market_segment_analysis.sql
│   └── customer_behaviour_analysis.sql
│
├── dashboard/
│   └── hotel_booking_dashboard.pbix
│
├── screenshots/
│   ├── cancellation_by_hotel.png
│   ├── lead_time_cancellation.png
│   ├── market_segment_analysis.png
│   ├── monthly_adr_trend.png
│   └── revenue_loss.png
│
└── README.md
```

---

## 🔍 Key Findings

- 🏙️ **City Hotel** records a significantly higher cancellation rate of **42%**, compared to just **28%** for Resort Hotel
- ⏳ **Very-Long lead time bookings (180+ days)** show the highest cancellation rate at **64%** for City Hotel — the longer the lead time, the higher the cancellation
- 👥 **Groups segment** has the highest cancellation rate across both hotels — **69.48%** for City Hotel and **43.05%** for Resort Hotel
- 💳 **Non Refund deposit** bookings record a **99.36%** cancellation rate — contrary to expectations
- 📅 **Revenue peaks in July–August** and contracts sharply in **Q4 (October–December)** due to seasonal demand decline
- 🔄 **Repeat guests** cancel significantly less than new guests — indicating stronger booking commitment

> ⚠️ *Key Findings will be updated as analysis progresses.*

---

## 💡 Business Recommendations

1. **Implement stricter deposit policies** for bookings with lead times exceeding 90 days — particularly in the Very-Long segment where cancellation rates reach 64%
2. **Target repeat guests with loyalty programs** to increase their share of total bookings — as they exhibit significantly lower cancellation rates
3. **Review Non Refund pricing strategy** — despite deposit requirement, cancellation rate remains extremely high, suggesting guests are willing to forfeit deposits
4. **Prioritize Corporate and Direct segments** for long-term revenue stability — both show consistently low cancellation rates
5. **Implement seasonal promotions in Q4** to mitigate off-peak revenue loss driven by reduced demand in winter months
6. **Apply stricter cancellation policies for Group bookings** — as this segment consistently records the highest cancellation rates across both hotel types

> ⚠️ *Business Recommendations will be updated as analysis progresses.*

---

## ▶️ How to Run

1. Clone this repository
2. Download dataset from `dataset/` folder
3. Create a new database in PostgreSQL
4. Import `hotel_bookings_clean.csv` into a table named `hotel`
5. Run queries from `sql_queries/` folder
6. Open `hotel_booking_dashboard.pbix` in Power BI Desktop

---

## 📬 Connect With Me

**Rafat Khan** — Aspiring Data Analyst

- 💼 LinkedIn: https://www.linkedin.com/in/rafat-khan-7215953a1/
- 🐙 GitHub: https://github.com/Rafat-khan10
- 📧 Email: rafatkhan2210@gmail.com
