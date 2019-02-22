#!/bin/bash
## Job Name
#SBATCH --job-name=angsd-maf
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0615b





source /gscratch/srlab/programs/scripts/paths.sh


/gscratch/srlab/sr320/programs/angsd/angsd \
-b /gscratch/srlab/sr320/data/cw/all_bam.bamlist \
-ref /gscratch/srlab/sr320/data/cw/chinook_genome_v1.fasta \
-out AllSamples_Maf1 \
-GL 1 \
-doMaf 1 \
-doMajorMinor 1 \
-minMaf 0.05 \
-SNP_pval 1e-6 \
-minInd 468 \
-minQ 20 \
-P 28 \
-setMinDepth 468 \
-setMaxDepth 10000 \
-doCounts 1 \
-doDepth 1 \
-dumpCounts 1
