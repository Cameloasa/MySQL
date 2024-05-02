# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first - 7 rows
SELECT * 
FROM City 
WHERE Name LIKE 'ping%' ORDER BY Population;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first - 7 rows
SELECT * 
FROM City 
WHERE Name LIKE 'ran%' ORDER BY Population DESC;
#
# 3: Count all cities - 4049
SELECT COUNT(*) 
FROM City;
#
# 4: Get the average population of all cities -'350468.2236'
SELECT AVG(Population) 
FROM City;
#
# 5: Get the biggest population found in any of the cities -'10500000' 
SELECT MAX(Population) 
FROM City;
#
# 6: Get the smallest population found in any of the cities - 42
SELECT MIN(Population) 
FROM City;
#
# 7: Sum the population of all cities with a population below 10000
SELECT SUM (Population) 
FROM City 
WHERE Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM - 34
SELECT CountryCode, COUNT(*) 
FROM City WHERE CountryCode IN ('MOZ','VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM - 12,22
SELECT CountryCode, COUNT(*) 
FROM City 
WHERE CountryCode IN('MOZ','VNM') 
GROUP BY CountryCode;
#
# 10: Get average population of cities in MOZ and VNM- 2 rows //'MOZ', '261928.7500', 'VNM', '425673.3182'
SELECT CountryCode, AVG(Population) 
FROM City 
WHERE CountryCode IN('MOZ','VNM') 
GROUP BY CountryCode;
#
# 11: Get the countrycodes with more than 200 cities - 5 rows
SELECT CountryCode 
FROM City 
GROUP BY countryCode HAVING COUNT(*) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count - 5 rows
SELECT CountryCode, COUNT(*) AS CityCount 
FROM City 
GROUP BY CountryCode 
HAVING CityCount > 200 
ORDER BY CityCount DESC;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ? - ITALIAN
SELECT Language FROM CountryLanguage 
WHERE CountryCode IN (SELECT CountryCode FROM City WHERE Population BETWEEN 400 AND 500);
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them - 8 rows
SELECT City.Name, CountryLanguage.Language 
FROM City INNER JOIN CountryLanguage ON City.CountryCode = CountryLanguage.CountryCode 
WHERE City.Population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself) -17 cities
SELECT Name 
FROM City 
WHERE CountryCode 
IN (SELECT CountryCode FROM City WHERE Population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT Name 
FROM City
 WHERE CountryCode IN (SELECT CountryCode FROM City WHERE Population = 122199) AND Population != 122199;
#
# 17: What are the city names in the country where Luanda is capital? - ??
SELECT Name 
FROM City
WHERE CountryCode = (SELECT CountryCode FROM Country WHERE Capital = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT Capital 
FROM Country 
WHERE Region = (SELECT Region FROM Country WHERE Name = 'Yaren');
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT Language 
FROM CountryLanguage
WHERE CountryCode 
IN (SELECT CountryCode FROM Country WHERE Region = (SELECT Region FROM Country WHERE Name = 'Riga'));
#
# 20: Get the name of the most populous city
SELECT Name 
FROM City 
WHERE Population = (SELECT MAX(Population) FROM City);
