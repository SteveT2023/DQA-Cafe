-- This file will show the process of checking for uniqueness.

-- Check for duplicates for transaction_id.
SELECT transaction_id, COUNT(*) AS dup_count
FROM raw_cafe
GROUP BY transaction_id
HAVING COUNT(*) >= 2;

-- Since there is no duplicates, display the result for evidence.
SELECT COUNT(*) AS dup_group_of_values
FROM
(
	SELECT transaction_id, COUNT(*)
	FROM raw_cafe
	GROUP BY transaction_id
	HAVING COUNT(*) >= 2
) AS q;