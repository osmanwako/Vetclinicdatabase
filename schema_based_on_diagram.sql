CREATE TABLE
  patients(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(90),
    date_of_birth date,
    PRIMARY KEY(id)
  );


CREATE TABLE
  treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(120),
    type VARCHAR(120),
    PRIMARY KEY(id)
  );