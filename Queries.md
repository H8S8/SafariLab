# Safari Lab Queries


1) The names of the animals in a given enclosure ('Water').

```sql
SELECT name FROM animals 
WHERE enclosureId = (
	SELECT id FROM enclosures 
	WHERE name = 'Water');

-- solution

SELECT animals.name FROM animals
INNER JOIN enclosures ON animals.enclosure_id = enclosures.id
WHERE enclosures.name = 'Reptile House';
```

2) The names of the staff working in a given enclosure ('Temperate forest')

```sql
SELECT name FROM employees 
WHERE id IN (
	SELECT employeeId FROM assignments 
	WHERE enclosureId = 3);

-- solution

SELECT name FROM employees
INNER JOIN assignments ON employees.id = assignments.employee_id
WHERE assignments.enclosure_id = 1;
```

3) The names of staff working in enclosures which are closed for maintenance

```sql
SELECT name FROM employees 
WHERE id IN (
	SELECT employeeId FROM assignments 
	WHERE enclosureId IN (
	SELECT id FROM enclosures
	WHERE closedForMaintenance = TRUE
	));
```

4) The name of the enclosure where the oldest animal lives. If there are two animals who are the same age choose the first one alphabetically.

```sql
SELECT enclosures.name FROM enclosures
INNER JOIN animals ON enclosures.id = animals.enclosureId
ORDER BY animals.age DESC, animals.name
LIMIT 1;
```

5) The number of different animal types a given keeper has been assigned to work with.

```sql
SELECT COUNT(DISTINCT animals.type) FROM animals WHERE enclosureId IN (
SELECT enclosures.id FROM assignments INNER JOIN enclosures ON assignments.enclosureId = enclosures.id WHERE assignments.employeeId = (
SELECT id FROM employees WHERE name = 'Zsolt'));
```

6) The number of different keepers who have been assigned to work in a given enclosure

```sql
SELECT COUNT(DISTINCT employeeId) FROM assignments 
WHERE enclosureId = (
	SELECT id FROM enclosures WHERE name = 'Temperate Forest');
```

7) The names of the other animals sharing an enclosure with a given animal (eg. find the names of all the animals sharing the big cat field with Tony)

```sql
SELECT name FROM animals 
WHERE (enclosureId = (
	SELECT enclosureId FROM animals WHERE name = 'Gabe'))
	AND name != 'Gabe';
```

