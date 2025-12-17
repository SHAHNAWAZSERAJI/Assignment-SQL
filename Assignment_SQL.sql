use world;

##  Question 1 : Count how many cities are there in each country?
SELECT 
    c.Name AS Country,
    COUNT(ci.ID) AS City_Count
FROM Country c
LEFT JOIN City ci
    ON c.Code = ci.CountryCode
GROUP BY c.Code, c.Name
ORDER BY City_Count DESC;


##  Question 2 : Display all continents having more than 30 countries.
SELECT 
    Continent,
    COUNT(*) AS Country_Count
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30;


##  Question 3 : List regions whose total population exceeds 200 million.
SELECT 
    Region,
    SUM(Population) AS Total_Population
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;


##  Question 4 : Find the top 5 continents by average GNP per country.
SELECT 
    Continent,
    round(AVG(GNP),2) AS Avg_GNP
FROM Country
GROUP BY Continent
ORDER BY Avg_GNP DESC
LIMIT 5;


##  Question 5 : Find the total number of official languages spoken in each continent.
SELECT 
    c.Continent,
    COUNT(DISTINCT cl.Language) AS Official_Languages
FROM Country c
JOIN CountryLanguage cl
    ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;


##  Question 6 : Find the maximum and minimum GNP for each continent.
SELECT 
    Continent,
    MAX(GNP) AS Max_GNP,
    MIN(GNP) AS Min_GNP
FROM Country
GROUP BY Continent;


##  Question 7 : Find the country with the highest average city population.
SELECT 
    c.Name AS Country,
    AVG(ci.Population) AS Avg_City_Population
FROM Country c
JOIN City ci
    ON c.Code = ci.CountryCode
GROUP BY c.Code, c.Name
ORDER BY Avg_City_Population DESC
LIMIT 1;


##  Question 8 : List continents where the average city population is greater than 200,000.
SELECT 
    c.Continent,
    round(AVG(ci.Population),2) AS Avg_City_Population
FROM Country c
JOIN City ci
    ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;


##  Question 9 : Find the total population and average life expectancy for each continent, ordered by average lifexpectancy descending.
SELECT 
    Continent,
    SUM(Population) AS Total_Population,
    AVG(LifeExpectancy) AS Avg_Life_Expectancy
FROM Country
GROUP BY Continent
ORDER BY Avg_Life_Expectancy DESC;


##  Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.
SELECT 
    Continent,
    AVG(LifeExpectancy) AS Avg_Life_Expectancy,
    SUM(Population) AS Total_Population
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY Avg_Life_Expectancy DESC
LIMIT 3;
