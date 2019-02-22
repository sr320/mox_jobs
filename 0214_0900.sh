#!/bin/bash
## Job Name
#SBATCH --job-name=geoy-blast
## Allocation Definition 
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1   
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=3-00:00:00
## Memory per node
#SBATCH --mem=100
##turn on e-mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0214

/gscratch/srlab/programs/ncbi-blast-2.6.0+/bin/blastn \
-task blastn \
-query /gscratch/srlab/sr320/data/geoduck/Pgenerosa_transcriptome_v4.fasta \
-db /gscratch/srlab/sr320/blastdb/Pgenerosa_v071 \
-out /gscratch/srlab/sr320/analyses/0214/geo-tran4-v071.tab \
-evalue 1e-20 \
-max_target_seqs 1 \
-outfmt 6 \
-num_threads 28

