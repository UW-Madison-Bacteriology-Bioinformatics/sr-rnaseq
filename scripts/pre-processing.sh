#!/bin/bash
PROJECT="MyProject"

# This becomes $staging variable in submit files:
# mkdir -p /staging/$LOGNAME/$PROJECT/

mkdir -p /staging/$LOGNAME/$PROJECT/
mkdir -p /staging/$LOGNAME/$PROJECT/input
mkdir -p /staging/$LOGNAME/$PROJECT/output
mkdir -p /staging/$LOGNAME/$PROJECT/output/fastqc
mkdir -p /staging/$LOGNAME/$PROJECT/output/fastp
mkdir -p /staging/$LOGNAME/$PROJECT/output/bowtie2
mkdir -p /staging/$LOGNAME/$PROJECT/output/featureCount

tree /staging/$LOGNAME/$PROJECT/