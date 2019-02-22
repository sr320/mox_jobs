#!/bin/bash
## Job Name
#SBATCH --job-name=bowtie
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=100:00:00
## Memory per node
#SBATCH --mem=500G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0125

source /gscratch/srlab/programs/scripts/paths.sh





bowtie2 -x \
/gscratch/srlab/sr320/data/cw/chinook_genome \
-1 /gscratch/srlab/sr320/data/cw/14FW0023.1.fq.gz \
-2 /gscratch/srlab/sr320/data/cw/14FW0023.2.fq.gz \
-X 2000 --no-mixed --no-discordant \
-S /gscratch/srlab/sr320/analyses/0125/14FW0023_bowtie2.sam \
-q \
-p 24 \
-k 2 \
--very-fast

