#!/bin/bash
## Job Name
#SBATCH --job-name=bsmap
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-100:00:00
## Memory per node
#SBATCH --mem=500G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0308





source /gscratch/srlab/programs/scripts/paths.sh


find /gscratch/srlab/sr320/data/olurida-bs/*gz \
| xargs basename -s .fastq.gz | xargs -I{} /gscratch/srlab/programs/bsmap-2.89/bsmap \
-a /gscratch/srlab/sr320/data/olurida-bs/{}.fastq.gz \
-d /gscratch/srlab/sr320/data/olurida-bs/Ol-pbjelly1k.fa \
-o /gscratch/srlab/sr320/analyses/0308/{}-bsmap_out_jelly1k.sam \
-p 28

