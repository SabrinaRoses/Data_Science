-- Cleaning review
-- Steps -----
-- 1. Copy the data
-- 1. Remove duplicates values
-- 2. Standardize Data
-- 3. Null values or Blank Values
-- 4. Remove non-useful columns

-- look at the data
SELECT * 
FROM lay;

-- Copy the original table to a new table
CREATE TABLE lay2
LIKE lay;

-- Insert values from original table
INSERT lay2
SELECT * 
FROM lay;

-- 1 -- Removing duplicates: Looking for duplicates
-- I will do a row_number to count each group into the column ( PARTITION BY all columns)

SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions) AS row_num
FROM lay2;

-- Use a CTE to checking this values
WITH duplicate_cte AS
(
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions) AS row_num
FROM lay2
)
SELECT *  
FROM duplicate_cte 
WHERE row_num > 1;

SELECT * 
FROM lay2
WHERE company LIKE 'Cazoo';

-- Create a new table to delete the duplicates values
-- Go to the table, and make a create statement
CREATE TABLE `lay3` ( -- Change the name of the column
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT -- Create the table for researching
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT  *
FROM lay3;

-- Now I will insert the previuos duplicte search
INSERT INTO lay3
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions) AS row_num
FROM lay2;

-- Disable safe mode temporarily - Enbable Switch to 1
SET SQL_SAFE_UPDATES = 0;

-- Finally Delete Duplicates Values
DELETE FROM lay3
WHERE row_num > 1;

SELECT * 
FROM lay3; 

-- Standardizing data

-- Removing Blank Spaces
SELECT
TRIM(company) AS company,
TRIM(location) AS location,
TRIM(industry) AS industry,
TRIM(stage) AS stage,
TRIM(country) AS country
FROM lay3;

UPDATE lay3
SET company = TRIM(company);
SET location = TRIM(location);
SET industry = TRIM(industry);
SET stage = TRIM(stage);
SET country = TRIM(country);

SELECT DISTINCT industry
FROM lay3
ORDER BY industry;

-- There are cryptos written in two ways, we pass everything to a single form
SELECT industry
FROM lay3
WHERE industry LIKE 'Crypto%' ; 

UPDATE lay3
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- TRAILING: Removes the specified characters from the end (to the right) of the string.
SELECT distinct country, TRIM(TRAILING '.' FROM country)
FROM lay3
ORDER BY 1;

UPDATE lay3
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT * 
FROM lay3;

-- Convert column date to date time
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM lay3;

UPDATE lay3
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE lay3
MODIFY COLUMN `date` DATE; 

SELECT * 
FROM lay3;

-- NUll / Blank values

UPDATE lay3
SET industry = NULL 
WHERE industry =  ''; 

SELECT * 
FROM lay3
WHERE (industry IS NULL OR industry = '' );

SELECT t1.industry, t2.industry
FROM lay3 t1
JOIN lay t2
	ON t1.company =  t2.company
WHERE (t1.industry IS NULL )
AND t2.industry is NOT NULL;

UPDATE lay3 t1
JOIN lay3 t2
    ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL;

SELECT  * 
FROM lay3
WHERE company LIKE 'Bally%';

SELECT * 
FROM lay3;

-- Removing columns and rows
SELECT * 
FROM lay3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 

DELETE 
FROM lay3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM lay3;

-- DROP the column ROW_num that we create before
ALTER TABLE lay3
DROP COLUMN row_num;




