-- Netflix Data Analysis Project

USE netflix_project;

-- View all tables
SHOW TABLES;

-- Preview the dataset
SELECT * 
FROM netflix_titles 
LIMIT 5;

-- Count total titles in the dataset
SELECT COUNT(*) AS total_titles 
FROM netflix_titles;

-- Task 6: Distribution of Movies vs TV Shows
SELECT type, COUNT(*) AS total_content 
FROM netflix_titles 
GROUP BY type;

-- Task 7: Top 10 countries by content volume
SELECT country, COUNT(*) AS total_content 
FROM netflix_titles 
WHERE country IS NOT NULL AND country <> ''
GROUP BY country 
ORDER BY total_content DESC 
LIMIT 10;

-- Task 8: Content rating analysis
SELECT rating, COUNT(*) AS total_titles 
FROM netflix_titles 
WHERE rating IS NOT NULL AND rating <> ''
GROUP BY rating 
ORDER BY total_titles DESC;

-- Task 9: Content distribution by release year
SELECT release_year, COUNT(*) AS total_titles 
FROM netflix_titles 
GROUP BY release_year 
ORDER BY release_year DESC;

-- Task 10: Top 10 directors with most titles
SELECT director, COUNT(*) AS total_titles 
FROM netflix_titles 
WHERE director IS NOT NULL AND director <> ''
GROUP BY director 
ORDER BY total_titles DESC 
LIMIT 10;

-- Task 11: Total number of movies released after 2018
SELECT COUNT(*) AS total_movies 
FROM netflix_titles 
WHERE type = 'Movie' AND release_year > 2018;

-- Task 12: List of titles released after 2018 (Preview)
SELECT title 
FROM netflix_titles 
WHERE release_year > 2018 
LIMIT 5;

-- Task 13: Top 10 genres on Netflix
SELECT listed_in AS genre, COUNT(*) AS total_titles 
FROM netflix_titles 
GROUP BY listed_in 
ORDER BY total_titles DESC 
LIMIT 10;

-- Task 14: Countries producing more than 10 titles
SELECT country, COUNT(*) AS total_titles 
FROM netflix_titles 
WHERE country IS NOT NULL AND country <> ''
GROUP BY country 
HAVING COUNT(*) > 10 
ORDER BY total_titles DESC;

-- Task 15: Percentage distribution of Movies vs TV Shows
SELECT type, COUNT(*) AS total_titles, 
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_titles), 2) AS percentage 
FROM netflix_titles 
GROUP BY type;

-- Task 16: Content release trends in the last 5 years
SELECT release_year, COUNT(*) AS total_titles 
FROM netflix_titles 
GROUP BY release_year 
ORDER BY release_year DESC 
LIMIT 5;

-- Task 17: Movie count by rating
SELECT rating, COUNT(*) AS total_movies 
FROM netflix_titles 
WHERE type = 'Movie' 
GROUP BY rating 
ORDER BY total_movies DESC;

-- Task 18: Content added by year (date parsing)
SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS added_year, 
       COUNT(*) AS total_titles 
FROM netflix_titles 
WHERE date_added IS NOT NULL 
GROUP BY added_year 
ORDER BY total_titles DESC;

-- Task 19: Categorizing content based on release year
SELECT 
    CASE 
        WHEN release_year < 2000 THEN 'Old Content' 
        WHEN release_year BETWEEN 2000 AND 2015 THEN 'Modern Content' 
        ELSE 'Recent Content' 
    END AS content_category, 
    COUNT(*) AS total_titles 
FROM netflix_titles 
GROUP BY content_category;

-- Task 20: Average release year by content type
SELECT type, ROUND(AVG(release_year), 0) AS avg_release_year 
FROM netflix_titles 
GROUP BY type;

-- Task 21: Top 5 ratings on the platform
SELECT rating, COUNT(*) AS total_titles 
FROM netflix_titles 
WHERE rating IS NOT NULL AND rating <> ''
GROUP BY rating 
ORDER BY total_titles DESC 
LIMIT 5;

-- Task 22: Directors with more than 1 title in the catalog
SELECT director, COUNT(*) AS total_titles 
FROM netflix_titles 
WHERE director IS NOT NULL AND director <> ''
GROUP BY director 
HAVING COUNT(*) > 1 
ORDER BY total_titles DESC;

-- Task 23: Rank countries based on content volume
SELECT country, COUNT(*) AS total_titles, 
       RANK() OVER (ORDER BY COUNT(*) DESC) AS country_rank 
FROM netflix_titles 
WHERE country IS NOT NULL AND country <> ''
GROUP BY country;

-- Task 24: Row number assignment for countries based on content volume
SELECT country, COUNT(*) AS total_titles, 
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num 
FROM netflix_titles 
WHERE country IS NOT NULL AND country <> ''
GROUP BY country;
