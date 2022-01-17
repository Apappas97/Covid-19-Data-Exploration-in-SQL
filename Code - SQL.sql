/*

COVID-19 Data Exploration Project 

Skills Used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/

-- Date extracted on 1/4/2022

-- Covid-19 Cases and Deaths Data
SELECT *
FROM [Portfolio Project]..CasesAndDeaths
WHERE continent IS NOT NULL
ORDER BY continent, location;

-- Covid-19 Vaccinations Data
SELECT *
FROM [Portfolio Project]..CovidVaccinations
WHERE continent IS NOT NULL
ORDER BY continent, location;

--------------------------------------------------------------------------------

					/* United States Data */

-- Shows the Case-Fatality Rate Over Time for the United States 
	
SELECT 
	location,
	date,
	population,
	total_cases, 
	total_deaths, 
	FORMAT((total_deaths / total_cases), 'P') AS Case_Fatality_Rate
FROM 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	location like '%states%'
ORDER BY 
	location, 
	date DESC;


-- Shows the Infection Rate Over Time for the United States 
SELECT 
	location, 
	date,
	population,
	total_cases, 
	FORMAT((total_cases / population), 'P') AS Infection_Rate
FROM
	[Portfolio Project]..CasesAndDeaths
WHERE 
	location LIKE '%states%' 	
ORDER BY 
	date DESC;


-- Shows the Percentage of Population in the Unites States who are Fully Vaccinated 

SELECT 
	location, 
	date, 
	population,
	people_fully_vaccinated,
	FORMAT((people_fully_vaccinated / population), 'P') AS Vaccination_Rate
FROM
	[Portfolio Project]..CovidVaccinations
WHERE 
	location LIKE '%states%' 
ORDER BY 
	date DESC;

--------------------------------------------------------------------------------

					/* Data On Every Country */

-- Top 10 Countries Ranked by their Case-Fatality Rate (as of January 4th, 2022) 

SELECT 
	Top 10 location, 
	population,
	MAX(total_cases) AS total_cases, 
	MAX(CAST(total_deaths AS INT)) AS total_deaths, 
	ROUND(MAX(CAST(total_deaths AS INT)) / MAX(total_cases) * 100, 2) AS 'Case_Fatality_Rate%'
From 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location, 
	population
ORDER BY 
	'Case_Fatality_Rate%' DESC;


-- Top 10 Countries with the Highest Infection Rates

SELECT 
	TOP 10 location,
	population,
	MAX(total_cases) AS Total_Cases,
	ROUND(MAX(total_cases / population) * 100, 2) AS 'Infection_Rate%'
FROM
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location,
	population
ORDER BY 
	'Infection_Rate%' DESC;


-- Top 10 Countries with the Highest Vaccination Rates

SELECT 
	TOP 10 location,
	population,
	people_fully_vaccinated,
	FORMAT((people_fully_vaccinated / population), 'P') AS 'Vaccination_Rate%'
FROM
	[Portfolio Project]..CovidVaccinations
WHERE 
	continent IS NOT NULL
	AND date = (SELECT MAX(date)
	FROM[Portfolio Project]..CovidVaccinations)	
ORDER BY
	'Vaccination_Rate%' DESC;


-- Top 10 Countries with the Highest Confirmed Deaths

SELECT
	TOP 10 location,
	MAX(CAST(total_deaths AS INT)) AS Total_Deaths
FROM 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location
ORDER BY 
	Total_Deaths DESC;

--------------------------------------------------------------------------------

					/* Global and Continent Data */

-- Global Cases, Deaths, and Case-Fatality Rate

SELECT 
	SUM(new_cases) AS total_cases, 
	SUM(CAST(new_deaths AS INT)) AS total_deaths, 
	FORMAT(SUM(CAST(new_deaths AS INT)) / SUM(new_cases), 'P') AS Case_Fatality_Rate
FROM 
	[Portfolio Project]..CasesAndDeaths 
WHERE 
	continent IS NOT NULL
ORDER BY
	total_cases,
	total_deaths;


-- Continents with the Highest Case-Fatality Rates

SELECT 
	location,
	population,
	date,
	total_cases, 
	total_deaths, 
	FORMAT((total_deaths / total_cases), 'P') AS Case_Fatality_Rate
FROM 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NULL
	AND location NOT IN ('World', 'European Union', 'International', 'Upper middle income', 
	'High income', 'Lower middle income', 'Low income')	
	AND date = (select max(date)
	from [Portfolio Project]..CasesAndDeaths)	
ORDER BY 
	Case_Fatality_Rate DESC;


-- Continents with the Highest Infection Rates

SELECT 
	location,
	population,
	MAX(total_cases) AS Total_Cases,
	ROUND(MAX(total_cases / population) * 100, 2) AS 'Infection_Rate%'
FROM
	[Portfolio Project]..CasesAndDeaths
WHERE
	continent IS NULL
	AND location NOT IN ('World', 'European Union', 'International', 'Upper middle income', 
	'High income', 'Lower middle income', 'Low income')	
GROUP BY 
	location,
	population
ORDER BY 
	'Infection_Rate%' DESC;


-- Continents with the Highest Vaccination Rates

Select 
	location,
	population,
	MAX(people_fully_vaccinated) AS People_Fully_Vaccinated,
	ROUND(MAX(people_fully_vaccinated / population) * 100, 2) AS 'Vaccination_Rate%'
FROM
	[Portfolio Project]..CovidVaccinations
WHERE 
	continent IS NULL
	AND location NOT IN ('World', 'European Union', 'International', 'Upper middle income', 
	'High income', 'Lower middle income', 'Low income')	
GROUP BY
	location, 
	population
ORDER BY
	'Vaccination_Rate%' DESC;


-- Continents with the Highest Confirmed Deaths 

SELECT 
	location,
	MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NULL AND 
	location NOT IN ('World', 'European Union', 'International', 'Upper middle income', 
	'High income', 'Lower middle income', 'Low income')
GROUP BY 
	location
ORDER BY 
	TotalDeathCount DESC;

--------------------------------------------------------------------------------

-- (Using a CTE) Shows the Rolling Number of People who are Becoming Fully Vaccinated Over Time

WITH Population_Vaccinated (continent, location, date, population, new_vaccinations, Rolling_Number_Vaccinations)
AS
(
SELECT 
	cad.continent, 
	cad.location, 
	cad.date, 
	cad.population, 
	vac.new_vaccinations, 
	SUM(CONVERT(BIGINT,vac.new_vaccinations)) 
	OVER (Partition by cad.location ORDER BY cad.location, cad.date) as Rolling_Number_Vaccinations
FROM 
	[Portfolio Project]..CasesAndDeaths cad
	JOIN [Portfolio Project]..CovidVaccinations vac 
	ON cad.location = vac.location 
	AND cad.date = vac.date
WHERE 
	cad.continent IS NOT NULL  
)
SELECT 
	*, 
	FORMAT((Rolling_Number_Vaccinations / Population), 'P') Percent_Population_Vaccinated
FROM 
	Population_Vaccinated 
ORDER BY
	location,
	date ASC;


-- (Using a TEMP table) Shows the Rolling Number of People who are Becoming Fully Vaccinated Over Time

DROP TABLE IF Exists Population_Vaccinated
CREATE TABLE Population_Vaccinated
(
continent nvarchar(255),
location nvarchar(255),
date date,
population numeric,
new_vaccinations numeric,
Rolling_Number_Vaccinations numeric
)

INSERT INTO 
	Population_Vaccinated
SELECT 
	cad.continent, 
	cad.location, 
	cad.date, 
	cad.population, 
	vac.new_vaccinations,
	SUM(CONVERT(BIGINT, vac.new_vaccinations)) 
	OVER (PARTITION BY cad.location ORDER BY cad.location, cad.date) AS Rolling_Number_Vaccinations
FROM 
	[Portfolio Project]..CasesAndDeaths cad
JOIN 
	[Portfolio Project]..CovidVaccinations vac
	ON cad.location = vac.location AND cad.date = vac.date
WHERE 
	cad.continent IS NOT NULL 
SELECT 
	*, 
	FORMAT((Rolling_Number_Vaccinations / population), 'P') AS Percent_Population_Vaccinated
FROM 
	Population_Vaccinated
ORDER BY 
	 location,
	 date ASC;

---------------------------------------------------------------------------------------------------------

		/* Create Views to Store Data for Visualizations that will be used in Tableau */

-- View 1.)
USE [Portfolio Project];
GO
-- Global Cases, Deaths, and Case-Fatality Rate
Create View Global_Numbers
AS
SELECT 
	SUM(new_cases) AS total_cases, 
	SUM(CAST(new_deaths AS INT)) AS total_deaths, 
	FORMAT(SUM(CAST(new_deaths AS INT)) / SUM(new_cases), 'P') AS Case_Fatality_Rate
FROM 
	[Portfolio Project]..CasesAndDeaths 
WHERE 
	continent IS NOT NULL
--ORDER BY
--	total_cases,
--	total_deaths;


-- View 2.)
USE [Portfolio Project];
GO
-- Countries with Highest Case-Fatality Rates 
Create View Case_Fatality_Rates
AS
SELECT 
	location, 
	population,
	MAX(total_cases) AS total_cases, 
	MAX(CAST(total_deaths AS INT)) AS total_deaths, 
	ROUND(MAX(CAST(total_deaths AS INT)) / MAX(total_cases) * 100, 2) AS 'Case_Fatality_Rate%'
From 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location, 
	population
--ORDER BY 
--	'Case_Fatality_Rate%' DESC;

-- View 3.)
USE [Portfolio Project];
GO
-- Countries with Highest Infection Rates 
Create View Infection_Rates
AS
SELECT 
	location,
	population,
	MAX(total_cases) AS Total_Cases,
	ROUND(MAX(total_cases / population) * 100, 2) AS 'Infection_Rate%'
FROM
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location,
	population
--ORDER BY 
--	'Infection_Rate%' DESC;

-- View 4.)
USE [Portfolio Project];
GO
-- Countries with Highest Vaccination Rates
Create View Vaccination_Rates
AS
Select
	location,
	population,
	people_fully_vaccinated,
	FORMAT((people_fully_vaccinated / population), 'P') AS 'Vaccination_Rate%'
FROM
	[Portfolio Project]..CovidVaccinations
WHERE 
	continent IS NOT NULL
	AND date = (select max(date)
	from [Portfolio Project]..CovidVaccinations)	
--ORDER BY
--	'Vaccination_Rate%' DESC;

-- View 5.)
USE [Portfolio Project];
GO
-- Countries with Highest Confirmed Deaths 
Create View Confirmed_Deaths
AS
SELECT
	location,
	MAX(CAST(total_deaths AS INT)) AS Total_Deaths
FROM 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location
--ORDER BY 
--	Total_Deaths DESC;

-- View 6.)
USE [Portfolio Project];
GO
-- Countries with Highest Confirmed Cases
Create View Confirmed_Cases
AS
SELECT
	location,
	MAX(total_cases) AS Total_Cases
FROM 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location
--ORDER BY 
--	Total_Cases DESC;

-- View 7.)
USE [Portfolio Project];
GO
-- Case-Fatality Rate Over Time for Countries 
Create View Case_Fatality_Rates_OT
AS
SELECT 
	location, 
	population,
	date,
	MAX(total_cases) AS total_cases, 
	MAX(CAST(total_deaths AS INT)) AS total_deaths, 
	ROUND(MAX(CAST(total_deaths AS INT)) / MAX(total_cases) * 100, 2) AS 'Case_Fatality_Rate%'
From 
	[Portfolio Project]..CasesAndDeaths
WHERE 
	continent IS NOT NULL
GROUP BY 
	location, 
	population,
	date
--ORDER BY 
--	location, 
--	date DESC;

-- View 8.)
USE [Portfolio Project];
GO
-- Vaccination Rates Over Time for Countries 
Create View Vaccination_Rates_OT
AS
Select
	location,
	population,
	date,
	people_fully_vaccinated,
	FORMAT((people_fully_vaccinated / population), 'P') AS 'Vaccination_Rate%'
FROM
	[Portfolio Project]..CovidVaccinations
WHERE 
	continent IS NOT NULL
--ORDER BY
--	location, 
--	date DESC;

