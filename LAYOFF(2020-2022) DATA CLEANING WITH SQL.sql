---Looking at the table

Select *
From LayoffSeasons..layoffs
order by 6,9

-- Looking at the percentage of employees lay off 

Select  company, country, location, date,industry, total_laid_off , percentage*100 as LayoffPercent
From LayoffSeasons..layoffs
order by 4,1

----adding the LayoffPercent column in the table

Select percentage*100 as LayoffPercent 
From LayoffSeasons..layoffs

alter table LayoffSeasons..layoffs
add LayoffPercent float;

update LayoffSeasons..layoffs
set LayoffPercent = percentage*100

Select *
From LayoffSeasons..layoffs

--adding year column, therefore extracting year from date adding in seperate column

Select  
DATENAME(YEAR,date) as yearconverted
From LayoffSeasons..layoffs

alter table LayoffSeasons..layoffs
add yearconverted int;

update LayoffSeasons..layoffs
set yearconverted = year(date)

Select *
From LayoffSeasons..layoffs

--convert the date column in standardised format

select dateconverted, CONVERT(Date,date)
From LayoffSeasons..layoffs

alter table LayoffSeasons..layoffs
add dateconverted Date;

update LayoffSeasons..layoffs
set dateconverted = CONVERT(Date,date)

-- 1.

---MAIN DATA WE ARE GOING TO WORK ON

Select *
From LayoffSeasons..layoffs

-- 2.

----total no laid off(sum)

Select SUM(total_laid_off) as Global_laidoff
From LayoffSeasons..layoffs

-- 3.

---looking at countries with highest laid off

Select country,sum(total_laid_off) as highest_laid_off
From LayoffSeasons..layoffs
group by country
order by highest_laid_off desc

-- 4.

---looking at companies with highest laid off

Select company, sum(total_laid_off) as highest_laid_off
From LayoffSeasons..layoffs
group by company
order by highest_laid_off desc

-- 5.

----looking at no of employees laid off from 2020 to 2022(present)--YEAR DATA

Select yearconverted, sum(total_laid_off) as highest_laid_off
From LayoffSeasons..layoffs
group by yearconverted
order by highest_laid_off desc

-- 6.

--LOOKING AT NO OF EMPLOYEES LAID OFF FROM 2020 TO 2022--- DATE
Select dateconverted,country, sum(total_laid_off) as highest_laid_off
From LayoffSeasons..layoffs
group by dateconverted,country
order by highest_laid_off desc