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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0502





source /gscratch/srlab/programs/scripts/paths.sh

find /gscratch/srlab/sr320/data/0425/zr2096_*R1* \
| xargs basename -s _s1_R1_val_1.fq.gz | xargs -I{} /gscratch/srlab/programs/Bismark-0.19.0/bismark \
--path_to_bowtie /gscratch/srlab/programs/bowtie2-2.1.0 \
--score_min L,0,-1.2 \
-p 28 \
-multicore 4 \
--non_directional \
/gscratch/srlab/sr320/data/Cvirg-genome/ \
-1 /gscratch/srlab/sr320/data/0425/{}_s1_R1_val_1.fq.gz \
-2 /gscratch/srlab/sr320/data/0425/{}_s1_R2_val_2.fq.gz

