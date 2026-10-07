CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  email TEXT UNIQUE,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS places (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  lat DOUBLE PRECISION NOT NULL,
  lng DOUBLE PRECISION NOT NULL,
  tags TEXT[],
  popularity INTEGER,
  embedding VECTOR(384)
);

CREATE TABLE IF NOT EXISTS user_feedback (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  place_id INTEGER REFERENCES places(id),
  liked BOOLEAN NOT NULL,
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS saved_places (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  place_id INTEGER REFERENCES places(id),
  custom_tags TEXT[],
  created_at TIMESTAMP DEFAULT now()
);