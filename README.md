![Status - In progress](https://img.shields.io/badge/Status-InProgress-2ea44f)

# sr-rnaseq
Example data processing of short reads rna-seq

# ✨ Overview

The purpose of this workflow is to process short read bulk RNA-seq data in a high-throughput manner. The workflow consists of standard QC/QA pre-processing steps, after which cleaned RNA-seq reads are mapped onto a reference genome. Then counts for each genes are calculated.

# 🖥️  Infrastructure

To implement this workflow, we consider each sample (R1 and R2) as its own htcondor job. For example, with 10 samples (20 fastqc reads), we would simultaneously submit 10 jobs or 20 jobs, depending on the step in the workflow.
If a job takes 3 minutes to run, the 20 jobs can run in ~3 minutes, rather than 20*3= 60 minutes = 1 hour. 
This substantially reduces the compute time needed to obtain results.

## On CHTC
1. Quality Checking
2. Trimming
3. Mapping reads to reference genome
4. Count reads mapping to each feature

## On your laptop
1. Merge output tables
2. Perform differential gene expression analysis

# ⚠️ Special consideration

Specific to this RNA-seq analysis, if we eventually want to compared 2 groups (control vs treated, time 1 vs time 2, etc), we must have at least 3 replicates for each group.
If you have fewer than 3 replicates, you can still process the data up to the point to obtain a gene count table, however, the data will not be appropriate to use with statistical analyses.

# 🔁 Recreate this workflow

**Download a copy of the code**

```
ssh username@ap2002.chtc.wisc.edu
pwd
# should say /home/username
git clone https://github.com/UW-Madison-Bacteriology-Bioinformatics/sr-rnaseq.git
cd sr-rnaseq
chmod +x scripts/*.sh
```

**Create the folder structure**
A helper scrip is present to help you organize your input and output files

>![WARNING]
> You must already have a CHTC `/staging` folder.

```
bash scripts/pre-processing.sh
```

**Organize your files**

Move your fastq reads (2 for each samples, labelled sample_R{1 or 2}_001.fastq.gz
Also move your reference genome assembly (named reference_assembly.fasta) here.

**Prepare your list of reads, and your list of samples**

Create a list of reads:

```
cd /staging/$LOGNAME/$PROJECTNAME/input
# this mean list the files, then replace everything before the space with nothin, and then replace the _R1/2_fastq.gz part of the name with nothing.
ls -lht | grep '.fastq.gz' | sed 's|.* ||g' > reads.txt
mv reads.txt ~/sr-rnaseq/scripts/.
cd ~/sr-rnaseq/scripts
```

**Modify the staging folder in the submit fastq.sh file and run the script.**

```
condor_submit fastqc.sub
```

**Create the sample list**

```
grep 'R1_001.fastq.gz' reads.txt | sed 's|_R1_001.fastq.gz||g' > samples.txt
```

**Submit your fastp job**
```
condor_submit fastp.sub
```