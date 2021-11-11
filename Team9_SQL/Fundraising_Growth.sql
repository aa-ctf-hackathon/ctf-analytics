--Fundraising Growth/Trends Over Time
--a) Total Gift Amount, b) Total Number of Gifts, c) Average Gift Amount, d) Median Gift Amount, e) Average Number of Gifts MoM YTD 
SELECT MONTHX, YEARX, MEDIAN_AMOUNT, TOTAL_GIFT_AMOUNT, COUNT_OF_GIFT_AMOUNT, AVERAGE_AMOUNT  FROM
(
SELECT MONTH(CLOSEDATE) AS MONTHX, YEAR(CLOSEDATE) AS YEARX,
PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY AMOUNT) OVER (
PARTITION BY YEAR(CLOSEDATE), MONTH(CLOSEDATE)) AS MEDIAN_AMOUNT
FROM "PROD_CTF_CLEAN"."CTF_CLEAN_T9"."Opportunity"
where ISCLOSED = 'TRUE' AND ISWON = 'TRUE' AND STAGENAME = 'Received'  
ORDER BY YEAR(CLOSEDATE), MONTH(CLOSEDATE) DESC
) PDATA
INNER JOIN
(
SELECT SUM(AMOUNT) AS TOTAL_GIFT_AMOUNT, COUNT(AMOUNT) AS COUNT_OF_GIFT_AMOUNT,
AVG(AMOUNT) AS AVERAGE_AMOUNT, YEAR(CLOSEDATE) AS YEARY, MONTH(CLOSEDATE) AS MONTHY
FROM "PROD_CTF_CLEAN"."CTF_CLEAN_T9"."Opportunity"
where ISCLOSED = 'TRUE' AND ISWON = 'TRUE' AND STAGENAME = 'Received'  
GROUP BY YEAR(CLOSEDATE), MONTH(CLOSEDATE)
ORDER BY YEAR(CLOSEDATE), MONTH(CLOSEDATE) DESC
)
MAIN_DATA
ON PDATA.MONTHX = MAIN_DATA.MONTHY
AND PDATA.YEARX = MAIN_DATA.YEARY
