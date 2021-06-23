# discursus.io Data Warehouse
To locally run the dbt package:
1. Create a `xyz.env` file that includes values for the following variables:
    - SNOWFLAKE_ACCOUNT
    - SNOWFLAKE_USER
    - SNOWFLAKE_PASSWORD
    - SNOWFLAKE_ROLE
    - SNOWFLAKE_DW_WAREHOUSE
    - SNOWFLAKE_DW_DATABASE
    - SNOWFLAKE_DW_SCHEMA
2. Source those environment variables: `source xyz.env`
3. Make sure you have the correct dbt version installed
4. Run: `dbt deps --profiles-dir ./` then `dbt seed --profiles-dir ./`
5. Run the transformation: `dbt run`