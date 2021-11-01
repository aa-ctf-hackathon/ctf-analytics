--Global read role setup
use role USERADMIN;
create role prod_db_gbl_r_rl;
--grant read access to raw zone
use role SECURITYADMIN;
grant usage on database prod_ctf_raw to role prod_db_gbl_r_rl;
grant usage on all schemas in database prod_ctf_raw to role prod_db_gbl_r_rl;
grant select on all tables in database prod_ctf_raw to role prod_db_gbl_r_rl;
grant select on future tables in database prod_ctf_raw to role prod_db_gbl_r_rl;
grant usage on future schemas in database prod_ctf_raw to role prod_db_gbl_r_rl;
--grant read access to cleanse zone
grant usage on database prod_ctf_clean to role prod_db_gbl_r_rl;
grant usage on all schemas in database prod_ctf_clean to role prod_db_gbl_r_rl;
grant select on all tables in database prod_ctf_clean to role prod_db_gbl_r_rl;
grant select on future tables in database prod_ctf_clean to role prod_db_gbl_r_rl;
grant usage on future schemas in database prod_ctf_clean to role prod_db_gbl_r_rl;
--grant read access to use zone
grant usage on database prod_ctf_use to role prod_db_gbl_r_rl;
grant usage on all schemas in database prod_ctf_use to role prod_db_gbl_r_rl;
grant select on all tables in database prod_ctf_use to role prod_db_gbl_r_rl;
grant select on future tables in database prod_ctf_use to role prod_db_gbl_r_rl;
grant usage on future schemas in database prod_ctf_use to role prod_db_gbl_r_rl;
--grant read access to old stitch db
grant usage on database pc_stitch_db to role prod_db_gbl_r_rl;
grant usage on all schemas in database pc_stitch_db to role prod_db_gbl_r_rl;
grant select on all tables in database pc_stitch_db to role prod_db_gbl_r_rl;
grant select on future tables in database pc_stitch_db to role prod_db_gbl_r_rl;
grant usage on future schemas in database pc_stitch_db to role prod_db_gbl_r_rl;
--grant read access to old ctf_raw db
grant usage on database ctf_raw to role prod_db_gbl_r_rl;
grant usage on all schemas in database ctf_raw to role prod_db_gbl_r_rl;
grant select on all tables in database ctf_raw to role prod_db_gbl_r_rl;
grant select on future tables in database ctf_raw to role prod_db_gbl_r_rl;
grant usage on future schemas in database ctf_raw to role prod_db_gbl_r_rl;

--securityadmin role will keep custodian and future grants will be using securityadmin role
--grant role prod_db_gbl_r_rl to role SECURITYADMIN;



--Raw database create/read/write role setup
use role USERADMIN;
create role prod_db_raw_crwx_rl;
use role SECURITYADMIN;
grant usage, create schema on database prod_ctf_raw to role prod_db_raw_crwx_rl;
grant usage on all schemas in database prod_ctf_raw to role prod_db_raw_crwx_rl;
grant usage on future schemas in database prod_ctf_raw to role prod_db_raw_crwx_rl;
grant all on all schemas in database prod_ctf_raw to role prod_db_raw_crwx_rl;
grant all on future schemas in database prod_ctf_raw to role prod_db_raw_crwx_rl;
--Grant access on ingestion WH to ingestion role
GRANT USAGE ON WAREHOUSE PROD_INGEST_WH TO ROLE prod_db_raw_crwx_rl;
--securityadmin role will keep custodian and future grants will be using securityadmin role
--grant role prod_db_raw_crwx_rl to role SECURITYADMIN;



--Raw database spreadsheet schema create/read/write role setup
use role USERADMIN;
create role prod_db_raw_sch_sprdsht_rwx_rl;
use role SECURITYADMIN;
grant usage on database prod_ctf_raw to role prod_db_raw_sch_sprdsht_rwx_rl;
grant all on schema prod_ctf_raw.src_spreadsheet to role prod_db_raw_sch_sprdsht_rwx_rl;
--Grant access on ingestion WH to ingestion role
GRANT USAGE ON WAREHOUSE PROD_INGEST_WH TO ROLE prod_db_raw_sch_sprdsht_rwx_rl;





--Clean/Use database read/write role setup
use role USERADMIN;
create role prod_db_trf_rwx_rl;
use role SECURITYADMIN;
--Grant access to clean database
grant usage on database prod_ctf_clean to role prod_db_trf_rwx_rl;
grant usage on all schemas in database prod_ctf_clean to role prod_db_trf_rwx_rl;
grant usage on future schemas in database prod_ctf_clean to role prod_db_trf_rwx_rl;
grant all on all schemas in database prod_ctf_clean to role prod_db_trf_rwx_rl;
grant all on future schemas in database prod_ctf_clean to role prod_db_trf_rwx_rl;
--Grant access to use database
grant usage on database prod_ctf_use to role prod_db_trf_rwx_rl;
grant usage on all schemas in database prod_ctf_use to role prod_db_trf_rwx_rl;
grant usage on future schemas in database prod_ctf_use to role prod_db_trf_rwx_rl;
grant all on all schemas in database prod_ctf_use to role prod_db_trf_rwx_rl;
grant all on future schemas in database prod_ctf_use to role prod_db_trf_rwx_rl;
--Grant access on ingestion WH to ingestion role
GRANT USAGE ON WAREHOUSE PROD_TRF_WH TO ROLE prod_db_trf_rwx_rl;
--securityadmin role will keep custodian and future grants will be using securityadmin role
--grant role prod_db_raw_crwx_rl to role SECURITYADMIN;



--Sandbox database create/read/write role setup
use role USERADMIN;
create role prod_db_sndbx_rwx_rl;
use role SECURITYADMIN;
grant usage on database prod_ctf_sandbox to role prod_db_sndbx_rwx_rl;
grant usage on all schemas in database prod_ctf_sandbox to role prod_db_sndbx_rwx_rl;
grant usage on future schemas in database prod_ctf_sandbox to role prod_db_sndbx_rwx_rl;
grant all on all schemas in database prod_ctf_sandbox to role prod_db_sndbx_rwx_rl;
grant all on future schemas in database prod_ctf_sandbox to role prod_db_sndbx_rwx_rl;
--Grant access on ingestion WH to ingestion role
GRANT USAGE ON WAREHOUSE PROD_ADHOC_WH TO ROLE prod_db_sndbx_rwx_rl;
--securityadmin role will keep custodian and future grants will be using securityadmin role
--grant role prod_db_raw_crwx_rl to role SECURITYADMIN;



--Functional Data Engineering Role setup
use role USERADMIN;
create role prod_func_de_rl;
use role SECURITYADMIN;
grant role prod_db_gbl_r_rl to role prod_func_de_rl;
grant role prod_db_trf_rwx_rl to role prod_func_de_rl;
--Grant access on ingestion WH to Data Engineer Role



--Functional Ingestion Role setup
use role USERADMIN;
create role prod_func_ingest_rl;
use role SECURITYADMIN;
grant role prod_db_raw_crwx_rl to role prod_func_ingest_rl;



--Functional adhoc Ingestion Role setup
use role USERADMIN;
create role prod_func_adhoc_ingest_rl;
use role SECURITYADMIN;
grant role prod_db_raw_sch_sprdsht_rwx_rl to role prod_func_adhoc_ingest_rl;
--Grant read access to legacy databases. Remove this as part of cleanup
grant role developer_etl to role prod_func_adhoc_ingest_rl;




--Data Engineer Role setup
use role ACCOUNTADMIN;
grant role developer_etl to role useradmin with grant option;

create role prod_usr_de_rl;
use role SECURITYADMIN;
grant role prod_db_gbl_r_rl to role prod_usr_de_rl;
grant role prod_db_sndbx_rwx_rl to role prod_usr_de_rl;
--Grant access on ingestion WH to Data Engineer Role
GRANT USAGE ON WAREHOUSE PROD_ADHOC_WH TO ROLE prod_usr_de_rl;
--grant transformation role to data engineers on a temp basis. Will be revoked after charity day
grant role prod_db_trf_rwx_rl to role prod_usr_de_rl;
--Grant read access to legacy databases. Remove this as part of cleanup
grant role developer_etl to role prod_usr_de_rl;


--Business Analyst Role setup
use role USERADMIN;
create role prod_usr_ba_rl;
use role SECURITYADMIN;
grant role prod_db_gbl_r_rl to role prod_usr_ba_rl;
grant role prod_db_sndbx_rwx_rl to role prod_usr_ba_rl;
--Grant access on ingestion WH to Data Engineer Role
GRANT USAGE ON WAREHOUSE PROD_ADHOC_WH TO ROLE prod_usr_ba_rl;
--grant role prod_usr_ba_rl to role SECURITYADMIN;


--Grant all parent roles to useradmin
grant role prod_usr_de_rl,prod_usr_ba_rl,prod_func_de_rl,prod_func_ingest_rl,prod_func_adhoc_ingest_rl to role USERADMIN;