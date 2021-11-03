# snowflake-starter
A starter template for [Snowflake Cloud Database](https://snowflake.com)

* Snowflake offers a 1 month free trial, and with this repo you should be able to get a sense for the basics of Snowflake within an hour.
* This template will create the necessary `ROLE`, `USER`, `DATABASE`, `SCHEMA` & `WAREHOUSE`(s) necessary to get up and running with Snowflake:

![snowflake.png](/assets/snowflake_rn.png)


# Usage

## Requirements

* [Snowflake instance](https://trial.snowflake.com/) (takes 5min to setup, no credit card for 1 month)
* [SnowSQL CLI](https://docs.snowflake.com/en/user-guide/snowsql.html) (optional)

## 1. Deploy

Copy [first_run.sql](/first_run.sql) into a worksheet as in the screenshot below and Run All. 

Or use the CLI
```bash
snowsql -c <your_connection_name> -f first_run.sql
```

![snowflake.png](/assets/worksheet.png)

### Infrastructure Details
The following is created, as described in [first_run.sql](/first_run.sql)
```
├── DATABASES
│   ├── RAW                     # This is the landing pad for everything extracted and loaded
│   └── ANALYTICS               # This database contains tables and views accessible to analysts and reporting
├── WAREHOUSES
│   ├── WAREHOUSE_INGEST        # Tools like Stitch will use this warehouse to perform loads of new data
│   ├── WAREHOUSE_TRANSFORM     # This is the warehouse that dataform/dbt will use to perform all data transformations
│   ├── WAREHOUSE_REPORT        # BI tools will connect to this warehouse to run analytical queries
├── ROLES
│   ├── ROLE_INGEST             # Give this role to your Extract/Load tools/scripts to load data
│   ├── ROLE_TRANSFORM          # Give this role to Dataform/dbt to transform data, and Data Engineers
│   ├── ROLE_REPORT             # Give this role to BI tools / Analysts to query analytics data
├── USERS
│   ├── USER_INGEST             # eg: Stitch User
│   ├── USER_TRANSFORM          # eg: Dataform User
│   ├── USER_REPORT             # eg: Looker user

```

## 2. Test

Use the [test_permissions.sql](/test_permissions.sql) SQL to:
1. create a base table in the `RAW` database, load a test row using the `ROLE_INGEST` role
1. create a new table and view in `ANALYTICS` using the `ROLE_TRANSFORM` role
1. query that view using the `ROLE_REPORT` role

**NB replace `<USERNAME>` in the file with your login name** 

Or use the CLI:
```bash
snowsql -c <your_connection_name> -f test_permissions.sql
```

## 3. JSON

JSON is very well handled in Snowflake, and worth a look. The [test_json.sql](/test_json.sql) file runs through the flattening of raw JSON into a table.

Or use the CLI:
```bash
snowsql -c <your_connection_name> -f test_json.sql
```

* Key to note is the `RECURSIVE=>TRUE` flag

## 4. User-Defined Functions

UDF allow you to create functions in SQL or JavaScript. The [test_udf.sql](/test_udf.sql) file runs through the creation and testing of a SQL and JavaScript UDF. See the [docs](https://docs.snowflake.com/en/sql-reference/udf-overview.html) for more

Or use the CLI:
```bash
snowsql -c <your_connection_name> -f test_udf.sql
```


## 5. Tear Down

The [first_run_drop.sql](/first_run_drop.sql) file will drop all objects created by [first_run.sql](/first_run.sql) 

Or use the CLI:
```bash
snowsql -c <your_connection_name> -f first_run_drop.sql
```