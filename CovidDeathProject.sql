Select *From
CovidDeathProject..CovidDeaths$


--Selecting Columns to be Usedin this Project

Select Continent, Location,Date, Total_cases, New_cases, Total_cases, Population
From CovidDeathProject..CovidDeaths$
Order By 1, 2

--Number of Cases in Africa

Select Continent, Location,Date, Total_cases, New_cases, Population
From CovidDeathProject..CovidDeaths$
Where continent is not null
and continent like'%africa%'
Order By 1, 2


--Deaths Per Continents

Select continent, MAX(CAST(total_deaths As int)) As TotalDeaths
From CovidDeathProject..CovidDeaths$
--where location like '%states%'
Where continent is not null
Group By continent
order By TotalDeaths desc


-- Total Cases in Africa

select continent, MAX(CAST(total_cases as int)) as TotalCases
from CovidDeathProject..CovidDeaths$
where continent like '%africa%'
and continent is not null
Group by continent
order by TotalCases desc

--Total Deaths in Africa

select continent, MAX(CAST(total_deaths as int)) as TotalDeaths
from CovidDeathProject..CovidDeaths$
where continent like '%africa%'
and continent is not null
Group by continent
order by TotalDeaths desc

--Number of Cases/Death in Africa per Percentage

select date, sum(new_cases) as Cases , sum(cast(new_deaths as int)) as Deaths, sum(cast(new_deaths as int))/
sum(new_cases)*100 as DeathPercentage
from CovidDeathProject..CovidDeaths$
where continent like '%africa%'
and continent is not null
group by date
order by 1,2

--Cases and Deaths in Ghana 

Select location, date, total_cases, total_deaths
from CovidDeathProject..CovidDeaths$
where location like'%ghana%'
Order by 1,2


--TotalCases/Deaths in Ghana

select location, sum(CAST(total_cases as int)) as TotalCases, sum(cast(total_deaths as int))as TotalDeaths
from CovidDeathProject..CovidDeaths$
where location like '%ghana%'
--where continent is not null
Group by location
order by TotalCases


--Total Cases / Deaths in Ghana


select   date, sum(total_cases) as Cases , sum(cast(total_deaths as int)) as Deaths, sum(cast(total_deaths as int))/
sum(total_cases)*100 as DeathPercentage
from covid..CovidDeaths
where location like '%ghana%'
and new_deaths is not null
group by date
order by 1,2

--Cites in Africa With the Highest Death Rate

select location, MAX(CAST(total_deaths as int)) as TotalDeaths
from CovidDeathProject..CovidDeaths$
where continent like '%africa%'
and continent is not null
Group by location
order by TotalDeaths desc

