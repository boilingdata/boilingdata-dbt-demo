from typing import Any
from typing import Dict

from duckdb import DuckDBPyConnection

from . import BasePlugin


class Plugin(BasePlugin):
    def initialize(self, config: Dict[str, Any]):
        self._token = config.get("token")

    def configure_connection(self, conn: DuckDBPyConnection):
        # TODO: Hard-coded test/staging URL
        connect_stmt = f"CREATE OR REPLACE MACRO boilingdata(sql) AS TABLE SELECT * FROM parquet_scan('https://httpfs.api.test.boilingdata.com/httpfs?bdStsToken={self._token}&sql=' || sql);"
        conn.execute(connect_stmt)
