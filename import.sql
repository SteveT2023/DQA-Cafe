-- This file will show the process of importing the dataset.

-- Create the table.
CREATE TABLE raw_cafe
(
	transaction_id VARCHAR(100) PRIMARY KEY,
    item VARCHAR(100),
    quantity VARCHAR(100),
    price_per_unit VARCHAR(100),
    total_spent VARCHAR(100),
    payment_method VARCHAR(100),
    location VARCHAR(100),
    transaction_date VARCHAR(100)
);

-- Import the dataset into the table.
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:path/to/my/file/raw_cafe.csv'
INTO TABLE cafe.raw_cafe
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;