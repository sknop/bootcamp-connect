#!/usr/bin/env bash

CONNECTOR_NAME="debezium-sqlserver-source"
KAFKA_HOST="localhost:29092"

echo "sending a tombstone"
echo "[\"$CONNECTOR_NAME\",{\"server\":\"server2\"}]:" | kafkacat -b $KAFKA_HOST -t _kafka-connect-offsets -Z -K:

echo "reading the offsets topics"

# kafkacat -b localhost:29092 -o beginning -t _kafka-connect-offsets -K:

docker run -it --rm  --network "debezium-sqlserver-to-mysql_default" \
        edenhill/kafkacat:1.6.0 \
           -b broker:29092 \
           -C \
           -f '\nKey (%K bytes): %k\t\nValue (%S bytes): %s\n\Partition: %p\tOffset: %o\n--\n' \
           -t _kafka-connect-offsets
