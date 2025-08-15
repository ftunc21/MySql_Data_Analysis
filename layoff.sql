Select * From layoffs;

CREATE Table layoffs_staging LIKE layoffs;

Select * From layoffs_staging;

INSERT layoffs_staging Select * From layoffs;

/*1. Remove Duplicates*/
WITH duplicate_cte AS
(
Select * ,
 ROW_NUMBER() OVER(
 Partition BY company , location, industry , total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) AS row_num 
 from layoffs_staging /* if row_num > 1 then this is a duplicate */
)
SELECT * FROM duplicate_cte
WHERE row_num>1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO layoffs_staging2
	Select * ,
	 ROW_NUMBER() OVER(
	 Partition BY company , location, industry , total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) AS row_num 
	 from layoffs_staging;
 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM layoffs_staging2 WHERE row_num > 1;
SET SQL_SAFE_UPDATES = 1;  

SELECT * FROM layoffs_staging2 WHERE row_num > 1;

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*2.Standardize the Data*/

SELECT DISTINCT(TRIM(company)) FROM layoffs_staging2;

SET SQL_SAFE_UPDATES = 0;
UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT *
from layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country =  TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT * 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/



/*3.Null Values or Blank Values*/
SELECT *
FROM layoffs_staging2
WHERE industry is null or industry = '';

SELECT * FROM layoffs_staging2 WHERE company = 'Airbnb';


SELECT * FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry is null OR t1.industry = '') 
AND t2.industry is not null;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';


UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry is null OR t1.industry = '') 
AND t2.industry is not null;

SELECT *
FROM layoffs_staging2
WHERE industry is null or industry = '';

DELETE FROM
layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*Remove Any Columns or rows */
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;




