-- This file will show the process of checking for completeness.

-- Create a procedure to count for nulls, blanks, and whitespaces.
DELIMITER //
	CREATE PROCEDURE check_completeness(col_name VARCHAR(100))
		BEGIN
			SET @query = CONCAT(
				'INSERT INTO result_completeness ',
                'SELECT ',
					'"', col_name, '" AS column_name, ',
					'SUM(CASE WHEN ', col_name, ' IS NULL THEN 1 ELSE 0 END) AS null_count, ',
					'SUM(CASE WHEN ', col_name, ' = "" THEN 1 ELSE 0 END) AS blank_count, ',
					'SUM(CASE WHEN TRIM(', col_name, ') = "" AND ', col_name, ' != "" THEN 1 ELSE 0 END) AS whitespace_count ',
                'FROM raw_cafe'
            );
            
            PREPARE stmt FROM @query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
		END //
DELIMITER ;

-- Create a temporary table to display result.
CREATE TEMPORARY TABLE result_completeness
(
	column_name VARCHAR(100),
    null_count VARCHAR(100),
    blank_count VARCHAR(100),
    whitespace_count VARCHAR(100)
);

-- Call procedure.
CALL check_completeness('transaction_id');
CALL check_completeness('item');
CALL check_completeness('quantity');
CALL check_completeness('price_per_unit');
CALL check_completeness('total_spent');
CALL check_completeness('payment_method');
CALL check_completeness('location');
CALL check_completeness('transaction_date');

-- Display result
SELECT *
FROM result_completeness;

-- Fix
UPDATE raw_cafe
SET quantity = NULL
WHERE quantity = "";

UPDATE raw_cafe
SET price_per_unit = NULL
WHERE price_per_unit = "";

UPDATE raw_cafe
SET total_spent = NULL
WHERE total_spent = "";

UPDATE raw_cafe
SET payment_method = NULL
WHERE payment_method = "";

UPDATE raw_cafe
SET location = NULL
WHERE location = "";

UPDATE raw_cafe
SET transaction_date = NULL
WHERE transaction_date = "";
