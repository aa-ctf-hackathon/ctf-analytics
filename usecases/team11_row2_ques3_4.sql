-- Average Cumulative Years of Giving by Account Record Type
-- How long do households and organizations typically engage philanthropically?

 

SELECT AccountByCumulative.HH_ORG, Avg(AccountByCumulative.cumulativeyears), Count(*)
FROM
(SELECT  "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".ID,case when "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".RECORDTYPEID = '012G0000001BKhsIAG'then 'Organization'
else 'Household'
End as HH_ORG,
count(distinct Extract( YEAR from "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".CLOSEDATE) ) as cumulativeyears 
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT"
INNER JOIN "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY" 
ON "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".ID = "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".ACCOUNTID 
group by 1,2 ) AS AccountByCumulative
group by 1

 


--Distribution of Accounts by Cumulative Years of Giving and Account Record Type
-- What is the distribution of cumulative giving across households and organizations over a 5-year period?
 

SELECT AccountByCumulative.HH_ORG, AccountByCumulative.cumulativeyears, Count(*)
FROM
(SELECT  "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".ID,case when "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".RECORDTYPEID = '012G0000001BKhsIAG'then 'Organization'
else 'Household'
End as HH_ORG,
count(distinct Extract( YEAR from "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".CLOSEDATE) ) as cumulativeyears 
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT"
INNER JOIN "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY" 
ON "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".ID = "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".ACCOUNTID 
group by 1,2 ) AS AccountByCumulative
group by 1,2
order by 1,2