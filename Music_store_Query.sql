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


