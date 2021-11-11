
CREATE VIEW OPPORT as
SELECT CLOSEDATE, AMOUNT, RECORDTYPEID, INTACCT_PROJECT_CODE__C from PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY;


CREATE VIEW TEAM1_1A as
select date_trunc('Year', "CLOSEDATE") as "YEAR_DATA", SUM(AMOUNT) as "TOTAL AMOUNT", avg(AMOUNT) as "AVERAGE", median(AMOUNT) as "MEDIAN", count(*) as "NUMBER_OF_GIFTS",
sum(case when RECORDTYPEID = '012G0000001BL5mIAG' then 1 else 0 end) as "classy_cnt",
sum(case when RECORDTYPEID = '012G00000018PhAIAU' then 1 else 0 end) as "major_cnt",
sum(case when RECORDTYPEID = '012G00000018Ph8IAE' then 1 else 0 end) as "general_cnt",
sum(case when RECORDTYPEID = '0124A000000WipdQAC' then 1 else 0 end) as "one_cause_cnt",
sum(case when RECORDTYPEID = '0124A000001QhLmQAK' then 1 else 0 end) as "mobile_cnt"
from OPPORT
where YEAR_DATA >= '2017-01-01'
GROUP BY YEAR_DATA
ORDER BY YEAR_DATA