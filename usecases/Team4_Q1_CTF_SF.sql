select recordtypeid , count(*)
 from  PROD_CTF_RAW.SRC_SF.CTF_SF_ACCOUNT
  group by 1  ;
  ---------------------------------------------------------
  select * 
  from PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY
 where CLOSEDATE is null ;
 
  select max( CLOSEDATE) , min(CLOSEDATE) from PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY ;
   select distinct year(CLOSEDATE) , count(*)  from PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY group by 1 order by 1 ; 
   --------------------------------------------------------
   
   select  payment_type__c ,sum(amount) , count(*) from  PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY 
   where payment_type__c  is NOT NULL
   and amount is not null
   and year(CLOSEDATE) >= 2016
   group by 1
   
select  payment_type__c  , year(CLOSEDATE) , sum(amount) , avg(amount) , count(*) , avg(id)
from PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY
 where -- payment_type__c  is  not NULL
  year(CLOSEDATE)  is not null
 and amount is not null
  and  year(CLOSEDATE) >= 2016
  group by 1,2 ;
  ----------- view creation ------
  
   create or replace view clean_base_SF_OPPORTUNITY as 
     select  payment_type__c as payment_type__c  , year(CLOSEDATE) as close_year , sum(amount) as sum_amount, avg(amount) as avg_amount , count(*)  as total
from PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY
 where -- payment_type__c  is  not NULL
  year(CLOSEDATE)  is not null
 and amount is not null
  and  year(CLOSEDATE) >= 2016
    group by 1,2 ;
    
   describe  table PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY
   ------------------------------------------
   
   
    create or replace view clean_base_SF_OPPORTUNITY as 
    
     select PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY.id as primary_key_opportunity , 
     payment_type__c  ,
     year(CLOSEDATE) as close_year ,
     amount as amount,
     PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY.name as name,
     PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY.type as type,
     case 
     when(PROD_CTF_RAW.SRC_SF.CTF_SF_ACCOUNT.RECORDTYPEID ='012G0000001BKhsIAG') 
     then 'household' else 'institution' end as Recordtype
           
from PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY ,    
     PROD_CTF_RAW.SRC_SF.CTF_SF_ACCOUNT

 where -- payment_type__c  is  not NULL
 PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY.ACCOUNTID =  PROD_CTF_RAW.SRC_SF.CTF_SF_ACCOUNT.ID
 
 and  year(CLOSEDATE)  is not null
 and amount is not null
  and  year(CLOSEDATE) >= 2016
  ------------------------------------------------------------
  
  select  * from  PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY 
  where  PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY.id in 
  
  ( select    distinct OPPORTUNITYID
   from   PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITYCONTACTROLE )
   
    select distinct id from 
  PROD_CTF_RAW.SRC_SF.CTF_SF_OPPORTUNITY 
  
  