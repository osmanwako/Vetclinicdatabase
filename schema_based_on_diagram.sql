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

CREATE TABLE
  medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at date,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(120),
    PRIMARY KEY(id)
  );

CREATE TABLE
  medical_treatments(
    id INT GENERATED ALWAYS AS IDENTITY,
    medical_history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(id)
  );

CREATE TABLE
  invoices(
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount VARCHAR(20),
    generated_at DATE,
    payed_at DATE,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY(id)
  );

CREATE TABLE
  invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(id)
  );