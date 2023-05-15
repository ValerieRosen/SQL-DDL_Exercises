DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    encrypted_password TEXT NOT NULL,
    preferred_region_id INT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    text TEXT,
    location TEXT,
    user_id INT REFERENCES users, 
    region_id INT REFERENCES regions, 
    category_id INT REFERENCES categories
);

