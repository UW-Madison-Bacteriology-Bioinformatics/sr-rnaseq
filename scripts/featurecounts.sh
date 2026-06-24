#!/bin/bash

SAMPLE="$1"
REF="$2"
CPU="$3"

ls -lht


featureCounts -T ${CPU} -t gene \
    -g Name \
    -a ${REF}.gtf \
    -o ${SAMPLE}_vs_${REF}_counts.txt \
    ${SAMPLE}_vs_${REF}.fasta.sorted.bam

ls -lht
