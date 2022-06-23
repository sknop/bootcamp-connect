#!/usr/bin/env bash

set -xe

terraform plan -var-file="bootcamp.tfvars" -parallelism=20
