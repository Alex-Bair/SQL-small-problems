-- 1 generate listing of parts that currently belong to a device

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NOT NULL;

-- 2 generate listing ofparts that don't belong to a device

SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NULL;