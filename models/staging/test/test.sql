select
    *
FROM
    boilingdata(
        'SELECT * FROM parquet_scan(''s3://boilingdata-demo/test.parquet'')'
    )