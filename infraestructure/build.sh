#!/usr/bin/env bash

set -xe

time terraform apply -var myip=$1 \
                     -var root_username=$2 -var root_password=$3 \
                     -var region="eu-west-1" -parallelism=20
