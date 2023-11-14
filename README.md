# snrnaseq analysis

## Introduction 
This repository includes the single-nuclei RNA sequencing pipeline for identifying gene expression changes in the rat brain following fentanyl self-administration. The raw reads are processed using fastqc to obtain information about the quality of the reads. Then we follow the cellranger pipeline that performs read alignment, barcode processing, and gene expression quantification for each cell in the dataset. The count matrix is then used for the downstream analysis of clustering, differential expression analysis, and pseudotime trajectory analysis. The information below allows for reproduction of all steps of analysis in this repository. 

## local

- create docker image and run container
```
make build
make run
```

- run fastqc in running docker container
```
cd fastqc
make fastqc
```

- push image to DockerHub
* make sure you have a dockerhub account
```
make push
```

## Sockeye

### clone repo to hpc project folder
- log into sockeye and go to project user folder

```bash
module load git
git clone https://github.com/rishikadaswani/snrnaseq
```

### pull docker image

```bash
cd fastqc
make sockeye_pull
```