#!/usr/bin/env bash

MODULES_DIR=./modules/kops

terraform-docs md $MODULES_DIR | cat ./hack/readme-header.txt -