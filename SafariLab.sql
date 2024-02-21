DROP IF EXISTS assignments;
DROP IF EXISTS animals;
DROP IF EXISTS employees;
DROP IF EXISTS enclosures;

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosureId INT REFERENCES enclosures(id)
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employeeId INT REFERENCES employees(id),
    enclodureId INT REFERENCES enclosures(id),
    day VARCHAR(255)
);