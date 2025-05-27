CREATE DATABASE Keyhole2;

-- Connect to the database
\c Keyhole2;

-- Create a sample table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (name, email) VALUES ('Alice Johnson', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob Smith', 'bob@example.com');
INSERT INTO users (name, email) VALUES ('Alice ', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob ', 'bob@example.com');

-- Create another table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL
);

-- Insert sample orders
INSERT INTO orders (user_id, total_amount) VALUES (1, 50.00);
INSERT INTO orders (user_id, total_amount) VALUES (2, 75.50);
