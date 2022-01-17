# Covid-19-Data-Exploration-in-SQL
In this project, I extracted and imported real-time global Covid-19 data containing information on confirmed cases, deaths, and vaccinations into Microsoft SQL Server. 

Data Source: https://ourworldindata.org/covid-deaths

Date Extracted: July 4th, 2022

## Demonstrated Skills: 
* Joins
* CTE's
* Temp Tables
* Windows Functions
* Aggregate Functions
* Creating Views
* Converting Data Types

## Here are a few Queries I performed on Data for the United States
### Displays Population, Total Cases, Total Deaths, and Case-Fatality Rate for the US Over Time
<img width= "800" height="350" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Case_Fatality.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_CaseFatality_Results.png">
</p>

* Shows the likelyhood of death from Covid-19 in the US which is about 1.45% as of Jan. 4th, 2022.
  * There was a cumulative total of 57M+ confirmed total cases and 830K+ total deaths as well.

### Calculates the Percentage of Population in the US that has been Infected with Covid Over Time
<img width= "800" height="350" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Infection_Rate.png">
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Infection_Results.png">
</p>

* As of Jan. 4th 2022, 17.14% of Americans had been infected. 

### Calculates the Percentage of Population Becoming Fully Vaccinated in the US Over Time
<img width= "800" height="350" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Vaccine_Rate.png">
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Vaccine_Results.png">
</p>

* As shown, the Vaccination Rate for the US is increasing over time.
  * 204,983,073 people are confirmed to be fully vaccinated, or about 61.57% as of Jan. 4th, 2022. 
