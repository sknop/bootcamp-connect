#!/usr/bin/env bash

# _kafka-connect-configs
# _kafka-connect-offsets
# _kafka-connect-status


## offsets
## ["debezium-sqlserver-source",{"server":"server1"}]-{"commit_lsn":"00000025:00000c18:002e","snapshot":true,"snapshot_completed":true}

## status
## status-connector-debezium-sqlserver-source-{"state":"RUNNING","trace":null,"worker_id":"kafka-connect:18083","generation":9}
# status-connector-debezium-sqlserver-source-{"state":"UNASSIGNED","trace":null,"worker_id":"kafka-connect:18083","generation":10}
# status-connector-debezium-sqlserver-source-{"state":"RUNNING","trace":null,"worker_id":"kafka-connect:18083","generation":12}


## config

#connector-debezium-sqlserver-source-{"properties":{"connector.class":"io.debezium.connector.sqlserver.SqlServerConnector","tasks.max":"1","database.hostname":"sqlserver","database.port":"1433","database.user":"sa","database.password":"Password!","database.server.name":"server1","database.dbname":"testDB","database.history.kafka.bootstrap.servers":"broker:9092","database.history.kafka.topic":"schema-changes.inventory","table.include.list":"(.*)\\.(.*)","transforms":"InsertField,unwrap","transforms.InsertField.type":"org.apache.kafka.connect.transforms.InsertField$Value","transforms.InsertField.static.field":"MessageSource","transforms.InsertField.static.value":"Kafka Connect framework","transforms.ExtractField.type":"org.apache.kafka.connect.transforms.ExtractField$Key","transforms.ExtractField.field":"id","transforms.unwrap.type":"io.debezium.transforms.ExtractNewRecordState","transforms.unwrap.add.fields":"op","transforms.unwrap.delete.handling.mode":"rewrite","transforms.unwrap.drop.tombstones":"false","key.converter":"io.confluent.connect.avro.AvroConverter","key.converter.schema.registry.url":"http://schema-registry:8081","key.converter.enhanced.avro.schema.support":"true","value.converter":"io.confluent.connect.avro.AvroConverter","value.converter.schema.registry.url":"http://schema-registry:8081","value.converter.enhanced.avro.schema.support":"true","name":"debezium-sqlserver-source"}}
#task-debezium-sqlserver-source-0-{"properties":{"connector.class":"io.debezium.connector.sqlserver.SqlServerConnector","transforms.unwrap.delete.handling.mode":"rewrite","tasks.max":"1","database.history.kafka.topic":"schema-changes.inventory","transforms.InsertField.static.value":"Kafka Connect framework","transforms":"InsertField,unwrap","value.converter.enhanced.avro.schema.support":"true","transforms.InsertField.type":"org.apache.kafka.connect.transforms.InsertField$Value","transforms.unwrap.drop.tombstones":"false","transforms.unwrap.type":"io.debezium.transforms.ExtractNewRecordState","value.converter":"io.confluent.connect.avro.AvroConverter","key.converter":"io.confluent.connect.avro.AvroConverter","database.user":"sa","database.dbname":"testDB","transforms.ExtractField.field":"id","database.history.kafka.bootstrap.servers":"broker:9092","database.server.name":"server1","key.converter.enhanced.avro.schema.support":"true","transforms.InsertField.static.field":"MessageSource","database.port":"1433","value.converter.schema.registry.url":"http://schema-registry:8081","task.class":"io.debezium.connector.sqlserver.SqlServerConnectorTask","database.hostname":"sqlserver","database.password":"Password!","name":"debezium-sqlserver-source","transforms.unwrap.add.fields":"op","table.include.list":"(.*)\\.(.*)","key.converter.schema.registry.url":"http://schema-registry:8081","transforms.ExtractField.type":"org.apache.kafka.connect.transforms.ExtractField$Key"}}
#commit-debezium-sqlserver-source-{"tasks":1}
#session-key-{"key":"vWJWXdbOsGwYrlbeOBNyy6el6T8/oDYH/hOtJgabThU=","algorithm":"HmacSHA256","creation-timestamp":1629989809384}

docker exec broker kafka-configs --bootstrap-server broker:9092 --alter \
-entity-type topics --entity-name _kafka-connect-offsets \
                     --add-config  segment.ms=30000

docker exec kafka-connect kafka-console-consumer --bootstrap-server broker:9092 \
                                                --property print.key=true --property key.separator="-" \
                                                --topic _kafka-connect-offsets --from-beginning
