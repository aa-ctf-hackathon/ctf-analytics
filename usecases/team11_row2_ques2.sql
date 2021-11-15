//What is the distribution of new vs. existing households and organizations over a 5-year period?

SELECT  "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".TYPE as TYPE,  Extract( YEAR from "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".CLOSEDATE) as DonationYear, 
case when Extract( YEAR from "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".CLOSEDATE) = Extract( YEAR from NPE01__FIRSTDONATIONDATE__C)  
then 'New'
else 'Existing' 
End as DonorState,
Sum("PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".AMOUNT) as DonationsSum,
Count(*) as Count
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT"
INNER JOIN "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY" 
ON "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT".ID = "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".ACCOUNTID 
where "PROD_CTF_RAW"."SRC_SF"."CTF_SF_OPPORTUNITY".CLOSEDATE > ADD_MONTHS(current_date(), -48)
group by 1,2, 3
order by 2,1,3