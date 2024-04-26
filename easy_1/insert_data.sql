INSERT INTO birds (name, age, species)
VALUES
('Charlie', 3, 'Finch'),
('Allie', 5, 'Owl'),
('Jennifer', 3, 'Magpie'),
('Jamie', 4, 'Owl'),
('Roy', 8, 'Crow');

-- Further exploration: 
-- If column names are not provides to INSERT INTO, then the default order of the columns are used.
-- If there are fewer values provided than columns, then the remaining columns are not supplied values.