#!/bin/bash
## Job Name
#SBATCH --job-name=Cvblastx-nomax
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=4-00:00:00
## Memory per node
#SBATCH --mem=70G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0929c
 
 
 
 
 
source /gscratch/srlab/programs/scripts/paths.sh
 
 
/gscratch/srlab/programs/ncbi-blast-2.6.0+/bin/blastx  \
-query /gscratch/srlab/sr320/query/GCF_002022765.2_C_virginica-3.0_cds_from_genomic.fna \
-db /gscratch/srlab/sr320/blastdb/uniprot_sprot_080917 \
-evalue 1E-05 \
-outfmt 6 \
-num_threads 28 \
-out Cvcds_from_genomic_sprot.blastout
