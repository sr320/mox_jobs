#!/bin/bash
## Job Name
#SBATCH --job-name=bismark
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-100:00:00
## Memory per node
#SBATCH --mem=500G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0504





source /gscratch/srlab/programs/scripts/paths.sh

find /gscratch/srlab/sr320/data/0504/EPI-*R1* \
| xargs basename -s _L005_R1_001.fastq.gz | xargs -I{} /gscratch/srlab/programs/Bismark-0.19.0/bismark \
--path_to_bowtie /gscratch/srlab/programs/bowtie2-2.1.0 \
--score_min L,0,-1.2 \
-p 28 \
-multicore 8 \
/gscratch/srlab/sr320/data/hi-c \
-1 /gscratch/srlab/sr320/data/0504/{}_L005_R1_001.fastq.gz \
-2 /gscratch/srlab/sr320/data/0504/{}_L005_R2_001.fastq.gz
