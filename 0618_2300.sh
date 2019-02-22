#!/bin/bash
## Job Name
#SBATCH --job-name=angsd-4
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0618c





source /gscratch/srlab/programs/scripts/paths.sh


/gscratch/srlab/sr320/programs/angsd/angsd \
-bam /gscratch/srlab/sr320/data/cw/all_bam.bamlist \
-nThreads 28 \
-out AllSamples_Maf1_association2 \
-sites /gscratch/srlab/sr320/data/cw/AllSamples_Maf1_sites \
-doAsso 1 \
-yBin /gscratch/srlab/sr320/data/cw/YBin_file \
-GL 1 \
-doMaf 1 \
-doMajorMinor 3 \
-minMaf 0.05 \
-SNP_pval 1e-6 \
-minInd 468 \
-minQ 20 \

