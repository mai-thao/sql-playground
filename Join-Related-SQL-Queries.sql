-- Script to learn how join-related SQL concepts work!

CREATE TABLE t1 (
  name VARCHAR(100)
);
  
CREATE TABLE t2 (
  name VARCHAR(100)
);

-- Delete the entire table (uncomment to use)
--DROP TABLE t1;
--DROP TABLE t2;

-- Delete all records from the table (uncomment to use)
--DELETE FROM t1;
--DELETE FROM t2;

INSERT INTO t1 VALUES ('A'),('B'),('C');
INSERT INTO t2 VALUES ('B'),('C'),('D');

SELECT * FROM t1;
SELECT * FROM t2;

-- RIGHT JOIN: Include all names from 2nd table even if no match in 1st table
SELECT t1.name, t2.name FROM t1 RIGHT JOIN t2 ON t1.name = t2.name;
/*
B,B
C,C
null,D
*/

-- LEFT JOIN: Include all names from 1st table even if no match in 2nd table
SELECT t1.name, t2.name FROM t1 LEFT JOIN t2 ON t1.name = t2.name;
/*
A,null
B,B
C,C
*/

-- INNER JOIN: Include only names that exists in both tables
SELECT t1.name, t2.name FROM t1 INNER JOIN t2 ON t1.name = t2.name;
/*
B,B
C,C
*/

-- FULL OUTER JOIN: Return all rows from both tables
SELECT t1.name, t2.name FROM t1 FULL OUTER JOIN t2 ON t1.name = t2.name;
/*
A,null
B,B
C,C
null,D
*/

-- CROSS JOIN: Pairs every row in 1st table with every row in 2nd table
SELECT t1.name, t2.name FROM t1 CROSS JOIN t2;
/*
A,B
A,C
A,D
B,B
B,C
B,D
C,B
C,C
C,D
*/

-- Equivalent to CROSS JOIN syntax above
SELECT * FROM t1, t2;
