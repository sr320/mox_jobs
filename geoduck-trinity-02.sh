#!/bin/bash
## Job Name
#SBATCH --job-name=Geoduck-trinity-01
## Allocation Definition 
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1   
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=90:30:00
## Memory per node
#SBATCH --mem=500G
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/trinity-geo-01

 
source /gscratch/srlab/programs/scripts/paths.sh

Trinity \
--seqType fq \
--left /gscratch/srlab/sr320/data/NR021_S8_L001_R1_001.fastq, /gscratch/srlab/sr320/data/NR021_S8_L002_R1_001.fastq \
--right /gscratch/srlab/sr320/data/NR021_S8_L001_R2_001.fastq, /gscratch/srlab/sr320/data/NR021_S8_L002_R2_001.fastq \
--CPU 50 --max_memory 500G
