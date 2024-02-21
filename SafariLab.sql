DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS enclosures;

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
    enclosureId INT REFERENCES enclosures(id),
    day VARCHAR(255)
);

INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Water', 500, FALSE);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Desert', 50, FALSE);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Temperate Forest', 50, TRUE);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Rainforest', 10, FALSE);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Tundra', 30, FALSE);

INSERT INTO employees (name, employeeNumber) VALUES ('Anna', 37635);
INSERT INTO employees (name, employeeNumber) VALUES ('Zsolt', 37636);
INSERT INTO employees (name, employeeNumber) VALUES ('Colin', 37637);
INSERT INTO employees (name, employeeNumber) VALUES ('Richard', 37638);

INSERT INTO animals (name, type, age, enclosureId) VALUES ('ASCII', 'Axolotl', 5, 1);
INSERT INTO animals (name, type, age, enclosureId) VALUES ('Peggy', 'Pangolin', 19, 4);
INSERT INTO animals (name, type, age, enclosureId) VALUES ('Otto', 'Otter', 12, 1);
INSERT INTO animals (name, type, age, enclosureId) VALUES ('Chicken', 'Ptarmigan', 1, 5);

INSERT INTO assignments (employeeId, enclosureId, day) VALUES (1, 2, 'Monday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (2, 4, 'Monday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (2, 3, 'Tuesday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (2, 5, 'Wednesday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (3, 3, 'Tuesday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (4, 1, 'Monday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (4, 1, 'Tuesday');

