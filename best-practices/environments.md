# Use separate development and production environments
Use different schemas in the database for production and development. The best practices suggest creating a single producion schema (e.g. 'dbt') alongside 1 development schema per developer. The convention for these schema names is 'dbt_<developer_name>'

## Setup target schema
Go to your profiles.yml which can be found by running
```bash
dbt debug --config-dir

# open profiles.yml inside that directory
```

Edit the target schema for the correct project/target.

## Using the new schema
No further actions needed; dbt wil automatically create the schema on first run.