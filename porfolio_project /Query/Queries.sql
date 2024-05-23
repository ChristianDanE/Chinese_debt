CREATE TABLE gdp (ID integer PRIMARY KEY,
				 country varchar,
				 continent varchar,
				 pupulation integer,
				 IMF_GDP bigint,
				 gdp_per_capita varchar);
				 

ALTER TABLE gdp
ALTER COLUMN pupulation
TYPE varchar 

ALTER TABLE gdp
ALTER COLUMN IMF_GDP 
TYPE varchar 

SELECT * FROM gdp

-- because most of the data cleanig will happen in excel i keept the data type as varchar



				   
CREATE TABLE Dept (country_id integer,
				  country varchar,
				  project varchar,
				  year varchar,
				  amount varchar,
				  lender varchar,
				  borrower varchar,
				  sector varchar,
				  sensitive_territory varchar);
				  

				  
SELECT * FROM Dept				 
				  
ALTER TABLE Dept
ADD FOREIGN KEY (country_id)
REFERENCES gdp(ID)
ON DELETE SET NULL;				  
				  
SELECT * FROM Dept	
-- here is what each counrty owes and what year the money was borrowed 
SELECT DISTINCT(country) AS country_name, year, amount AS amount_owed
FROM Dept
ORDER BY country


SELECT DISTINCT(country) AS country_name, year, amount AS amount_owed, lender
FROM Dept
WHERE country = 'Democratic Republic of Congo';

-- african countries that owe that owe to china 
SELECT DISTINCT(Dept.country) AS country_name, year, amount AS amount_owed, lender, continent, IMF_GDP 
FROM Dept
JOIN gdp ON Dept.country_id = gdp.ID
WHERE continent = 'Africa';

-- here are the countries that owe money to china in europe accorting to this data.

SELECT DISTINCT(Dept.country) AS country_name, continent, IMF_GDP AS GDP, amount AS amount_owed,year, lender  
FROM Dept
JOIN gdp ON Dept.country_id = gdp.ID
WHERE continent = 'Europe'
ORDER BY Dept.country DESC;

-- here goes the one in north america

SELECT DISTINCT(Dept.country) AS country_name, continent, IMF_GDP AS GDP, amount AS amount_owed,year, lender  
FROM Dept
JOIN gdp ON Dept.country_id = gdp.ID
WHERE continent = 'North America'
ORDER BY Dept.country DESC;

-- here are the south american counrtries in ascending order

SELECT DISTINCT(Dept.country) AS country_name, continent, IMF_GDP AS GDP, amount AS amount_owed,year, lender  
FROM Dept
JOIN gdp ON Dept.country_id = gdp.ID
WHERE continent = 'South America'
ORDER BY Dept.country ASC;

--Asian countries

SELECT DISTINCT(Dept.country) AS country_name, continent, IMF_GDP AS GDP, amount AS amount_owed,year, lender  
FROM Dept
JOIN gdp ON Dept.country_id = gdp.ID
WHERE continent = 'Asia'
ORDER BY Dept.country ASC;

--Ocianian countries

SELECT DISTINCT(Dept.country) AS country_name, continent, IMF_GDP AS GDP, amount AS amount_owed,year, lender  
FROM Dept
JOIN gdp ON Dept.country_id = gdp.ID
WHERE continent = 'Oceania'
ORDER BY Dept.country ASC;