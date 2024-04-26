-- Current expected income level

SELECT SUM(price)
FROM services AS s
INNER JOIN customers_services AS cs
        ON s.id = cs.service_id
WHERE price > 100.00;

-- Hypothetical max income level

SELECT COUNT(id) * 
  (SELECT SUM(price) FROM services
  WHERE price > 100)
  AS sum
FROM customers;

SELECT SUM(s.price)
FROM services AS s
CROSS JOIN customers AS c
WHERE price > 100;