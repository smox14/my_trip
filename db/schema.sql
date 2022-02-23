CREATE DATABASE my_trip_db;
\c my_trip_db

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username TEXT,
  email TEXT,
  password_digest TEXT
);

CREATE TABLE trips(
  id SERIAL PRIMARY KEY,
  trip_name TEXT,
  from_date DATE,
  to_date DATE,
  image_url TEXT,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);



