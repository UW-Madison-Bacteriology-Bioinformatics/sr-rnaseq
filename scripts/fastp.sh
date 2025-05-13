#!/bin/bash
SAMPLE="$1"
STAGING="$2"

fastp -i ${STAGING}/input/${SAMPLE}_R1_001.fastq.gz \
-I ${STAGING}/input/${SAMPLE}_R2_001.fastq.gz \
-o ${SAMPLE}.R1.fastp.fastq.gz \
-O ${SAMPLE}.R2.fastp.fastq.gz