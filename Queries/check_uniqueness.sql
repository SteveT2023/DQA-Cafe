-- This file will show the process of checking for uniqueness.

-- Check for duplicates for transaction_id.
SELECT transaction_id, COUNT(*) AS dup_count
FROM raw_cafe
GROUP BY transaction_id
HAVING COUNT(*) >= 2;
