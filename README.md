# Covid-19 Data Exploration in SQL
## See visulaizations of the data I queried and imported into my [Tableau Dashboard](https://public.tableau.com/app/profile/austin.pappas3389/viz/Covid-19DataAnalysis_16421990791220/GlobalStats "Tableau Dashboard") from this project as well!

In this project, I extracted and imported real-time global Covid-19 data containing information on confirmed cases, deaths, and vaccinations into Microsoft SQL Server. 

Data Source: https://ourworldindata.org/covid-deaths

Date Extracted: July 4th, 2022

# Demonstrated Skills: 
* Joins
* Common Table Expressions (WITH clause)
* Temp Tables
* Subqueries 
* Aggregate Functions
* Creating Views
* Converting Data Types

# Objective:
### Find the Following for All Countries and Continents
* Total Deaths vs Total Cases - Case-Fatality Rate
* Total Cases vs Total Population - Infection Rate
* Total People Fully Vaccinated vs Total Population - Vaccination Rate 

# Queries: United States
## Displays Population, Total Cases, Total Deaths, and Case-Fatality Rate for the US Over Time
<img width= "600" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Case_Fatality.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_CaseFatality_Results.png">
</p>

* Shows the likelihood of death from Covid-19 in the US which is about 1.45% as of Jan. 4th, 2022.
* There was a cumulative total of 57M+ confirmed total cases and 830K+ total deaths as well.

## Calculates the Percentage of Population in the US that has been Infected with Covid Over Time
<img width= "550" height="250" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Infection_Rate.png">
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Infection_Results.png">
</p>

* As of Jan. 4th, 2022, 17.14% of Americans had been infected. 

## Calculates the Percentage of Population Becoming Fully Vaccinated in the US Over Time
<img width= "600" height="250" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Vaccine_Rate.png">
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/US_Vaccine_Results.png">
</p>

* As shown, the vaccination rate for the US is increasing over time.
* 204,983,073 people are confirmed to be fully vaccinated, or about 61.57% as of Jan. 4th, 2022. 
# Queries: All Countries:
## Top 10 Countries Ranked by their Case-Fatality Rate
<img width= "800" height="350" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Top_CaseFatality.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Top_CaseFatality_Results.png">
</p>

* Yemen is the number one country with the highest Covid-19 case-fatality ratio being 19.56%.

## Top 10 Countries with the Highest Infection Rates
<img width= "650" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Infected.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Infected_Results.png">
</p>

* As shown, Andorra is the highest amongst other countries for 32.06% of their total population contracting Covid-19. 

## Top 10 Countries with the Highest Vaccination Rates
<img width= "675" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_VaccineRate.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Vaccine_Results.png">
</p>

* The UAE succeeds where almost everyone in their country is confirmed to be fully vaccinated from Covid-19.

## Top 10 Countries with the Highest Confirmed Deaths
<img width= "445" height="250" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_Highest_Deaths.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Countries_HighestDeaths_Results.png">
</p>

* The United States has more confirmed deaths from Covid than any other country, however, it should be noted that the size of the US population is far greater than man countries. 
  * Thus, the US has far more cases than deaths; giving them a low case to fatality ratio when compared to other countries. 

# Queries: Continents 
## Global Cases, Deaths, and Case-Fatality Rate
<img width= "700" height="300" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Global.png">
</p>

* Across the globe there has been over 294M+ total cases, 5.4M+ total deaths, and the case-fatality rate is 1.84% for the entire world. 

## Continents Ranked by their Case-Fatality Rate
<img width= "750" height="475" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Continets_CaseFatality.png">
</p>

* South America ranks the highest given that their cast-fatality rate is 2.98%. 
* Despite the fact that the US has more deaths than any other country in the world, North America as a whole is ranked in the middle between other continents for its case-fatality rate being 1.82%.

## Continents Ranked by their Infection Rates
<img width= "750" height="475" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Continents_Infection.png">
</p>

* As far as infection rates go, North America is just under Europe for having the highest percentage of their population contracting the virus (about 12.27%). 
  * North America is at 11.31%. 

## Continents Ranked by their Vaccination Rates
<img width= "750" height="475" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Continents_Vaccine_Rates.png">
</p>

* With South America being 64.02% fully vaccinated, covid vaccinations rates are surprisingly high given that vaccines only started to get approved early of 2021.
* Some countries approved the usage of covid vaccines earlier than others, and that may also be a reason for why some continents are ranked higher than others for being fully vaccinated.

## Continents Ranked by the Total Confirmed Number of Deaths
<img width= "750" height="475" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/Continents_DeathCount.png">
</p>

* Once again, Europe ranks the highest in terms of total deaths. It is recorded that they have had 1,540,597 confirmed deaths from Covid as of Jan. 4th, 2022, from when I extracted this data. 

## Calculate the Rolling Number of People Becoming Fully Vaccinated
<img width= "750" height="475" src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/RollingNumber.png">
</p>
<img src="https://github.com/Apappas97/Covid-19-Data-Exploration-in-SQL/blob/main/Images/RollingNumber_Results.png">
</p>

* I used a CTE to show the rolling number and percentage of individuals becoming vaccinated in their country. 
* From this example, you can see that new vaccinations started occurring on Dec. 14th, 2020, in the United States. 
  *  It is shown that the number and percentages roll over into the next period when more vaccinations occur.
