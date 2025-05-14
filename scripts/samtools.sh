#/bin/bash

SAMPLE="$1"
REF="$2"
CPU="$3"

ls -lht
samtools view -bS ${SAMPLE}_vs_${REF}.sam | samtools sort -o ${SAMPLE}_vs_${REF}.sorted.bam

ls -lht
