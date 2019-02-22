#!/bin/bash
## Job Name
#SBATCH --job-name=ks-oly-blast
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/1105

/gscratch/srlab/programs/ncbi-blast-2.6.0+/bin/blastn \
-task blastn \
-query /gscratch/srlab/sr320/data/oly/Trinity.fasta \
-db /gscratch/srlab/sr320/data/oly/Olurida_v081 \
-out /gscratch/srlab/sr320/analyses/1105/ks-trinity-v081.tab \
-evalue 1e-20 \
-outfmt 6 \
-num_threads 28

