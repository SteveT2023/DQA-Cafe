-- This file will show the process of checking for accuracy.

-- Check and fix accuracy for quantity.
SELECT quantity, (total_spent / price_per_unit) AS Correct_Quantity
FROM raw_cafe
WHERE quantity != (total_spent / price_per_unit);

UPDATE raw_cafe
SET Quantity = (total_spent / price_per_unit)
WHERE Quantity IS NULL AND price_per_unit REGEXP('^[0-9]+\\.[0-9]+$') AND total_spent REGEXP('^[0-9]+\\.[0-9]+$');

-- Check and fix accuracy for price_per_unit.
SELECT price_per_unit, (total_spent / quantity) AS Correct_Price
FROM raw_cafe
WHERE price_per_unit != (total_spent / quantity);

UPDATE raw_cafe
SET price_per_unit = (total_spent / quantity)
WHERE price_per_unit IS NULL AND total_spent REGEXP('^[0-9]+\\.[0-9]+$') AND quantity REGEXP('^[0-9]+$');

-- Check and fix accuracy for total_spent.
SELECT total_spent, (price_per_unit * quantity) AS Correct_Total
FROM raw_cafe
WHERE total_spent != (price_per_unit * quantity);

UPDATE raw_cafe
SET total_spent = (price_per_unit * quantity)
WHERE total_spent IS NULL AND price_per_unit REGEXP('^[0-9]+\\.[0-9]+$') AND quantity REGEXP('^[0-9]+$');