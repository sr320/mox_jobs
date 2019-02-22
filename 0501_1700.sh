#!/bin/bash
## Job Name
#SBATCH --job-name=genome_prep
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0501





source /gscratch/srlab/programs/scripts/paths.sh


/gscratch/srlab/programs/Bismark-0.19.0/bismark_genome_preparation \
--verbose \
/gscratch/srlab/sr320/data/Cvirg-genome
