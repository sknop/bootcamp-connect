#!/usr/bin/env bash

#curl -X PUT -H "Content-Type: application/vnd.schemaregistry.v1+json" \
#    --data '{"compatibility": "NONE"}' \
#    http://localhost:8081/config/dbo-value

curl -i -X POST -H "Accept:application/json" \
                 -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
                 -d '{
                   "name": "oracle-source-movies-raw",
                   "config": {
                       "connector.class": "io.confluent.connect.oracle.cdc.OracleCdcSourceConnector",
                       "name": "oracle-source-movies-raw",
                       "tasks.max":3,
                       "key.converter": "io.confluent.connect.avro.AvroConverter",
                       "key.converter.schema.registry.url": "http://schema-registry:8081",
                       "value.converter": "io.confluent.connect.avro.AvroConverter",
                       "value.converter.schema.registry.url": "http://schema-registry:8081",
                       "confluent.topic.bootstrap.servers":"broker:9092",
                       "oracle.server": "pub-oracle.cmhtgh6yg7h9.eu-west-1.rds.amazonaws.com",
                       "oracle.port": 1521,
                       "oracle.username": "DB_USER",
                       "oracle.password": "PASSWORD",
                       "oracle.sid": "MYORACLE",
                       "start.from":"snapshot",
                       "redo.log.topic.name": "myoracle.redo.topic",
                       "redo.log.consumer.bootstrap.servers":"broker:9092",
                       "table.inclusion.regex":"MYORACLE[.]MOVIELENS[.].*",
                       "table.topic.name.template": "${databaseName}.${schemaName}.${tableName}",
                       "connection.pool.max.size": 20,
                       "confluent.topic.replication.factor":1,
                       "topic.creation.groups": "redo",
                       "topic.creation.redo.include": "myoracle.redo.topic",
                       "topic.creation.redo.replication.factor": 1,
                       "topic.creation.redo.partitions": 1,
                       "topic.creation.redo.cleanup.policy": "delete",
                       "topic.creation.redo.retention.ms": 1209600000,
                       "topic.creation.default.replication.factor": 1,
                       "topic.creation.default.partitions": 5,
                       "topic.creation.default.cleanup.policy": "compact"
                    }
                 }'
sleep 5
