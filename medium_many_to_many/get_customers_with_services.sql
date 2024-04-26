SELECT DISTINCT c.*
           FROM customers AS c
     INNER JOIN customers_services AS cs
             ON c.id = cs.customer_id
       ORDER BY c.id;