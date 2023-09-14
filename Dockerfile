FROM python:3.11

WORKDIR project

RUN pip install duckdb==0.8.1
RUN pip install git+https://github.com/duckdb/dbt-duckdb

RUN apt-get update -y && \
    apt-get install -y npm && \
    npm install -g @boilingdata/boilingdata-bdcli

COPY . .

RUN cp ./boilingdata.py /usr/local/lib/python3.11/site-packages/dbt/adapters/duckdb/plugins/boilingdata.py