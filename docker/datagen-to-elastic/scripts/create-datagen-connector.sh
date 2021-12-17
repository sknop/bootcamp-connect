#!/usr/bin/env bash

#curl -X PUT -H "Content-Type: application/vnd.schemaregistry.v1+json" \
#    --data '{"compatibility": "NONE"}' \
#    http://localhost:8081/config/dbo-value

curl -i -X POST -H "Accept:application/json" \
                 -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
                 -d '{
                   "name": "datagen-users",
                   "config": {
                      "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector",
                      "kafka.topic": "users",
                      "schema.filename": "/data/users_schema.avro",
                      "schema.keyfield": "userid",
                      "key.converter": "org.apache.kafka.connect.storage.StringConverter",
                      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
                      "key.converter.schema.registry.url": "http://schema-registry:8081",
                      "value.converter.schema.registry.url": "http://schema-registry:8081",
                      "value.converter.schemas.enable": "false",
                      "tasks.max": "1"
                    }
                 }'

sleep 5

curl -i -X POST -H "Accept:application/json" \
                 -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
                 -d '{
                   "name": "datagen-txs",
                   "config": {
                     "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector",
                     "kafka.topic": "transactions",
                     "schema.filename": "/data/transactions.avro",
                     "schema.keyfield": "transaction_id",
                     "key.converter": "org.apache.kafka.connect.storage.StringConverter",
                     "value.converter": "org.apache.kafka.connect.json.JsonConverter",
                     "value.converter.schemas.enable": "false",
                     "max.interval": 1000,
                     "tasks.max": "1"
                    }
                 }'

# "transforms": "ExtractField",
# "transforms.ExtractField.type":"org.apache.kafka.connect.transforms.ExtractField$Key",
# "transforms.ExtractField.field":"after"
