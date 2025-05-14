#/bin/bash

SAMPLE="$1"
REF="$2"
CPU="$3"

ls -lht

# Building reference
bowtie2-build ${REF}_assembly.fasta ${REF}
ls -lht

# Map reads to the reference
bowtie2 -x ${REF} -1 ${SAMPLE}.R1.fastp.fastq.gz \
 -2 ${SAMPLE}.R2.fastp.fastq.gz \
-S ${SAMPLE}_vs_${REF}.sam \
--very-sensitive \
-p ${CPU}

ls -lht
