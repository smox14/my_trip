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

CREATE TABLE places(
  id SERIAL PRIMARY KEY,
  place_name TEXT,
  google_place_id TEXT,
  latitudes DECIMAL(8,6),
  longitudes DECIMAL(9,6),
  formatted_address TEXT,
  rating DECIMAL(2,1),
  user_ratings_total INT, 
  photo_reference TEXT,
  trip_id INT NOT NULL,
  FOREIGN KEY (trip_id) REFERENCES trips(id)
);


    

INSERT
INTO places(place_name, google_place_id, latitudes, longitudes,formatted_address, rating, user_ratings_total, photo_reference, trip_id)
VALUES (
  'Devasathan',
  'ChIJccNQThGZ4jAR5AQAkROwMlM',
  13.7524102,
  100.5006067,
  '268 Dinso Rd, Sao Chingcha, Phra Nakhon, Bangkok 10200, Thailand',
  4.5,
  245,
  'Aap_uEA7oJrdfky1EZFwk3BHXxG1Asm9cGgFuDW4QwQIl6fEzmaVdpFbxHOx_WpV6lqa-a54SdOIr2kWBW8KXz0g6bkkSP-vJhuBMHOC7s89QbUS2nekb6lcM0JtMkwRhrSQcbjcAqzctEkYpwwRoWgQRI8YY4TqD_U17cU4PPcPbbpO350b',
  1
);