#!/usr/bin/env bash

echo "Creating JDBC sink connector"

curl -i -X POST -H "Accept:application/json" \
    -H  "Content-Type:application/json" http://localhost:18083/connectors/ \
    -d '{
      "name": "jdbc-sink-connector",
      "config": {
        "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
        "tasks.max": "4",
        "topics.regex": "mysql\\.movielens\\.(.*)",
        "connection.url": "jdbc:mysql://pub-mysql.cmhtgh6yg7h9.eu-west-1.rds.amazonaws.com:3306/collect_foo?nullCatalogMeansCurrent=true",
        "connection.user": "foo",
        "connection.password": "foobarbaz",
        "insert.mode": "upsert",
        "auto.create": "true",
        "auto.evolve": "true",
        "pk.mode": "record_key",
        "delete.enabled": "true",
        "table.name.format": "${topic}",
        "transforms":"ReplaceField,dropPrefix",
        "transforms.ReplaceField.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
        "transforms.ReplaceField.blacklist": "__op,__deleted",
        "transforms.dropPrefix.type":"org.apache.kafka.connect.transforms.RegexRouter",
        "transforms.dropPrefix.regex":"mysql.movielens.(.*)",
        "transforms.dropPrefix.replacement":"$1",
        "key.converter": "io.confluent.connect.avro.AvroConverter",
        "key.converter.schema.registry.url": "http://schema-registry:8081",
        "key.converter.enhanced.avro.schema.support": "true",
        "value.converter": "io.confluent.connect.avro.AvroConverter",
        "value.converter.schema.registry.url": "http://schema-registry:8081",
        "value.converter.enhanced.avro.schema.support": "true"
      }
    }'
