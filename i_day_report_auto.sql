SET @start_date='2013-01-01';
SET @end_date ='2025-05-30';
USE `db_for_bis_mb`;
DROP TABLE IF EXISTS  `MonthView`;
CREATE  TEMPORARY TABLE `MonthView` AS
    SELECT 
        month(`date`) AS 'NMonth',
        year(`date`) AS 'Year',
        `at_type` AS 'Type',
        sum(`quantity`) AS 'Quantity'
    FROM
        `production`
    WHERE
        `date`  BETWEEN   @start_date  AND  @end_date
    GROUP BY month(`date`) , `at_type`
    ORDER BY `at_type` , year(`date`) , month(`date`);
SET @holder= NULL;
SELECT 
	GROUP_CONCAT(DISTINCT
		CONCAT(
				"MAX(IF(`Type`=","\'",
					`Type`,"\',`Quantity`,NULL))  AS ", "`",`Type`,"`"
						)
	)
 INTO @holder
FROM `MonthView`;

SET @holder=CONCAT(" SELECT MONTHNAME(STR_TO_DATE(`NMonth`, "," \'%m\'", "))  AS `Month`, `Year`,",@holder,
"  FROM   `MonthView` GROUP BY `Month` ORDER BY  `Year` , `NMonth`");
SELECT @holder;
PREPARE  stmt FROM @holder;
EXECUTE stmt;
DEALLOCATE  PREPARE stmt;


SELECT 
    `at_type` AS 'Type',
    ROUND(max(`rhead`), 2) AS 'RHeadMax',
    ROUND(min(`rhead`), 2) AS 'RHeadMin',
    ROUND(max(`rdisch`), 2) AS 'RDischMax',
    ROUND(min(`rdisch`), 2) AS 'RDischMin',
    ROUND(max(`oaeff`), 2) AS 'OAEffMax',
    ROUND(min(`oaeff`), 2) AS 'OAEffMin',
    ROUND(max(`maxcurrent`), 2) AS 'MaxCurrMax',
    ROUND(min(`maxcurrent`), 2) AS 'MaxCurrMin'
FROM
    `observed_values`
WHERE
    `date` BETWEEN @start_date AND @end_date
GROUP BY `Type`;
USE `db_for_bis_sub`;
DROP TABLE IF EXISTS  `MonthView`;
CREATE TEMPORARY TABLE  `MonthView` AS
    SELECT 
        month(`date`) AS 'NMonth',
        year(`date`) AS 'Year',
        `at_type` AS 'Type',
        sum(`quantity`) AS 'Quantity'
    FROM
        `production`
    WHERE
        `date` BETWEEN   @start_date  AND  @end_date 
    GROUP BY month(`date`) , `at_type`
    ORDER BY `at_type` , year(`date`) , month(`date`);
SET @holder= NULL;
SELECT 
	GROUP_CONCAT(DISTINCT
		CONCAT(
				"MAX(IF(`Type`=","\'",
					`Type`,"\',`Quantity`,NULL))  AS ", "`",`Type`,"`"
						)
	)
 INTO @holder
FROM `MonthView`;

SET @holder=CONCAT(" SELECT MONTHNAME(STR_TO_DATE(`NMonth`, "," \'%m\'", "))  AS `Month`, `Year`,",@holder,
"  FROM   `MonthView` GROUP BY `Month` ORDER BY  `Year` , `NMonth`");
SELECT @holder;

PREPARE  stmt FROM @holder;
EXECUTE stmt;
DEALLOCATE  PREPARE stmt;

SELECT 
    `at_type` AS 'Type',
    ROUND(max(`rhead`), 2) AS 'RHeadMax',
    ROUND(min(`rhead`), 2) AS 'RHeadMin',
    ROUND(max(`rdisch`), 2) AS 'RDischMax',
    ROUND(min(`rdisch`), 2) AS 'RDischMin',
    ROUND(max(`oaeff`), 2) AS 'OAEffMax',
    ROUND(min(`oaeff`), 2) AS 'OAEffMin',
    ROUND(max(`maxcurrent`), 2) AS 'MaxCurrMax',
    ROUND(min(`maxcurrent`), 2) AS 'MaxCurrMin'
FROM
    `observed_values`
WHERE
    `date` BETWEEN @start_date AND @end_date
GROUP BY `Type`;