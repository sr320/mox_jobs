#!/bin/bash
## Job Name
#SBATCH --job-name=bis-ex-report
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-100:00:00
## Memory per node
#SBATCH --mem=70G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0525





source /gscratch/srlab/programs/scripts/paths.sh


/gscratch/srlab/programs/Bismark-0.19.0/bismark_methylation_extractor  \
-p --bedGraph --counts --scaffolds \
--multicore 28 \
/gscratch/srlab/sr320/analyses/0525/*deduplicated.bam



/gscratch/srlab/programs/Bismark-0.19.0/bismark2report

/gscratch/srlab/programs/Bismark-0.19.0/bismark2summary

