# Safari Lab Queries


1) The names of the animals in a given enclosure ('Water').

```sql
SELECT name FROM animals 
WHERE enclosureId = (
	SELECT id FROM enclosures 
	WHERE name = 'Water');
```

2) The names of the staff working in a given enclosure ('Temperate forest')

```sql
SELECT name FROM employees 
WHERE id IN (
	SELECT employeeId FROM assignments 
	WHERE enclosureId = 3);
```

3) The names of staff working in enclosures which are closed for maintenance

```sql


```

4) The name of the enclosure where the oldest animal lives. If there are two animals who are the same age choose the first one alphabetically.

```sql


```

5) The number of different animal types a given keeper has been assigned to work with.

```sql


```

6) The number of different keepers who have been assigned to work in a given enclosure

```sql


```

7) The names of the other animals sharing an enclosure with a given animal (eg. find the names of all the animals sharing the big cat field with Tony)

```sql


```

