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
The dataset was provided by the [NexTech Academy team](https://github.com/NexTech-Ac/data-analysis-bootcamp-2024/blob/main/assignments/sql-assignment/README.md). It contains the following columns:

ID: A unique identifier for each distribution record.
Number distributed: The number of LLINs distributed.
Location: The specific location where the LLINs were distributed.
Country: The country where the distribution took place.
When: The period during which the distribution occurred.
By_whom: The organization responsible for the distribution.
Country_code: The ISO code of the country.

## Database
I used MySQL Workbench of the analysis

## Solutions Approach
** Database and Table Setup**

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

Descriptive Statistics:

Calculated the total number of LLINs distributed in each country.
Found the average number of LLINs distributed per distribution event.
Determined the earliest and latest distribution dates.
Trends and Patterns:

Identified the total number of LLINs distributed by each organization.
Calculated the total number of LLINs distributed in each year.
Volume Insights:

Found the locations with the highest and lowest number of LLINs distributed.
Analyzed variations in the number of LLINs distributed by different organizations.
Identifying Extremes:

Detected any outliers or significant spikes in the number of LLINs distributed in specific locations or periods.
## Findings

## How to use

# Get in touch
