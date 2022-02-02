# Data Exploration in SQL | COVID-19 Dataset
## Feel free to view the [tableau dashboard](https://public.tableau.com/app/profile/austin.pappas3389/viz/Covid-19DataAnalysis_16421990791220/GlobalStats "Tableau Public") I made which shows a visual representation of the queries performed in this project 

In this project, I extracted and imported real-time global COVID-19 data into Microsoft SQL Server. Performing queries and calculations, I was able to retrieve the infection rate, vaccination rate, and case-fatality rate for all countries and continents around the world. 

Data Source: https://ourworldindata.org/covid-deaths

Date Extracted: July 4th, 2022

## Demonstrated Skills: 
* Joins
* Common Table Expressions (WITH clause)
* Temp Tables
* Subqueries 
* Aggregate Functions
* Creating Views
* Converting Data Types

## Objective:
### Find the Following for All Countries and Continents
* Total Deaths vs Total Cases - Case-Fatality Rate
* Total Cases vs Total Population - Infection Rate
* Total People Fully Vaccinated vs Total Population - Vaccination Rate 

# Queries:
## Displays Population, Total Cases, Total Deaths, and Case-Fatality Rate for the US Over Time
``` TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_CaseFatality_Results.png">
</p>

* Shows the likelihood of death from Covid-19 in the US which is about 1.45% as of Jan. 4th, 2022.
* There was a total of 57M+ confirmed cases and 830K+ deaths as well.
## Calculates the Percentage of Population in the US that has been Infected with Covid Over Time
``` TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Infection_Results.png">
</p>

* As of Jan. 4th, 2022, 17.14% of Americans have contracted Covid-19 at least once.
## Calculates the Percentage of Population Becoming Fully Vaccinated in the US Over Time
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Vaccine_Results.png">
</p>

* As shown, the vaccination rate for the US is increasing over time.
* 204,983,073 people (or 61.57% of the US population) is confirmed to be fully vaccinated.
## Top 10 Countries Ranked by their Case-Fatality Rate
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Top_CaseFatality_Results.png">
</p>

* The country with the highest case-fatality rate (19.56%) is Yemen. 
## Top 10 Countries with the Highest Infection Rates
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Infected_Results.png">
</p>

* Andorra's infection rate is ranked higher than any other country where 32.06% of their population has been infected.
## Top 10 Countries with the Highest Vaccination Rates
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Vaccine_Results.png">
</p>

* The UAE is the top ranked country for having the highest percentage of population that is fully vaccinated. 
## Top 10 Countries with the Highest Confirmed Deaths
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_HighestDeaths_Results.png">
</p>

* The United States has more confirmed deaths from Covid than any other country, however, it should be noted that the their population size is far greater than most countries. 
  * Thus, the US has large gap between confirmed cases and deaths, which is why they have a low case-fatality rate.
## Global Cases, Deaths, and Case-Fatality Rate
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Global_Cases.png">
</p>

* Across the globe, there has been over 294M+ total cases, 5.4M+ total deaths, and the entire world has a recorded case-fatality rate of about 1.84%.  
## Continents Ranked by their Case-Fatality Rate
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/ContinentFatality.png">
</p>

* South America ranks the highest with a case-fatality rate of 2.98%. 
* Despite the fact that the US has more deaths than any other country in the world, North America is ranked in the middle for having a case-fatality rate of 1.82%.
## Continents Ranked by their Infection Rates
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/ContinentInfection.png">
</p>

* Europe has the highest percent of population contracting the virus (about 12.27%). 
  * North America follows right behind at about 11.31%. 
## Continents Ranked by their Vaccination Rates
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/ContinentVaccine.png">
</p>

* With South America's population being 64.02% fully vaccinated, this came as a surpise because Covid vaccines have only been around a little over a year. 
* Some countries approved the usage of Covid vaccines earlier than others which may have been a contributing factor for South America. 
## Continents Ranked by the Total Confirmed Number of Deaths
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/ContinentDeaths.png">
</p>

* Europe ranks the highest in terms of total deaths. It is recorded that they have had 1,540,597 confirmed deaths from Covid as of Jan. 4th, 2022. 
## Calculate the Rolling Number of People Becoming Fully Vaccinated
```TSQL
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
```
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/RollingNumber_Results.png">
</p>

* I used a CTE to show the rolling number and percentage of individuals becoming vaccinated in their country. 
* From this example, you can see that new vaccinations started rolling out on Dec. 14th, 2020, in the United States. 
