use netflix_project;
show tables;
select * 
from netflix_titles
limit 5;

select count(*) as total_titles
from netflix_titles;

# task 6 - movies vs tv shows
select type ,count(*) as total_content
from netflix_titles
group by type;


# task 7 - which couuntry has highest content occurs 
select country , count(*) as total_content
from netflix_titles
where country is not null
group by country 
order by total_content desc 
limit 10;
# netlfix in united states is big contributer 

# task 8 - rating analysis 
select rating,
count(*) as total_tiles
from netflix_titles
group by rating
order by total_tiles desc;
# tv-ma and tv - 14 has highest rating 

# task 9 - latest release years 
select release_year, count(*)  as total_tiles
from netflix_titles
group by release_year
order by release_year desc;

# recent years content productuon increases

# top 10 directors 
select director, 
count(*) as total_titles
from netflix_titles
where director is not null
group by director
order by total_titles desc
limit 10;


# task 11 - movies release after 2018 
select count(*) as total_movies
from netflix_titles
where type = 'Movie'
and release_year > 2018;
# 27 movies released after 2018 
# which movies released after 2018
select * from netflix_titles;
select title as movie 
from netflix_titles
where release_year > 2018
limit 5;
# top genres  - netlflix popular genres 
select listed_in,
count(*) as total_tiles
from netflix_titles
group by listed_in
order by total_tiles desc
limit 10;

# task -- countries with more than 100 titles
select distinct country , count(*) as total_titles
from netflix_titles
where country is not null
group by country 
having count(*) > 10
order by total_titles desc;

# task - movie vs tv show percentage
select type , count(*) as total_titles, 
round(count(*) * 100.0 /(select count(*) from netflix_titles),2)
as percentage
from netflix_titles
group by type;

# latest 5 years trends 
select release_year, 
count(*) as total_titles from netflix_titles 
group by release_year 
order by release_year desc 
limit 5;

select rating , count(*) as total_movies
from netflix_titles
where type = 'Movie'
group by rating 
order by total_movies desc;

# task 17 - content added by year  most
SELECT YEAR(STR_TO_DATE(date_added,
'%M %d, %Y')) AS added_year,
COUNT(*) AS total_titles
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY added_year
ORDER BY total_titles DESC;

# task case wwhen 
SELECT
CASE
    WHEN release_year < 2000 THEN 'Old Content'
    WHEN release_year BETWEEN 2000 AND 2015 THEN 'Modern Content'
    ELSE 'Recent Content'
END AS content_category,
COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY content_category;

#Task 19 - Average Release Year by Type
SELECT
type,
ROUND(AVG(release_year),0) AS avg_release_year
FROM netflix_titles
GROUP BY type;

# Top 5 ratings 
SELECT
rating,
COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY rating
ORDER BY total_titles DESC
LIMIT 5;


# task - director with more than 10 titles 
select director , count(*) as total_tiles
from netflix_titles
where director is not null
AND director <> ''
group by  director 
having count(*) > 1
order by total_tiles desc;

# ranking 
SELECT
country,
COUNT(*) AS total_titles,
RANK() OVER(
ORDER BY COUNT(*) DESC
) AS country_rank
FROM netflix_titles
WHERE country IS NOT NULL
AND country <> ''
GROUP BY country;


#unique ranking 
SELECT
country,
COUNT(*) AS total_titles,
ROW_NUMBER() OVER(
ORDER BY COUNT(*) DESC
) AS row_num
FROM netflix_titles
WHERE country IS NOT NULL 
AND country <> ''
GROUP BY country;

