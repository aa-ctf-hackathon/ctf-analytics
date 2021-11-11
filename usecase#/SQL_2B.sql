select
type
,CASE WHEN PRIMARY_CONTACT__C IS NULL THEN 'Missing PRIMARY CONTACT' else 'PRIMARY CONTACT present' end as PRIMARY_CONTACT_ind
, count(*) as RECORD_COUNT
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT"
where type Like '%Organization'
group by 1
order by 1;
---------------------------------------------------------------------------------------------
select
type
,case when PHONE is null then 'Missing PHONE' ELSE 'PHONE present' end as PHONE_ID
,count(*) as RECORD_COUNT
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT"
where type Like '%Organization'
group by 1
order by 1;
---------------------------------------------------------------------------------------------
select
type
,CASE WHEN WEBSITE IS NULL THEN 'WEBSITE MISSING' ELSE 'WEBSITE PRESENT' END AS WEBSITE_IND
,count(*) as RECORD_COUNT
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT"
where type Like '%Organization'
group by 1
order by 1;
---------------------------------------------------------------------------------------------
select
type
,
CASE WHEN BILLINGSTREET IS NULL or 
BILLINGCITY IS NULL OR BILLINGSTATE  IS NULL or BILLINGPOSTALCODE  IS NULL or BILLINGCOUNTRY  IS NULL 
THEN 'Missing Billing Address' ELSE 'Billing Address Present' END AS BILLING_ADDR_IND
,count(*) as RECORD_COUNT
FROM "PROD_CTF_RAW"."SRC_SF"."CTF_SF_ACCOUNT"
where type Like '%Organization'
group by 1
order by 1;