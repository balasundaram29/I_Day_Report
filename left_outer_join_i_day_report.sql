SET @start_date= '2012-01-01';
SET @end_date= '2015-01-01';

DROP VIEW IF EXISTS  `MonthView`;
DROP TABLE IF EXISTS  `MonthView`;
CREATE  TEMPORARY TABLE `MonthView` AS 
SELECT month(`date`) AS  'NMonth',year(`date`) AS 'Year', 
 `at_type` AS 'Type' ,sum( `quantity`)  AS 'Quantity' FROM  `production`
 WHERE  `date` BETWEEN @start_date AND @end_date  
 GROUP BY month(`date`) ,`at_type` 
ORDER BY  `at_type`,year(`date`),month(`date`);
DROP TABLE IF EXISTS  `MonthView2`;
CREATE TEMPORARY TABLE MonthView2 AS SELECT CONCAT(MONTHNAME(STR_TO_DATE(`NMonth`, '%m')),
            ' ',
            CAST(`Year` AS CHAR)) AS `Month`,
    MAX(IF(`Type` = 'AE50', `Quantity`, 0)) AS `AE50`,
    MAX(IF(`Type` = 'AE100', `Quantity`, 0)) AS `AE100`,
    MAX(IF(`Type` = 'AE130', `Quantity`, 0)) AS `AE130` FROM
    `MonthView`
GROUP BY `Month`
ORDER BY `Year` , `NMonth`;
DROP TABLE IF EXISTS  `results`;
CREATE TEMPORARY TABLE `results` AS SELECT `month_str`,
    COALESCE(AE50, 0) AS `AE50`,
    COALESCE(AE100, 0) AS `AE100`,
    COALESCE(AE50, 0) AS `AE130` FROM
    `AllMonths2010_2025`
        LEFT OUTER JOIN
    `MonthView2` ON `AllMonths2010_2025`.`month_str` = `MonthView2`.`Month`;
SELECT * FROM `results`;
