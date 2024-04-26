UPDATE parts
SET device_id = 1
WHERE id = 12 OR id = 11;

-- Further Exploration
UPDATE parts
   SET device_id = 2
 WHERE part_number = (SELECT min(part_number) 
                        FROM parts);