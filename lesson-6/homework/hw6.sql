--1-task
--Finding Distinct Values
SELECT DISTINCT
       CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
       CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

--2-task
--Query that removes Rows with All Zeroes
SELECT A,B,C,D
FROM TestMultipleZero
WHERE NOT(A = 0 AND B = 0 AND C = 0 AND D =0);

--3-task
--SELECT Person with odd ids
SELECT id, name
FROM section1
WHERE id % 2 = 1;


--4-task
--SELECT Person with the smallest id
SELECT TOP 1 *
FROM section1
ORDER BY id;

--5-task
--SELECT Person with the highest id
SELECT TOP 1 *
FROM section1
ORDER BY id DESC;

--6-task
--Select People whose name starts with b
SELECT *
FROM section1
WHERE name like 'b%';

--7-task
--Query that returns only the rows where the code contains the literal underscore _ (not as a wildcard)
SELECT Code
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';