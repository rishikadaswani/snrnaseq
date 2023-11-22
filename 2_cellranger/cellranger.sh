#!/bin/bash
RAT=$1
DATA="/arc/project/st-singha53-1/rishikad/snrnaseq/fastq"
REF="/arc/project/st-singha53-1/rishikad/snrnaseq/2_cellranger/ref"
FASTQ_ZIPS=${DATA}/${RAT}/*.fastq


for fastq in ${FASTQ_ZIPS}
do 
    #gunzip ${fastq}
    #fastqs="${fastq}%.gz"
    cellranger count --id=${RAT} \
        --fastqs=${fastq} \
        --sample=${RAT} \
        --transcriptome=${REF}/Rattus_norvegicus_mRatBN7_2 \
        --chemistry "ARC-v1"

echo ${fastq}
done






