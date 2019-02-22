#!/bin/bash
## Job Name
#SBATCH --job-name=gene-blastx
## Allocation Definition
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=2-00:00:00
## Memory per node
#SBATCH --mem=70G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0222
 
 
 
 
 
source /gscratch/srlab/programs/scripts/paths.sh
 
 
/gscratch/srlab/programs/ncbi-blast-2.6.0+/bin/blastx  \
-query /gscratch/srlab/sr320/data/geoduck/Pgenerosa_v070.a.makergene.fa \
-db /gscratch/srlab/sr320/blastdb/uniprot_sprot_080917 \
-evalue 1E-05 \
-outfmt 6 \
-max_target_seqs 1 \
-max_hsps 1 \
-num_threads 28 \
-out /gscratch/srlab/sr320/analyses/0222/Pgenerosa_v070.a.makergene.blastx.uniprot.tab
