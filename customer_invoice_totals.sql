CREATE MATERIALIZED VIEW IF NOT EXISTS customer_invoice_totals
	AS
SELECT c.customer_id, c.first_name, c.last_name, SUM(i.total) as total_invoice
FROM customer AS c
	RIGHT JOIN invoice AS i ON i.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name, c.customer_id
ORDER BY total_invoice DESC
	WITH DATA;