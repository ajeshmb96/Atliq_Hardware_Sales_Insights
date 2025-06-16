
use sales;

SELECT * FROM markets;
SELECT * FROM transactions;

/* Analysis of different SQL statement on data base */

/* 1.To find of all customers records*/

SELECT * FROM customers;

/* 2.To find total number of customers */

SELECT count(*) From customers;

/* 3.To find transactions for Chennai market (market code for chennai is Mark001 */

SELECT * FROM transactions where market_code='Mark001';

/* 4.To find distinct product codes that were sold in chennai */

SELECT distinct product_code FROM transactions where market_code='Mark001';

/* 5.To find transactions for Chennai market (market code for chennai is Mark002 */

SELECT * FROM transactions where market_code='Mark002';

/* 6.To find distinct product codes that were sold in mumbai */

SELECT distinct product_code FROM transactions where market_code='Mark002';

/* 7.To find transactions where currency is US dollars*/

SELECT * from transactions where currency="USD";

/* 8.To find transactions in 2020 join by date table */

SELECT transactions.*, date.* 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020;

/* 8.To find transactions in 2019 join by date table */

SELECT transactions.*, date.* 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2019;

/* 9.To find total revenue in year 2020, */

SELECT SUM(t.sales_amount)
FROM transactions AS t
INNER JOIN date AS d
ON t.order_date = d.date
WHERE d.year = 2020 AND t.currency IN ("INR", "USD");


/* 10.To find total revenue in year 2019, */

SELECT SUM(t.sales_amount)
FROM transactions AS t
INNER JOIN date AS d
ON t.order_date = d.date
WHERE d.year = 2019 AND t.currency IN ("INR", "USD");


/* 11.To find total revenue in year 2020, January Month, */

SELECT SUM(t.sales_amount)
FROM transactions AS t
INNER JOIN date AS d
ON t.order_date = d.date
WHERE d.year = 2020 AND d.month_name = "January" AND t.currency IN ("INR", "USD");

/* 12.To find total revenue in year 2020, February Month, */

SELECT SUM(t.sales_amount)
FROM transactions AS t
INNER JOIN date AS d
ON t.order_date = d.date
WHERE d.year = 2020 AND d.month_name = "February" AND t.currency IN ("INR", "USD");


/* 13.To find total revenue in year 2019, January Month, */

SELECT SUM(t.sales_amount)
FROM transactions AS t
INNER JOIN date AS d
ON t.order_date = d.date  -- Ensure compatible data types in the join condition
WHERE d.year = 2019 AND d.month_name = "January" AND t.currency IN ("INR", "USD");

/* 14.To find total revenue in year 2019, February Month, */

SELECT SUM(t.sales_amount)
FROM transactions AS t
INNER JOIN date AS d
ON t.order_date = d.date
WHERE d.year = 2019 AND d.month_name = "February" AND t.currency IN ("INR", "USD");


/* 15.To find total revenue in year 2020 in Chennai*/

SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date
where date.year=2020 and transactions.market_code="Mark001";

/*OR */
 
SELECT SUM(t.sales_amount)
FROM transactions AS t
INNER JOIN date AS d
ON t.order_date = d.date
WHERE d.year = 2020 AND t.market_code = "Mark001";


/* 16.To find total revenue in year 2020 in Mumbai*/

SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 and transactions.market_code="Mark002";

/* OR */

SELECT SUM(t.sales_amount)
FROM sales.transactions AS t
INNER JOIN sales.date AS d
ON t.order_date = d.date
WHERE d.year = 2020 AND t.market_code = "Mark002";

/* 17.To find the number of transactions per market:*/

SELECT market_code, COUNT(*) AS transaction_count
FROM transactions
GROUP BY market_code;

/* 18.To find monthly revenue trend in 2020:*/

SELECT d.month_name, SUM(t.sales_amount) AS monthly_revenue
FROM transactions AS t
JOIN date AS d ON t.order_date = d.date
WHERE d.year = 2020 AND t.currency IN ("INR", "USD")
GROUP BY d.month_name
ORDER BY d.month_name;

/* 19.To find customers with more than 5 transactions:*/

SELECT customer_code, COUNT(*) AS total_transactions
FROM transactions
GROUP BY customer_code
HAVING COUNT(*) > 10;

/* 20.Average sales per month in 2020 where monthly average > ₹2,000:*/

SELECT d.month_name, AVG(t.sales_amount) AS avg_sales
FROM transactions t
JOIN date d ON t.order_date = d.date
WHERE d.year = 2020 
GROUP BY d.month_name
HAVING avg_sales > 2000
ORDER BY d.month_name;


