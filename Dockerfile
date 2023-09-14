FROM python:3.11

WORKDIR project

RUN pip install duckdb==0.8.1
RUN pip install git+https://github.com/duckdb/dbt-duckdb

RUN apt-get update -y && apt-get install -y npm
RUN npm install -g @boilingdata/boilingdata-bdcli@^v1.0.13

COPY . .

RUN cp ./boilingdata.py /usr/local/lib/python3.11/site-packages/dbt/adapters/duckdb/plugins/boilingdata.py