-- This file will show the process of checking for validity.

-- Give the columns the correct data type.
ALTER TABLE raw_cafe
MODIFY COLUMN quantity INT;

ALTER TABLE raw_cafe
MODIFY COLUMN price_per_unit DECIMAL(10, 2);

ALTER TABLE raw_cafe
MODIFY COLUMN total_spent DECIMAL(10, 2);

ALTER TABLE raw_cafe
MODIFY COLUMN transaction_date DATE;

-- Check if any dates is incorrect.
SELECT transaction_date, STR_TO_DATE(transaction_date, '%Y-%m-%d') IS NOT NULL AS Date_Validity
FROM raw_cafe
WHERE STR_TO_DATE(transaction_date, '%Y-%m-%d') IS NULL;