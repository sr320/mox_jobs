#!/bin/bash
## Job Name
#SBATCH --job-name=angsd-05
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-100:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0809b





source /gscratch/srlab/programs/scripts/paths.sh


/gscratch/srlab/sr320/programs/angsd/angsd -bam /gscratch/srlab/sr320/data/cw/all_bam.bamlist -out Genotypes_parentage2 -GL 1 -doMaf 1 -doMajorMinor 1 -minMaf 0.1 -SNP_pval 1e-6 -minInd 525 -minQ 20 -P 28 -doGeno 2 -doPost 1 -postCutoff 0.95 -doCounts 1 -geno_minDepth 5