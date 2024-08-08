# Long-Lasting Insecticidal Nets (LLIN) Distribution Analysis
In this project we use SQL in MySQL to analyse the distibution of Long-Lasting Insecticidal Nets (LLINs) across various locations in multiple  African countries.
We intend to gain meaningful insights.
# The Challenge

You are a data analyst working for a global health organization. Your task is to analyze the distribution of Long-Lasting Insecticidal Nets (LLINs) across various locations in multiple countries. The goal is to understand the distribution patterns, identify trends, and gain insights into the effectiveness of different distribution campaigns

# Objectives
1. **Identify Patterns and Trends** Understand the distribution dynamics by analyzing distribution patterns and trends across different locations and countries.
2. **Analyze Distribution Volume** Evaluate the distribution volume by location and organization to assess the reach and impact of the distribution efforts.
3. **Detect Anomalies** Identify any anomalies or significant deviations in the distribution data to address potential issues or irregularities.


# Dataset
Find the datasetr [here](https://github.com/nyarotoyi/SQL-Portfolio/blob/main/llin_%20distribution_analysis/amf_distributions.csv)
and the script [here](https://github.com/nyarotoyi/SQL-Portfolio/blob/main/llin_%20distribution_analysis/lln_distributions_analysis.sql).

The dataset was provided by the [NexTech Academy team](https://github.com/NexTech-Ac/data-analysis-bootcamp-2024/blob/main/assignments/sql-assignment/README.md). It contains the following columns:

1. ID: A unique identifier for each distribution record.

2. Number distributed: The number of LLINs distributed.

3. Location: The specific location where the LLINs were distributed.

4. Country: The country where the distribution took place.

5. When: The period during which the distribution occurred.

6. By_whom: The organization responsible for the distribution.

7. Country_code: The ISO code of the country.

## Database
I used MySQL Workbench of the analysis

## Solutions Approach
**Database and Table Setup**

Created a database named llin_analysis and a table named llin_distribution with appropriate columns for storing distribution data.
```sql
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
``` 

**Descriptive Statistics**

Calculated the total number of LLINs distributed in each country.
``` -- Calculate the total number of LLINs distributed in each country
SELECT 
    country,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    country
ORDER BY 
    total_llins DESC;
```

Found the average number of LLINs distributed per distribution event.
```
-- Calculate the average number of LLINs distributed per distribution event
SELECT 
    AVG(number_distributed) AS average_distribution_per_event
FROM 
    amf_distributions;
```
Determined the earliest and latest distribution dates.
```
/*Determine the earliest and latest distribution dates in the dataset
 Since we are working with years, we'll use MIN and MAX on the year column
 */
 
SELECT 
    MIN(year) AS earliest_date,
    MAX(year) AS latest_date
FROM 
    amf_distributions;
``` 
**Trends and Patterns**

Identified the total number of LLINs distributed by each organization.
```
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
```
Calculated the total number of LLINs distributed in each year.
```
SELECT 
    year,
    SUM(number_distributed) AS total_llins
FROM 
    amf_distributions
GROUP BY 
    year
ORDER BY 
    year ASC;
```

**Volume Insights**

Found the locations with the highest and lowest number of LLINs distributed.
```
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

```
**Identifying Extremes**

Detected any outliers or significant spikes in the number of LLINs distributed in specific locations or periods.
```
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
``` 

## Findings
**Distribution Pattern**
The analysis revealed significant variability in the number of LLINs distributed across different countries and locations. Uganda received the highest total number of LLINs distributed, amounting to 12,869,970. In contrast, Gabon had the lowest total distribution with only 800 LLINs. A total of 8,015,000 LLINs were distributed in countries that have not yet made their data public.

In terms of locations, "Western & Eastern" regions in Uganda had the highest distributions with a total of 12,752,620 LLINs, while the Kumali District in Uganda had the lowest distribution, with only 800 LLINs.

**Top Distributors**

*Certain organizations have distributed significantly higher volumes of LLINs*

- NMCP/Various: 19,669,420 LLINs
- Yet to be made public: 8,015,000 LLINs
- NMCP/ERD: 2,689,100 LLINs
- Concern Universal: 1,809,920 LLINs
- IMA World Health/DFID: 1,336,000 LLINs
- Rotary Club of Port Moresby: 1,159,400 LLINs
- World Vision: 300,350 LLINs
- Red Cross: 260,710 LLINs
  
*On the other end, some organizations had minimal distribution volumes*

- Danyi's Children: 500 LLINs
- Pro-Link Ghana: 400 LLINs
- GHEI: 300 LLINs
- Uganda Lodge: 250 LLINs
- Individs: 240 LLINs
- Ndebele Arts Project: 150 LLINs
  
**Yearly Trends**
The distribution totals varied significantly between years, with notable differences in volumes

2006: 8,301,133 LLINs
2007: 27,672,820 LLINs
This variation suggests potential changes in distribution strategies or external factors influencing distribution volumes.

**Anomalies**
Significant deviations in distribution numbers were observed. 

NMCP/Various: Average distribution of 2,809,917.14 LLINs with a high standard deviation of 4,190,045.29
Yet to be made public: Average distribution of 2,003,750.00 LLINs with a standard deviation of 1,116,934.28
NMCP/ERD: Average distribution of 896,366.67 LLINs with a standard deviation of 325,745.90
Concern Universal: Average distribution of 180,992.00 LLINs with a standard deviation of 136,041.95
IMA World Health/DFID: Average distribution of 668,000.00 LLINs with a standard deviation of 37,468.00
Rotary International: Average distribution of 34,685.75 LLINs with a standard deviation of 37,396.06
World Vision: Average distribution of 150,175.00 LLINs with a standard deviation of 16,825.00
Red Cross: Average distribution of 11,335.22 LLINs with a standard deviation of 12,094.44
Malaria Consortium: Average distribution of 12,742.86 LLINs with a standard deviation of 11,391.58
PCV: Average distribution of 4,740.00 LLINs with a standard deviation of 4,508.37

These findings highlight significant trends and anomalies that could inform further investigation into the effectiveness and distribution practices of LLIN campaigns.
## How to use
1. Accessing the Data
Import the dataset into MySQL Workbench and execute the provided SQL queries to replicate the analysis.

2. Analyzing Results
Review the output of the queries to understand distribution patterns, trends, and anomalies.
Use the findings to assess the effectiveness of LLIN distribution campaigns and make data-driven decisions for future interventions.

3. Further Analysis

Extend the analysis by incorporating additional data or applying more advanced statistical techniques to gain deeper insights into LLIN distribution dynamics.
# Get in touch
For more information or questions regarding this analysis, please contact us at zianaodero@gmail.com 0r my LinkedIN [Marice Ziana](https://www.linkedin.com/in/marice-ziana-a51442146/).
