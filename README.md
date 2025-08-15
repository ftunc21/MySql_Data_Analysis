# 📊 Layoffs Data Analysis with MySQL

<div align="right">
  <strong>🌐 Language:</strong> 
  <a href="README.md">🇺🇸 English</a> | 
  <a href="README.tr.md">🇹🇷 Türkçe</a>
</div>

## Overview
This project demonstrates a comprehensive data analysis workflow using MySQL, focusing on layoffs data from various companies worldwide. The analysis includes data cleaning, standardization, and exploratory data analysis to extract meaningful insights from the dataset.

## Dataset
- **Source**: `layoffs.csv` - Contains layoff data from companies globally
- **Size**: 2,361 records
- **Time Period**: 2020-2023
- **Columns**: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions

## Project Structure

### 1. Data Cleaning (`layoff.sql`)
The data cleaning process follows industry best practices:

- **Duplicate Removal**: Used ROW_NUMBER() window function to identify and remove duplicate records
- **Data Standardization**: 
  - Trimmed whitespace from company names
  - Standardized industry names (e.g., 'Crypto Currency' → 'Crypto')
  - Fixed country names (removed trailing periods from 'United States.')
  - Converted date strings to proper DATE format
- **Null Value Handling**: 
  - Filled missing industry data using company-location matching
  - Removed records with no layoff information (both total and percentage null)

### 2. Exploratory Data Analysis (`data_analysis_mysql.sql`)
Comprehensive analysis covering:

- **Overall Statistics**: Maximum layoffs, percentage analysis
- **Company Analysis**: Total layoffs by company, companies with 100% layoffs
- **Industry Analysis**: Most affected industries
- **Geographic Analysis**: Layoffs by country and location
- **Temporal Analysis**: Trends over time, monthly patterns
- **Company Rankings**: Top 5 companies by year using window functions

## Key Findings

### Top Companies by Total Layoffs
1. **Amazon** - Highest total layoffs
2. **Google** - Significant workforce reduction
3. **Meta** - Major restructuring

### Most Affected Industries
1. **Consumer** industry leads in total layoffs
2. **Retail** and **Transportation** follow
3. **Technology** sector widely impacted

### Geographic Impact
- **United States** accounts for majority of layoffs
- Global impact across multiple countries
- Tech hubs most affected

### Timeline Analysis
- **2022-2023** peak layoff period
- Monthly trends showing seasonal patterns
- Post-IPO companies particularly affected

## Technical Skills Demonstrated

### SQL Techniques Used
- **Window Functions**: ROW_NUMBER(), DENSE_RANK(), PARTITION BY
- **Common Table Expressions (CTEs)**: Complex queries with temporary result sets
- **Data Type Conversion**: STR_TO_DATE(), ALTER TABLE MODIFY
- **String Functions**: TRIM(), SUBSTRING(), LIKE patterns
- **Aggregate Functions**: SUM(), MAX(), MIN(), AVG(), COUNT()
- **JOIN Operations**: Self-joins for data validation
- **Data Manipulation**: INSERT, UPDATE, DELETE operations

### Data Analysis Concepts
- Data quality assessment
- Duplicate detection and removal
- Data standardization techniques
- Exploratory data analysis methodology
- Statistical analysis and ranking

## Files Description
- `layoffs.csv` - Original dataset
- `layoff.sql` - Data cleaning and preprocessing script
- `data_analysis_mysql.sql` - Exploratory data analysis queries

## How to Use
1. Import `layoffs.csv` into MySQL database
2. Run `layoff.sql` for data cleaning
3. Execute `data_analysis_mysql.sql` for analysis
4. Review results and insights

---
*This project showcases end-to-end data analysis skills using MySQL, from raw data cleaning to meaningful business insights.*

