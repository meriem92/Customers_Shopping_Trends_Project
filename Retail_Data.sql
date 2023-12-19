-- The ratio of male to female customers is about 68:32, using the date the store has on female customers,
-- What strategy do you recommend the store puts in place to attract more female customers.alter

-- Checking if problem is real, means if store has more male customers than female and check the ratio too.alter

SELECT * FROM shopping_trends_updated;

SELECT Gender, COUNT(`Customer ID`) AS Count_client
FROM shopping_trends_updated 
GROUP BY Gender
ORDER BY Count_client;


SELECT
	SUM(gender = 'Male') AS `Male`,
	SUM(gender='Female') AS `Female`,
	   ROUND(SUM(Gender='Male') / (SUM(Gender='Male')+SUM(Gender='Female'))*100,2 ) AS Males,
	   ROUND(SUM(Gender='Female')/ (SUM(Gender='Female')+SUM(Gender='Male')) *100,2 )AS Females
FROM shopping_trends_updated;

-- What female age group do we mostly sell to

-- Maximum Age of Female & Male customer
(SELECT Age,Gender
FROM shopping_trends_updated
WHERE Gender='Male'
ORDER BY Age DESC
LIMIT 1
) UNION ALL
(SELECT Age,Gender
FROM shopping_trends_updated
WHERE Gender='Female'
ORDER BY Age DESC
LIMIT 1
);

-- Age group of all customers
SELECT 
	CASE 
		WHEN Age BETWEEN 18 AND 31 THEN '18-31'
        WHEN Age BETWEEN 32 AND 45 THEN '32-45'
        WHEN Age BETWEEN 46 AND 59 THEN '46-59'
        WHEN Age BETWEEN 60 AND 70 THEN '60-70'
        END AS age_group,COUNT(*) AS cnt_Tclient
FROM shopping_trends_updated
GROUP BY 1
ORDER BY 2 DESC;

-- Age group of female customers 
SELECT 
	CASE 
		WHEN Age BETWEEN 18 AND 31 THEN '18-31'
        WHEN Age BETWEEN 32 AND 45 THEN '32-45'
        WHEN Age BETWEEN 46 AND 59 THEN '46-59'
        WHEN Age BETWEEN 60 AND 70 THEN '60-70'
        END AS age_group,COUNT(*) AS cnt_Fclient
FROM shopping_trends_updated
WHERE Gender='Female'
GROUP BY 1
ORDER BY 2 DESC;

-- Age group of Male customers
SELECT 
	CASE 
		WHEN Age BETWEEN 18 AND 31 THEN '18-31'
        WHEN Age BETWEEN 32 AND 45 THEN '32-45'
        WHEN Age BETWEEN 46 AND 59 THEN '46-59'
        WHEN Age BETWEEN 60 AND 70 THEN '60-70'
        END AS age_group,COUNT(*) AS cnt_Mclient
FROM shopping_trends_updated
WHERE Gender='Male'
GROUP BY 1
ORDER BY 2 DESC;

-- What is the most and least popular Category
SELECT Category,COUNT(`Customer ID`) AS count_client
FROM shopping_trends_updated
GROUP BY Category
ORDER BY 2 DESC;

-- Which season has the most puchases
SELECT Season,COUNT(`Customer ID`) AS purchase_count
FROM shopping_trends_updated
GROUP BY 1
ORDER BY 2 DESC;

-- Which Payment Method clients prefer
SELECT `Payment Method`,COUNT(`Customer ID`) AS purchase_count
FROM shopping_trends_updated
GROUP BY 1
ORDER BY 2 DESC;

-- Which Shipping type clients prefer
SELECT `Shipping Type`,COUNT(`Customer ID`) AS purchase_count
FROM shopping_trends_updated
GROUP BY 1
ORDER BY 2 DESC;

-- Which items clients prefer
SELECT `Item Purchased`,COUNT(`Customer ID`) AS purchase_count
FROM shopping_trends_updated
GROUP BY 1
ORDER BY 2 DESC;
-- LIMIT 5;

-- Which age group buys more
-- What is the most purchased item by that age group

 SELECT 
	CASE 
		WHEN Age BETWEEN 18 AND 31 THEN '18-31'
        WHEN Age BETWEEN 32 AND 45 THEN '32-45'
        WHEN Age BETWEEN 46 AND 59 THEN '46-59'
        WHEN Age BETWEEN 60 AND 70 THEN '60-70'
        END AS age_group,`Item Purchased`,COUNT(*) AS cnt_Tclient
FROM shopping_trends_updated
GROUP BY 1,2
HAVING age_group ='46-59'
ORDER BY 3 DESC;

-- Which age group buys more
-- What is the most common payment method used by that age group

SELECT 
	CASE 
		WHEN Age BETWEEN 18 AND 31 THEN '18-31'
        WHEN Age BETWEEN 32 AND 45 THEN '32-45'
        WHEN Age BETWEEN 46 AND 59 THEN '46-59'
        WHEN Age BETWEEN 60 AND 70 THEN '60-70'
        END AS age_group,`Payment Method`,COUNT(*) AS cnt_Tclient
FROM shopping_trends_updated
GROUP BY 1,2
HAVING age_group='46-59'
ORDER BY 3 DESC;