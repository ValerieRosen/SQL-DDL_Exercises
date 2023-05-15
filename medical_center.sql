DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT,
    specialty TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT,
    insurance TEXT,
    birthday DATE
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors, 
    patient_id INT REFERENCES patients, 
    date DATE
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES visits,
    disease_id INT REFERENCES diseases,
    notes TEXT
);
