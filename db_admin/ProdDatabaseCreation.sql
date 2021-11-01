use role sysadmin;
--Bronze Layer setup
create or replace database prod_ctf_raw;
create or replace schema prod_ctf_raw.src_classy;
create or replace schema prod_ctf_raw.src_sf;
create or replace schema prod_ctf_raw.src_spreadsheet;
create or replace schema prod_ctf_raw.src_sf_stg;

--Silver Layer setup
create or replace database prod_ctf_clean;



--Gold Layer setup
create or replace database prod_ctf_use;

--Sandbox Database setup
create or replace database prod_ctf_sandbox;
create or replace schema prod_ctf_sandbox.usr_sandbox;