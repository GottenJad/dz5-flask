DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    age INTEGER NOT NULL CHECK (age >= 18 AND age <= 100),
    town VARCHAR(100) NOT NULL
);

INSERT INTO users (name, surname, age, town)
SELECT
    (ARRAY['Johny', 'David', 'Dasha', 'Gleb', 'Regina'])[floor(random() * 5 + 1)],
    (ARRAY['Paulo', 'Downy', 'Goryunova', 'Ilalova', 'Tovpeko'])[floor(random() * 5 + 1)],
    floor(random() * 50 + 20)::int,  
    (ARRAY['SPB', 'Sochi', 'Moscow', 'NSK', 'Samara'])[floor(random() * 5 + 1)]
FROM generate_series(1, 100000) AS i;