--Raw zone ingestion functional user setup
use role USERADMIN;
--DROP user PROD_CTF_INGEST_FUNC_USER;
CREATE USER IF NOT EXISTS PROD_CTF_INGEST_FUNC_USER
  PASSWORD='<Password>'
  COMMENT='Data ingestion functional user for PROD'
  DEFAULT_ROLE='prod_func_ingest_rl'
  DEFAULT_WAREHOUSE='PROD_INGEST_WH';

--Grant functional ingestion role to Raw zone ingestion functional user
grant role prod_func_ingest_rl to user PROD_CTF_INGEST_FUNC_USER;


use role USERADMIN;
--DROP user PROD_CTF_ADHOC_INGEST_FUNC_USER;
CREATE USER IF NOT EXISTS PROD_CTF_ADHOC_INGEST_FUNC_USER
  PASSWORD='<Password>'
  COMMENT='On-demand Data ingestion functional user for PROD'
  DEFAULT_ROLE='prod_func_adhoc_ingest_rl'
  DEFAULT_WAREHOUSE='PROD_INGEST_WH';
  
  --Grant functional ingestion role to Raw zone ingestion functional user
grant role prod_func_adhoc_ingest_rl to user PROD_CTF_ADHOC_INGEST_FUNC_USER;