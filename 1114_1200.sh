#!/bin/bash
## Job Name
#SBATCH --job-name=cg-blastn-tax
## Allocation Definition 
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1   
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=4-00:00:00
## Memory per node
#SBATCH --mem=100
##turn on e-mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/1114b

export BLASTDB=/gscratch/srlab/blastdbs/

/gscratch/srlab/programs/ncbi-blast-2.6.0+/bin/blastn \
-query /gscratch/srlab/sr320/query/Cbairi_trinity_1113.fa \
-db /gscratch/srlab/blastdbs/ncbi-nr-nt-20181114/nt \
-out /gscratch/srlab/sr320/analyses/1114b/cg-trinity-nt.tab \
-max_target_seqs 1 \
-evalue 1e-20 \
-outfmt "6 qseqid sseqid evalue bitscore staxids sscinames scomnames sskingdoms" \
-num_threads 28
