--How many entries in the database are from Africa? 

SELECT COUNT(*) AS africa_entries 
FROM population_years 
    INNER JOIN countries
        ON population_years.country_id = countries.id 
WHERE continent = 'Africa'

------------------------------------------------------------------
--What was the total population of Africa in 2010?   

SELECT SUM(population_years.population) AS africa_population 
FROM population_years 
    INNER JOIN countries 
        ON population_years.country_id = countries.id 
WHERE population_years.year = 2010  
      AND countries.continent = 'Africa' 

------------------------------------------------------------------
--What is the average population of countries in South America in 2000?  

SELECT AVG(population_years.population) avg_south_america_population 
FROM population_years 
    INNER JOIN countries 
        ON population_years.country_id = countries.id 
WHERE population_years.year = 2000 
      AND countries.continent = 'South America' 

------------------------------------------------------------------
--What country had the smallest population in 2007?   

SELECT TOP (1) 
       population_years.population 
     , countries.name AS country 
FROM population_years 
    INNER JOIN countries 
        ON population_years.country_id = countries.id 
WHERE population_years.year = 2007 
      AND population_years.population IS NOT NULL 
ORDER BY population_years.population ASC 

------------------------------------------------------------------
--How much has the population of Europe grown from 2000 to 2010?  

SELECT (100 * ( 
        SUM(CASE WHEN population_years.year = 2010 THEN population_years.population END) - 
        SUM(CASE WHEN population_years.year = 2000 THEN population_years.population END)) / 
        NULLIF(SUM(CASE WHEN population_years.year = 2000 THEN population_years.population END), 0))  
        AS europ_growth_population 
FROM population_years 
    INNER JOIN countries 
        ON population_years.country_id = countries.id 
WHERE countries.continent = 'Europe' 
      AND population_years.year IN (2000, 2010) 

------------------------------------------------------------------
--Top-10 absolute population growers, 2000 → 2010

WITH growth AS (
    SELECT
          countries.name AS country
        , (SUM(CASE WHEN population_years.year = 2010 THEN population_years.population END) -
          SUM(CASE WHEN population_years.year = 2000 THEN population_years.population END)) 
          AS pop_growth
    FROM   population_years
        INNER JOIN countries 
            ON population_years.country_id = countries.id
    WHERE  population_years.year IN (2000, 2010)
    GROUP  BY countries.name
)
SELECT TOP (10)
       country,
       pop_growth AS growth_million
FROM   growth
ORDER  BY pop_growth DESC;

------------------------------------------------------------------
--Kenya’s 2010 ranking within Africa 

WITH africa_2010 AS ( 
    SELECT  
          countries.name AS country
        , population_years.population 
    FROM population_years 
        INNER JOIN countries 
            ON population_years.country_id = countries.id
    WHERE countries.continent = 'Africa' 
          AND population_years.year = 2010 
) 
SELECT country
     , population
     , RANK() OVER (ORDER BY population DESC) AS population_rank 
FROM africa_2010 

------------------------------------------------------------------
--Africa’s share of world population (2010)

WITH world_2010 AS (
    SELECT SUM(population) AS world_pop_2010
    FROM   population_years
    WHERE  year = 2010
)
SELECT
      countries.continent
    , SUM(population_years.population) AS continent_pop_2010
    , 100.0 * SUM(population_years.population) /
            world_2010.world_pop_2010      AS pct_of_world_2010
FROM   population_years
    CROSS  JOIN world_2010
    INNER  JOIN countries 
        ON population_years.country_id = countries.id
WHERE  population_years.year = 2010
GROUP  BY countries.continent, world_2010.world_pop_2010
ORDER  BY pct_of_world_2010 DESC;

------------------------------------------------------------------
--Compound annual growth rate (CAGR) by continent, 2000 → 2010

SELECT
      countries.continent
    , POWER(
        SUM(CASE WHEN population_years.year = 2010 THEN population_years.population END) /
        NULLIF(SUM(CASE WHEN population_years.year = 2000 THEN population_years.population END), 0),
        1.0 / 10
        ) - 1 AS cagr
FROM   population_years
    INNER  JOIN countries 
        ON population_years.country_id = countries.id
WHERE  population_years.year IN (2000, 2010)
GROUP  BY countries.continent
ORDER  BY cagr DESC;
