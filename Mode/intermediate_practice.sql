-- Practice some intermediate skills in SQL such as Joins & math 
SELECT * FROM tutorial.aapl_historical_stock_price; 

-- Count the rows in the table 
SELECT COUNT(*) FROM tutorial.aapl_historical_stock_price; 
SELECT COUNT(high) FROM tutorial.aapl_historical_stock_price; 
SELECT COUNT(low) FROM tutorial.aapl_historical_stock_price; 
SELECT COUNT(date) as Date, COUNT(year) as Year, COUNT(month) as Month, COUNT(high) as High, COUNT(low) as Low, COUNT(close) as Close, COUNT(volume) as Volume, COUNT(id) as ID
FROM tutorial.aapl_historical_stock_price;

-- Sum the rows in the table
SELECT SUM(volume)
FROM tutorial.aapl_historical_stock_price;

SELECT COUNT(open), SUM(open)
FROM tutorial.aapl_historical_stock_price;
-- Avg open price 
SELECT sum(open)/COUNT(open) as AVG_open_price
FROM tutorial.aapl_historical_stock_price;

-- Mins & MAx
SELECT MIN(volume) AS min_volume, MAX(volume) AS max_volume
FROM tutorial.aapl_historical_stock_price; 

SELECT MIN(low)
FROM tutorial.aapl_historical_stock_price; 

SELECT MAX(close - open)
FROM tutorial.aapl_historical_stock_price; 

-- Avg
SELECT AVG(high)
FROM tutorial.aapl_historical_stock_price
WHERE high IS NOT NULL;

-- Group by 
SELECT year,COUNT(*) AS count
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year; 

SELECT year, month, COUNT(*) AS count
FROM tutorial.aapl_historical_stock_price
GROUP BY 1, 2 ; 

SELECT year, AVG(close - open) as AVG_daily_change
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year;

SELECT month, MAX(high) as Max_price, MIN(low) as Min_price
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY month ;

--Having (better than WHERE)
SELECT year,month,MAX(high) AS month_high
FROM tutorial.aapl_historical_stock_price
GROUP BY year, month
HAVING MAX(high) > 400
ORDER BY year, month ; 

-- CASE (like if/then in Excel)
SELECT * FROM benn.college_football_players ; 

SELECT player_name, year, 
  CASE WHEN year = 'SR' THEN 'yes' ELSE NULL END AS is_a_senior
FROM benn.college_football_players ; 

SELECT player_name, hometown, 
  CASE WHEN state = 'CA' THEN 'yes' ELSE NULL END AS from_california
FROM benn.college_football_players
ORDER BY from_california; 

SELECT player_name, weight,
  CASE WHEN weight > 250 THEN 'over 250'
    WHEN weight > 200 THEN '201-250'
    WHEN weight > 175 THEN '176-200'
    ELSE '175 or under' END AS weight_group
FROM benn.college_football_players ; 

SELECT MAX(height) as max, MIN(height) as min, AVG(height) as avg
FROM benn.college_football_players ; 

SELECT player_name, height,
  CASE WHEN height >= 72 THEN 'over 6ft'
    WHEN height >= 60 THEN '5-6ft'
    ELSE 'Under 5ft' END AS height_group
FROM benn.college_football_players ; 