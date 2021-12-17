#!/usr/bin/env bash

echo "Deleting Debezium SQL Server source connector"
curl -X DELETE \
     -H "Content-Type: application/json" \
     http://localhost:18083/connectors/debezium-sqlserver-source

curl -X DELETE \
     -H "Content-Type: application/json" \
     http://localhost:18083/connectors/mysql-source-movies-raw

sleep 2

echo "Deleting Elasticsearch sink connector"

curl -X DELETE http://localhost:18083/connectors/elasticsearch-sink

sleep 2

curl -X DELETE http://localhost:18083/connectors/datagen-users
curl -X DELETE http://localhost:18083/connectors/datagen-txs



echo "Available connectors"

curl -X GET \
     -H "Content-Type: application/json" \
     http://localhost:18083/connectors

# "transforms": "ExtractField",
# "transforms.ExtractField.type":"org.apache.kafka.connect.transforms.ExtractField$Key",
# "transforms.ExtractField.field":"after"
