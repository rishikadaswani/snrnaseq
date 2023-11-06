#!/bin/bash
#SBATCH --time=5:00:00
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=12 
#SBATCH --mem=64gb
#SBATCH --account=st-singha53-1
#SBATCH --job-name=fastqc
#SBATCH --mail-user=rishikad@student.ubc.ca
#SBATCH --output=%x-%j.log

  
#############################################################################

module load apptainer

DATA=/project/st-singha53-1/singha53/scrnaseq/data

cd $PBS_O_WORKDIR
apptainer run -B $DATA /project/st-singha53-1/rishikad/snrnaseq/snrnaseq.sif make sockeye_fastqc
