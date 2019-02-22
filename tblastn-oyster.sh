#!/bin/bash
## Job Name
#SBATCH --job-name=Giga-oly-blast
## Allocation Definition 
#SBATCH --account=coenv
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1   
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=00:30:00
## Memory per node
#SBATCH --mem=100
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/

/gscratch/srlab/programs/ncbi-blast-2.6.0+/bin/tblastn \
-task tblastn-fast \
-query /gscratch/srlab/sr320/data/Cvirg-genome/GCF_002022765.2_C_virginica-3.0_genomic.fa \
-db /gscratch/srlab/sr320/blastdb/Ostrea_lurida-scafSeq \
-out /gscratch/srlab/sr320/analyses/CgGigaProtein-Scaff.tab \
-outfmt 6 \
-max_target_seqs 1 \
-num_threads 24
