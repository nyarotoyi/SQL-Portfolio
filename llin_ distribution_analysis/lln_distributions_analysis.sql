-- Create the llin_analysis database
CREATE DATABASE llin_analysis;

-- Create the llin_distribution table
CREATE TABLE llin_distribution (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number_distributed INT,
    location VARCHAR(255),
    country VARCHAR(255),
    organization VARCHAR(255),
    year DATE,
    by_whom VARCHAR(255),
    country_code VARCHAR(50)
);

/* Proceed to upload the dataset by right-clicking the amf_distributions table,
selecting Table Data Import Wizard, and navigating to the folder with the data(amf_distributions.csv.
*/

-- Display all records from the amf_distributions table
SELECT * FROM amf_distributions;

-- STEP 1: Calculate the total number of LLINs distributed in each country
SELECT 
    country,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    country
ORDER BY 
    total_llins DESC;
/* This query provides the total LLINs distributed by each country, ordered from highest to lowest.
Uganda has the highest distributions(12869970), while Gabon had the lowest distributions(800)
*/

-- STEP 2: Average Number of LLINs Distributed per Event
-- Calculate the average number of LLINs distributed per distribution event
SELECT 
    AVG(number_distributed) AS average_distribution_per_event
FROM 
    amf_distributions;
-- On average, 215,413 LLINs were distributed per event.

-- STEP 3: Earliest and Latest Distribution Dates
/*Determine the earliest and latest distribution dates in the dataset
 Since we are working with years, we'll use MIN and MAX on the year column
 */
 
SELECT 
    MIN(year) AS earliest_date,
    MAX(year) AS latest_date
FROM 
    amf_distributions;
-- Earliest year is 2006, and the latest year is 2007. The data is only for these two years.

-- STEP 4: Trends and Patterns
-- Identify the total number of LLINs distributed by each organization
SELECT 
    by_whom,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    by_whom
ORDER BY 
    total_llins DESC;
-- This query lists organizations by the total LLINs they distributed, with the highest first.

-- Calculate the total number of LLINs distributed in each year
SELECT 
    year,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    year
ORDER BY 
    year ASC;
-- This query shows the total LLINs distributed per year, ordered from the earliest year.

-- STEP 5: Volume Insights
-- Find the location with the highest number of LLINs distributed
SELECT 
    country,
    location,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    country,       
    location
ORDER BY 
    total_llins DESC
LIMIT 1;
-- Western & Eastern Areas in Uganda had the highest distributions (12,752,620 LLINs).

-- Find the location with the lowest number of LLINs distributed
SELECT 
    country,
    location,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    country,
    location
ORDER BY 
    total_llins ASC
LIMIT 1;
-- Kumali District in Uganda had the lowest distribution with 150 LLINs.

-- Determine if there's a significant difference in the number of LLINs distributed by different organizations
SELECT 
    by_whom,
    AVG(number_distributed) AS average_distributions,
    STDDEV(number_distributed) AS stddev_distributions
FROM 
    amf_distributions
GROUP BY 
    by_whom
ORDER BY 
    average_distributions DESC;
    
/* 1. High Average LLINs
    - NMCP/Various has the highest average number of LLINs distributed (2,809,917.14),
      with a high standard deviation (4,190,045.29), indicating significant variability in distribution numbers.
 2. Low Variability
    - Rotary Club of Port Moresby has an average of 1,159,400.00 with a standard deviation of 0,
      meaning there is no variation in the distribution numbers for this organization.
 3. Moderate Average with High Variability
    - Concern Universal has an average distribution of 180,992.00 with a high standard deviation (136,041.95),
      suggesting considerable variation in the distribution numbers despite a high average.
 4. No Distribution Data Variability
    - Many organizations like Project Muso and Vass Medical Foundation have a standard deviation of 0,
      indicating constant distribution numbers.
 5. Comparative Analysis
    - NMCP/Various and Yet to be made public have the highest average distributions, but with high variability,
      indicating several instances of large distributions or potential data reporting issues.
    - Organizations with zero variability, such as Rotary Club of Port Moresby, have consistent distribution numbers,
      suggesting stable distribution patterns.
*/

--  STEP 6: Top 10 Distributions by Location and Organization
SELECT 
    country,
    by_whom,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    country,
    by_whom
ORDER BY 
    total_llins DESC
LIMIT 10;
-- This query retrieves the top 10 distributions based on total LLINs distributed by location and organization.
