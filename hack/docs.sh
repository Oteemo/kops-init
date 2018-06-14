#!/usr/bin/env bash

MODULES_DIR=./modules

modules=(init-aws)

for i in "${modules}"
do
    terraform-docs md $MODULES_DIR/$i | cat ./hack/$i-readme-header.txt - > $MODULES_DIR/$i/README.md
done
