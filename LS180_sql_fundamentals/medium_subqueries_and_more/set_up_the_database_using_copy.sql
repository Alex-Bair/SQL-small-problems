CREATE TABLE bidders (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    initial_price DECIMAL(6, 2) NOT NULL CHECK (initial_price BETWEEN 0.01 AND 1000.00),
    sales_price DECIMAL(6, 2) CHECK (sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
    id SERIAL PRIMARY KEY,
    bidder_id INTEGER NOT NULL REFERENCES bidders (id) ON DELETE CASCADE,
    item_id INTEGER NOT NULL REFERENCES items (id) ON DELETE CASCADE,
    amount DECIMAL(6, 2) NOT NULL CHECK (amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders from 'bidders.csv' WITH HEADER CSV
\copy items from 'items.csv' WITH HEADER CSV
\copy bids from 'bids.csv' WITH HEADER CSV