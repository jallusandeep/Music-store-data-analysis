/*	Question Set 1 - Easy */

/* Q1: Who is the senior most employee based on job title? */
SELECT title, last_name, first_name 
FROM employee
ORDER BY levels DESC
LIMIT 1;


/* Q2: Which countries have the most Invoices? */
SELECT COUNT(*) AS c, billing_country 
FROM invoice
GROUP BY billing_country
ORDER BY c DESC;


/* Q3: What are top 3 values of total invoice? */

SELECT total 
FROM invoice
ORDER BY total DESC


/* Q4: Which city has the best customers? */
SELECT billing_city, SUM(total) AS InvoiceTotal
FROM invoice
GROUP BY billing_city
ORDER BY InvoiceTotal DESC
LIMIT 1;


/* Q5: Who is the best customer? */
SELECT c.customer_id, first_name, last_name, SUM(total) AS total_spending
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spending DESC
LIMIT 1;

/* Q6: What is the average total spending per invoice for each country? */
SELECT billing_country, AVG(total) AS avg_total_spending
FROM invoice
GROUP BY billing_country
ORDER BY avg_total_spending DESC;

/* Q7: How many unique genres are there in the music store, and what are they? */
SELECT COUNT(DISTINCT genre_id) AS unique_genre_count,
       GROUP_CONCAT(DISTINCT name ORDER BY name ASC SEPARATOR ', ') AS unique_genres
FROM genre;

/* Q8: What are the top 5 customers based on their total spending, along with their rank? */
SELECT customer_id, first_name, last_name, total_spending,
       RANK() OVER (ORDER BY total_spending DESC) AS spending_rank
FROM (
    SELECT c.customer_id, c.first_name, c.last_name, SUM(total) AS total_spending
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS customer_spending
ORDER BY spending_rank ASC
LIMIT 5;



