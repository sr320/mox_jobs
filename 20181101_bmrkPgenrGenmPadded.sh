#!/bin/bash
## Job Name
#SBATCH --job-name=BuildPgenrPaddedGenome
## Allocation Definition
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Resources
## Nodes
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=0-23:30:00
## Memory per node
#SBATCH --mem=100G
##turn on e-mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=strigg@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/


source /gscratch/srlab/programs/scripts/paths.sh


#build genome
/gscratch/srlab/programs/Bismark-0.19.0/bismark_genome_preparation \
--verbose \
/gscratch/srlab/strigg/data/Pgenr/padded

