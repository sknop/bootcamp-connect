#!/usr/bin/env bash

set -xe

time terraform apply -var-file="bootcamp.tfvars" -parallelism=20
