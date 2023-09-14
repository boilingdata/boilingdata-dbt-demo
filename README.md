# dbt DuckDB BoilingData demo

This project demonstrates how to use Boiling cloud for [`dbt-duckdb`](https://github.com/duckdb/dbt-duckdb) using Boiling command line tool [`bdcli`](https://github.com/boilingdata/boilingdata-bdcli) to configure a temporary access token for BoilingData DBT Plugin.

It is based on [`jwills/s3-demo`](https://github.com/jwills/s3-demo).

> The [`boilingdata.py`](boilingdata.py) dbt-duckdb plugin resides in this repository until we know how to integrate it with dbt-duckdb.

## How to run

1. Upsert your BoilingData credentials with `bdcli`

`bdcli account token --lifetime 2h --dbtconf profiles.yml`

2. Build and start up docker compose:

`docker-compose build && docker-compose up`

3. Attach to container:

`docker exec -it boilingdata-dbt-demo-dbt-duckdb-1 /bin/bash`

4. Run dbt

`dbt run`
