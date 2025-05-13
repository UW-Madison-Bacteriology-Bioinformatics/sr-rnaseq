#!/bin/bash

READ="$1"
STAGING="$2"

ls -lht

fastqc -h
# Run fastqc on the reads and write it to the staging folder.

fastqc -o ${STAGING}/output/fastqc ${STAGING}/input/${READ}
