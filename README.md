# Covid-19-Data-Exploration-in-SQL
In this project, I extracted and imported real-time global Covid-19 data containing information on confirmed cases, deaths, and vaccinations into Microsoft SQL Server. 

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

## Queries: United States:
### Displays Population, Total Cases, Total Deaths, and Case-Fatality Rate for the US Over Time
<img width= "600" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Case_Fatality.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_CaseFatality_Results.png">
</p>

* Shows the likelyhood of death from Covid-19 in the US which is about 1.45% as of Jan. 4th, 2022.
  * There was a cumulative total of 57M+ confirmed total cases and 830K+ total deaths as well.

### Calculates the Percentage of Population in the US that has been Infected with Covid Over Time
<img width= "550" height="250" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Infection_Rate.png">
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Infection_Results.png">
</p>

* As of Jan. 4th 2022, 17.14% of Americans had been infected. 

### Calculates the Percentage of Population Becoming Fully Vaccinated in the US Over Time
<img width= "600" height="250" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Vaccine_Rate.png">
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Vaccine_Results.png">
</p>

* As shown, the Vaccination Rate for the US is increasing over time.
  * 204,983,073 people are confirmed to be fully vaccinated, or about 61.57% as of Jan. 4th, 2022. 
## Queries: All Countries:
### Top 10 Countries Ranked by their Case-Fatality Rate
<img width= "800" height="350" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Top_CaseFatality.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Top_CaseFatality_Results.png">
</p>

* Yemen is the number one country with the highest Covid-19 Case-Fatality Ratio being 19.56%.

### Top 10 Countries with the Highest Infection Rates
<img width= "650" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Infected.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Infected_Results.png">
</p>

* As shown, Andorra has the highest percent of population that has been infected by covid thus far. 
  * With 32.06% of their population having contracted Covid at least once, this is fairly significant when compared to other countries around the world. 

### Top 10 Countries with the Highest Vaccination Rates
<img width= "675" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_VaccineRate.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Vaccine_Results.png">
</p>

* Amongst other countries and their percentage of population that are fully vaccinated, the UAE succeeds where almost everyone in their country is confirmed to be fully vaccinated from Covid-19.

### Top 10 Countries with the Highest Confirmed Deaths
<img width= "445" height="250" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Highest_Deaths.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_HighestDeaths_Results.png">
</p>

* The United States has more deaths Covid than any other country, however, it should be noted that the US popuation size is far greater than most.
  * Thus, the US has far more cases than deaths which is why their Case-Fatality Ratio is very low compared to other countries.

## Queries: Continents 
### Global Cases, Deaths, and Case-Fatality Rate
<img width= "700" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Global.png">
</p>

* Across the globe there has been over 294M+ total cases and 5.4M+ total deaths confirmed. Thus, the Case-Fatality Rate is 1.84% for the entire world. 

### Continents Ranked by their Case-Fatality Rate
<img width= "750" height="475" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Continets_CaseFatality.png">
</p>

* South America Ranks the highest in terms of Case to Death Ratio. 
* Despite the fact that when we mentioned the US having more deaths than any other country in the world, North America as a whole is ranked in the middle between other continents for it's Case-Fatality Rate.

## Continents Ranked by their Infection Rates
<img width= "750" height="475" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Continents_Infection.png">
</p>
