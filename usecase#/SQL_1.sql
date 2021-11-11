Select "YEAR", "Project", COALESCE(EXPENSES,0) AS EXPENSES, COALESCE(REVENUE,0) AS REVENUE
from
(
SELECT "Project"
, (sum("Debit") - sum("Credit")) as Expenses
, extract(year from to_timestamp("Posted Dt.")) as Year
FROM "PROD_CTF_RAW"."SRC_SPREADSHEET"."2020_GL_FUNDRAISING_EXPENSES"
group by "Project", Year
UNION
SELECT "Project"
, (sum("Debit") - sum("Credit")) as Expenses
, extract(year from to_timestamp("Posted Dt.")) as Year
FROM "PROD_CTF_RAW"."SRC_SPREADSHEET"."2019_GL_FUNDRAISING_EXPENSES"
group by "Project", Year
UNION
SELECT "Project"
, (sum(coalesce("Debit",0)) - sum(coalesce("Credit",0))) as Expenses
, extract(year from to_timestamp("Posted Dt.")) as Year
FROM "PROD_CTF_RAW"."SRC_SPREADSHEET"."2018_GL_FUNDRAISING_EXPENSES"
group by "Project", Year
UNION
SELECT "Project"
, (sum(coalesce("Debit",0)) - sum(coalesce("Credit",0))) as Expenses
, extract(year from to_timestamp("Posted Dt.")) as Year
FROM "PROD_CTF_RAW"."SRC_SPREADSHEET"."2021_GL_FUNDRAISING_EXPENSES"
group by "Project", Year
) a
left join
(
SELECT year(CLOSEDATE) AS CLOSEDATE, INTACCT_PROJECT_CODE__C, SUM(coalesce(AMOUNT,0)) as REVENUE
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY"
WHERE year(CLOSEDATE) in (2021,2020,2019,2018)
AND ISWON = 1
GROUP BY YEAR(CLOSEDATE), INTACCT_PROJECT_CODE__C
) B
on A.YEAR = B.CLOSEDATE
and "Project" = "INTACCT_PROJECT_CODE__C"
group by "YEAR","Project", "EXPENSES", "REVENUE"
order by "YEAR", "Project"