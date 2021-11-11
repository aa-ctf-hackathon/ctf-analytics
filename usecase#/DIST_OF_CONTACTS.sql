SELECT
CASE 
WHEN 1945 < to_number(LEFT(birthdate, 4)) < 1966 THEN 'Baby boomer'
WHEN 1965 < to_number(LEFT(birthdate, 4)) < 1981 THEN 'Generation X'
WHEN 1980 < to_number(LEFT(birthdate, 4)) < 1996 THEN 'Millenials'
WHEN 1995 < to_number(LEFT(birthdate, 4)) < 2011 THEN 'Generation Z'
WHEN birthdate is null THEN 'Unknown Generation'
ELSE 'Generation A'
END AS generation,
MALATITUDE__C Latitude, 
MALATITUDE__C longitude,
CASE WHEN GENDER__C = 'Female' THEN 'Female'
WHEN GENDER__C = 'Male' THEN 'Male'
WHEN GENDER__C = 'Unknown' THEN 'Unknown'
WHEN GENDER__C = 'Prefer not to state/Other' THEN 'Unknown'
WHEN GENDER__C IS null THEN 'Unknown'
END AS Gender,
CASE 
WHEN cont.npe01__lifetime_giving_history_amount__c > 0 THEN True
ELSE False 
END AS donor_ind,
cotr."Name" as Country
FROM PROD_CTF_RAW.SRC_SF.CTF_SF_CONTACT cont
LEFT JOIN PROD_CTF_RAW.SRC_SPREADSHEET.COUNTRY cotr
WHERE
(cont.MAILINGCOUNTRY = cotr."Name" OR cont.MAILINGCOUNTRY = cotr."Code")
