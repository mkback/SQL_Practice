-- Did the west ever produce more that 50,000 houstin units? 
SELECT *
FROM tutorial.us_housing_units
WHERE west > 50; 

-- Did the South ever produce less than 20000? 
SELECT * 
FROM tutorial.us_housing_units 
WHERE south <= 20; 

-- Show only Feb results 
SELECT * 
FROM tutorial.us_housing_units 
WHERE month_name = 'February'; 

SELECT * 
FROM tutorial.us_housing_units 
WHERE month_name < 'O';

-- Add all 4 regions together 
SELECT year, month_name, south + west + midwest + northeast AS total_US_column 
FROM tutorial.us_housing_units ; 

-- Select rows where more were produced in west 
SELECT * 
FROM tutorial.us_housing_units 
WHERE west > ( midwest + northeast) ; 

-- show % 
Select year, month_name, 
      west/(west + south + midwest + northeast)*100 AS west_pct,
       south/(west + south + midwest + northeast)*100 AS south_pct,
       midwest/(west + south + midwest + northeast)*100 AS midwest_pct,
       northeast/(west + south + midwest + northeast)*100 AS northeast_pct
FROM tutorial.us_housing_units
Where year >= 2000 ; 


-- Order songs 
Select * 
from tutorial.billboard_top_100_year_end
ORder By year DESC, year_rank; 

-- Snoop songs
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE "group" LIKE '%Snoop%'; 

-- Ludacris songs
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE "group" LIKE '%Ludacris%'; 

-- Starts with DJ songs
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE "group" LIKE 'DJ%'; 

-- Select only the songs that are top 3 
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE year_rank IN (1, 2, 3); 
 
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE "group" IN ('M.C. Hammer', 'Hammer', 'Elvis Presley'); 

-- Null song names? 
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE song_name IS NULL ; 

-- 
SELECT *FROM tutorial.billboard_top_100_year_end
WHERE year = 2012 AND year_rank <= 10 AND "group" ILIKE '%feat%' ; 

-- Top 10 songs with luda
SELECT *FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10 AND "group" LIKE '%Ludacris%' ;

-- Top 10 songs in dif years
SELECT *FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10 AND year IN (1990, 2000, 2010) ;

-- Top 10 love songs in 60s years
SELECT *FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10 AND year BETWEEN 1960 AND 1969
   AND song_name ilike '%love%' ;

-- Songs with no a in the title
SELECT *FROM tutorial.billboard_top_100_year_end
WHERE song_name NOT LIKE '%a%' ; 

SELECT * FROM tutorial.billboard_top_100_year_end
ORDER BY artist ; 

-- ORder songs 
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE year = 2012
ORDER BY artist DESC; 

-- ORder songs 
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE year = 2010
ORDER BY year_rank, artist DESC; 

-- Order TPAIN songs 
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE "group" LIKE '%T-Pain%'
ORDER BY year_rank DESC; 