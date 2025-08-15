Select * from layoffs_staging2;

Select MAX(total_laid_off), MAX(percentage_laid_off) from layoffs_staging2;

Select * from layoffs_staging2 WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

Select * from layoffs_staging2 WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

Select company , SUM(total_laid_off) from layoffs_staging2
Group By company
Order By SUM(total_laid_off) desc;

Select MIN(`date`), MAX(`date`) from layoffs_staging2;


Select industry , SUM(total_laid_off) from layoffs_staging2
Group By industry
Order By SUM(total_laid_off) desc;

Select country , SUM(total_laid_off) from layoffs_staging2
Group By country
Order By SUM(total_laid_off) desc;

Select YEAR(`date`) , SUM(total_laid_off) from layoffs_staging2
Group By YEAR(`date`)
Order By YEAR(`date`) desc;

Select stage , SUM(total_laid_off) from layoffs_staging2
Group By stage
Order By 2 desc;

SELECT company , AVG(percentage_laid_off) from layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


SELECT substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off) from layoffs_staging2
Group By `MONTH`
ORDER BY 2 DESC;  



Select company , YEAR(`date`), SUM(total_laid_off) from layoffs_staging2
Group By company,`date`,  YEAR(`date`)
ORDER BY 3 DESC ;





WITH Company_Year(company, years, total_laid_off) AS
(
Select company , YEAR(`date`), SUM(total_laid_off) from layoffs_staging2
Group By company,  YEAR(`date`)
), Company_Year_Rank AS
(
SELECT * , DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC)  AS Ranking
FROM Company_Year
WHERE years IS NOT NULL

)
Select * from Company_Year_Rank
WHERE Ranking <= 5;

