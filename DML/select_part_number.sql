SELECT * FROM parts
WHERE trim(FROM to_char(part_number, '99999'))  LIKE '3%';

-- LS Solution - converts part_number to text data type just for query

SELECT * FROM parts 
WHERE part_number::text LIKE '3%';