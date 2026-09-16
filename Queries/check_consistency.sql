-- This file will show the process of checking for consistency.

-- Check consistency and fix for transaction_id
SELECT transaction_id
FROM raw_cafe
WHERE transaction_id NOT REGEXP('^TXN_[0-9]{7}$');

-- Check consistency and fix for item
SELECT DISTINCT item
FROM raw_cafe;

UPDATE raw_cafe
SET item = NULL
WHERE item = 'UNKNOWN' OR item = 'ERROR';

-- Check consistency and fix for quantity.
SELECT DISTINCT quantity
FROM raw_cafe
WHERE quantity NOT REGEXP('^[0-9]+$');

UPDATE raw_cafe
SET quantity = NULL
WHERE quantity = 'UNKNOWN' OR quantity = 'ERROR';

-- Check consistency and fix for price_per_unit.
SELECT DISTINCT price_per_unit
FROM raw_cafe
WHERE price_per_unit NOT REGEXP('^[0-9]+\\.[0-9]+$');

UPDATE raw_cafe
SET price_per_unit = NULL
WHERE price_per_unit = 'UNKNOWN' OR price_per_unit = 'ERROR';

-- Check consistency and fix for total_spent.
SELECT DISTINCT total_spent
FROM raw_cafe
WHERE total_spent NOT REGEXP('^[0-9]+\\.[0-9]+$');

UPDATE raw_cafe
SET total_spent = NULL
WHERE total_spent = 'UNKNOWN' OR total_spent = 'ERROR';

-- Check consistency and fix for payment_method.
SELECT DISTINCT payment_method
FROM raw_cafe;

UPDATE raw_cafe
SET payment_method = NULL
WHERE payment_method = 'UNKNOWN' OR payment_method = 'ERROR';

-- Check consistency and fix for location.
SELECT DISTINCT location
FROM raw_cafe;

UPDATE raw_cafe
SET location = NULL
WHERE location = 'UNKNOWN' OR location = 'ERROR';

-- Check consistency and fix for transaction_date.
SELECT DISTINCT transaction_date
FROM raw_cafe
WHERE transaction_date NOT REGEXP('^[0-9]{4}-[0-9]{2}-[0-9]{2}$');

UPDATE raw_cafe
SET transaction_date = NULL
WHERE transaction_date = 'UNKNOWN' OR transaction_date = 'ERROR';