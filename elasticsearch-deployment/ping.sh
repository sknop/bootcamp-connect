#!/usr/bin/env bash

ansible -i hosts  all -m ping -e 'ansible_ssh_private_key_file="~/.ssh/purbon-ireland-sa.pem"'
