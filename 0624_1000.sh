#!/bin/bash
## Job Name
#SBATCH --job-name=trinity
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0624





source /gscratch/srlab/programs/scripts/paths.sh


/gscratch/srlab/programs/trinity/Trinity \
--seqType fq \
--max_memory 500G \
--left /gscratch/srlab/sr320/data/geoduck-RNA-seq/NR012_S1_L001_R1_001.fastq,\
/gscratch/srlab/sr320/data/geoduck-RNA-seq/NR012_S1_L002_R1_001.fastq \
--right /gscratch/srlab/sr320/data/geoduck-RNA-seq/NR012_S1_L001_R2_001.fastq,\
/gscratch/srlab/sr320/data/geoduck-RNA-seq/NR012_S1_L002_R2_001.fastq \
--trimmomatic \
--CPU 28



