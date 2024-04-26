SELECT s.description, COUNT(cs.customer_id) FROM services AS s
INNER JOIN customers_services AS cs
        ON s.id = cs.service_id
  GROUP BY s.description
    HAVING COUNT(cs.customer_id) >= 3;