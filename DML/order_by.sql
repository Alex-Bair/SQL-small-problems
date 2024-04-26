         SELECT d.name, COUNT(p.device_id)
           FROM devices AS d
LEFT OUTER JOIN parts AS p
             ON p.device_id = d.id
       GROUP BY d.name
       ORDER BY d.name DESC;