/* ============================================================
   CUSTOMER & SALES ANALYSIS
   Author: Sahar Heidariasl
   Description: SQL queries used to generate business insights
   ============================================================ */

/* ------------------------------------------------------------
   1️⃣ Total Revenue
------------------------------------------------------------ */
SELECT SUM(total_price) AS total_revenue
FROM sales_data;


/* ------------------------------------------------------------
   2️⃣ Revenue by Category
------------------------------------------------------------ */
SELECT category,
       SUM(total_price) AS revenue
FROM sales_data
GROUP BY category
ORDER BY revenue DESC;


/* ------------------------------------------------------------
   3️⃣ Top 3 Shopping Malls by Revenue
------------------------------------------------------------ */
SELECT shopping_mall,
       SUM(total_price) AS revenue
FROM sales_data
GROUP BY shopping_mall
ORDER BY revenue DESC
LIMIT 3;


/* ------------------------------------------------------------
   4️⃣ Gender Distribution by Category
------------------------------------------------------------ */
SELECT c.gender,
       s.category,
       COUNT(*) AS purchase_count
FROM sales_data s
JOIN customer_data c
  ON s.customer_id = c.customer_id
GROUP BY c.gender, s.category
ORDER BY purchase_count DESC;
