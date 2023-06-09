CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY(id)
);

--CREATE TABLE Label
CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
);

--CREATE TABLE Book
CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(200) NOT NULL,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(200) NOT NULL,
  cover_state VARCHAR(4) NOT NULL,
  PRIMARY KEY(id)
);

-- Music Album class table
CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id)
);

-- Genre class table
CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);