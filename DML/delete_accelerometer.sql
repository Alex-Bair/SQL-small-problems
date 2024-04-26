DELETE FROM parts
WHERE device_id = 1;

DELETE FROM devices
WHERE id = 1;

-- Further Exploration

-- If we had defined the devices table to ON DELETE CASCADE when defining the FOREIGN KEY in the parts table, we could have deleted rows from both tables simultaneously by just deleting the Accelerometer row from the devices table.
