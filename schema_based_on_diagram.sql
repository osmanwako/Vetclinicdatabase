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
    admitted_at timestamp,
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
    total_amount DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY(id)
  );

CREATE TABLE
  invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    PRIMARY KEY(id)
  );

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_has_treatments (medical_history_id);
CREATE INDEX ON medical_histories_has_treatments (treatment_id);