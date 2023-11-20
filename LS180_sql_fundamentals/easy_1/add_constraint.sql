ALTER TABLE birds
ADD CHECK (age > 0);

INSERT INTO birds (name, age, species)
VALUES
('Bob', -1, 'Dodo');