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
