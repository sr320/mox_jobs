#!/bin/bash
## Job Name
#SBATCH --job-name=bis-dd-sort
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-100:00:00
## Memory per node
#SBATCH --mem=128G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0525





source /gscratch/srlab/programs/scripts/paths.sh


/gscratch/srlab/programs/Bismark-0.19.0/deduplicate_bismark \
--bam -p \
/gscratch/srlab/sr320/analyses/0515/*.bam



find /gscratch/srlab/sr320/analyses/0525/*deduplicated.bam \
| xargs basename -s _R1_001_bismark_bt2_pe.deduplicated.bam | xargs -I{} /gscratch/srlab/programs/samtools-1.4/samtools \
sort -@ 28 {}_R1_001_bismark_bt2_pe.deduplicated.bam \
-o /gscratch/srlab/sr320/analyses/0525/{}_dedup.sorted.bam


