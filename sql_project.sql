create database project_sql;

use project_sql;

create table olympics
(ID int,
Name varchar(400) ,
Sex varchar(50) ,
Age int,
Height  int,
Weight int ,
Team varchar(300),
NOC varchar(300),
Games varchar(200),
Year int,
Season varchar(200),
City varchar(100),
Sport varchar (100),
Event varchar (100),
Medal varchar(100)
);

SHOW VARIABLES LIKE "secure_file_priv"; 

load data infile 
'C:\ProgramData\MySQL\MySQL Server 8.2\Uploads\Athletes_Cleaned.csv' 
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

show tables;

select * from olympics;
 
 
-- SQL PROJECT

-- 1. Show how many medal counts present for entire data

select medal,count(medal) as medal_count
from olympics
where  medal != 'nomedal'
group by medal
order by medal_count;

-- 2. Show count of unique sports present in Olympics

select count(distinct sport) 
as unique_sports_count
from olympics;
 
-- 3. Show how many different medals won by team India

select  Team,medal,count(medal) as Different_medal
from olympics
where  team ='India' and medal != 'nomedal'
group by medal
order by Different_medal;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order

select Team,event,medal,count(medal) as medal_count
from olympics
where team='India' and medal != 'nomedal'
group by event,medal
order by medal_count desc;

-- 5. Show event wise medals won by India in order of year

select Team,event,year,count(medal) as medal_count 
from olympics
where team='india' and medal != 'nomedal'
group by event,year
order by year;

-- 6. show country who won maximum medals.

select team,medal,count(medal) as max_medal
from olympics
where medal != 'nomedal'
group by team,medal
order by max_medal desc
limit 1;

-- 7.show top 10 countries who won gold

select team,medal, count(medal) as Medal_own
from olympics
where medal = 'Gold'
group by team,medal
order by Medal_own desc
limit 10;

-- 8. show in which year did United states won most gold medal

select Team,year,medal,count(medal) as Most_Gold
from olympics
where team = 'United States' and medal = 'Gold'
group by year,medal
order by Most_Gold desc
limit 1;

-- 9. In which sports United States has most medals.

select Team,sport,count(medal) as Most_medal
from olympics
where team='United states' and medal != 'nomedal'
group by Team,sport
order by Most_medal desc
limit 1;

-- 10. Find top three players who won most medals along with their sports and country

select Name,team,sport,count(medal) as Most_medal
from olympics
where medal != 'nomedal'
group by name,team,sport
order by Most_medal desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.

select Team,name,sport,count(medal) as Most_Gold
from olympics
where sport='cycling' and medal = 'Gold'
group by name,team,sport
order by Most_Gold desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.

select name,team,sport,medal,count(medal) as Most_medal
from olympics
where medal in ('Gold','Silver','Bronze') and sport='Basketball'
group by medal,team,name
order by Most_medal desc
limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards

select Name,medal,count(medal) as Different_medal
from olympics
where name = 'Teresa Edwards' and 
sport = 'basketball' and 
medal != 'nomedal'
group by medal
order by Different_medal ;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel

select year,sex,count(medal) as Total_medal
from olympics
where medal != 'nomedal'
group by year,sex
order by Total_medal;
