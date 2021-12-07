#!/usr/bin/env bash

#curl -X PUT -H "Content-Type: application/vnd.schemaregistry.v1+json" \
#    --data '{"compatibility": "NONE"}' \
#    http://localhost:8081/config/dbo-value

     curl -i -X POST -H "Accept:application/json" \
                 -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
                 -d '{
                   "name": "mysql-source-movies-raw",
                   "config": {
                         "connector.class": "io.debezium.connector.mysql.MySqlConnector",
                         "database.hostname": "pub-mysql.cmhtgh6yg7h9.eu-west-1.rds.amazonaws.com",
                         "database.port": "3306",
                         "database.user": "foo",
                         "database.password": "foobarbaz",
                         "database.server.id": "45",
                         "database.server.name": "mysql",
                         "table.whitelist": "movielens.*",
                         "database.history.kafka.bootstrap.servers": "broker:9092",
                         "database.history.kafka.topic": "dbhistory.mysql-raw" ,
                         "include.schema.changes": "true",
                         "transforms": "InsertField,unwrap",
                         "transforms.InsertField.type": "org.apache.kafka.connect.transforms.InsertField$Value",
                         "transforms.InsertField.static.field": "MessageSource",
                         "transforms.InsertField.static.value": "Kafka Connect framework",
                         "transforms.ExtractField.type":"org.apache.kafka.connect.transforms.ExtractField$Key",
                         "transforms.ExtractField.field":"id",
                         "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
                         "transforms.unwrap.add.fields": "op",
                         "transforms.unwrap.delete.handling.mode": "rewrite",
                         "transforms.unwrap.drop.tombstones": "false",
                         "key.converter": "io.confluent.connect.avro.AvroConverter",
                         "key.converter.schema.registry.url": "http://schema-registry:8081",
                         "key.converter.enhanced.avro.schema.support": "true",
                         "value.converter": "io.confluent.connect.avro.AvroConverter",
                         "value.converter.schema.registry.url": "http://schema-registry:8081",
                         "value.converter.enhanced.avro.schema.support": "true",
                         "signal.data.collection": "testDB.dbo.debezium_signal"     }
                 }'

sleep 5

# "transforms": "ExtractField",
# "transforms.ExtractField.type":"org.apache.kafka.connect.transforms.ExtractField$Key",
# "transforms.ExtractField.field":"after"
