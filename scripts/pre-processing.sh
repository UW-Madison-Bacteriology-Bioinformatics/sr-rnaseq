#!/bin/bash
PROJECT="MyProject"
LOCATION="/n/netid"

mkdir -p /staging/$LOCATION/$PROJECT/
mkdir -p /staging/$LOCATION/$PROJECT/input
mkdir -p /staging/$LOCATION/$PROJECT/output
mkdir -p /staging/$LOCATION/$PROJECT/output/fastqc
mkdir -p /staging/$LOCATION/$PROJECT/output/fastp
mkdir -p /staging/$LOCATION/$PROJECT/output/bowtie2
mkdir -p /staging/$LOCATION/$PROJECT/output/featureCount

tree /staging/$LOCATION/$PROJECT/
