SELECT DISTINCT c.* FROM customers AS c
LEFT OUTER JOIN customers_services AS cs
             ON c.id = cs.customer_id
          WHERE cs.service_id IS NULL;

-- Further Exploration

SELECT DISTINCT c.*, s.* FROM customers AS c
LEFT OUTER JOIN customers_services AS cs
             ON c.id = cs.customer_id
FULL OUTER JOIN services AS s
             ON s.id = cs.service_id
WHERE c.id IS NULL OR s.id IS NULL;