SELECT t1.id,
       t1.donor_frequency_classification__c,
       t2.donation_year,
       t2.donation_month,
       t2.times_donation_made,
       t2.donation_per_account
FROM   "PROD_CTF_RAW"."SRC_SF"."ctf_sf_account" t1
       LEFT JOIN (SELECT accountid,
                         NAME,
                         donation_year,
                         Count(*)    AS Times_Donation_Made,
                         donation_month,
                         Sum(amount) AS Donation_per_account
                  FROM   (SELECT a.accountid,
                                 amount,
                                 b.NAME,
                                 b.type,
                                 Year(closedate)  AS Donation_Year,
                                 Month(closedate) AS Donation_Month
                          FROM   "PROD_CTF_RAW"."SRC_SF"."ctf_sf_account" b
                                 LEFT JOIN
                                 "PROD_CTF_RAW"."SRC_SF"."ctf_sf_opportunity"
                                 a
                                        ON a.accountid = b.id
                          WHERE  amount > 0
                                 AND b.special_handling_required__c = true)p
                  GROUP  BY accountid,
                            NAME,
                            donation_year,
                            donation_month) t2
              ON t1.id = t2.accountid
WHERE  t1.special_handling_required__c = true

SELECT donor_frequency_classification__c,
       Count(donor_frequency_classification__c) AS counts
FROM   "PROD_CTF_RAW"."SRC_SF"."ctf_sf_account"
WHERE  special_handling_required__c = true
GROUP  BY donor_frequency_classification__c 