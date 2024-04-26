SELECT c.name, string_agg(s.description, ', ') AS services
FROM customers AS c
LEFT OUTER JOIN customers_services AS cs
             ON c.id = cs.customer_id
LEFT OUTER JOIN services AS s
             ON s.id = cs.service_id
GROUP BY c.id;

-- Further Exploration
-- Hint: use the window funtion lag and a CASE statement. Think of it like hiding the name IF it's the same as the row above.