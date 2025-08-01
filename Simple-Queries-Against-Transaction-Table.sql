-- Init and manage table
CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  status VARCHAR(100),
  amount integer
);

-- Delete the entire table (uncomment to use)
--DROP TABLE transactions;

-- Delete all records from the table (uncomment to use)
--DELETE FROM transactions; 

-----------

-- Add 80 records where status is 'Approved'
-- id is an auto-incrementing primary key

WITH RECURSIVE nums AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM nums WHERE n < 80
)
INSERT INTO transactions (status, amount)
SELECT 'Approved', 100
FROM nums;

-----------

-- Add 60 records where amount is greater than 1000

WITH RECURSIVE nums AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM nums WHERE n < 60
)
INSERT INTO transactions (status, amount)
SELECT 'Declined', 1010
FROM nums;

-----------

-- Add 30 records where status is 'Appproved' AND amount is greater than 1000

WITH RECURSIVE nums AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM nums WHERE n < 30
)
INSERT INTO transactions (status, amount)
SELECT 'Approved', 1010
FROM nums;

-----------

-- Returns all records
SELECT * FROM transactions;

--Returns 170
SELECT COUNT(*) FROM transactions;

-- Returns 170
SELECT COUNT(*)
FROM transactions
WHERE status = 'Approved' or amount > 1000;

-- Returns 30
SELECT COUNT(*)
FROM transactions
WHERE status = 'Approved' and amount > 1000;

-- Returns the 10 records where 'id' is between 150 (inclusive) and 160 (exclusive)
SELECT *
FROM transactions
WHERE id >= 150 and id < 160;

