#!/bin/bash
## Job Name
#SBATCH --job-name=supernova
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=30-100:00:00
## Memory per node
#SBATCH --mem=500G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/scrubbed/sr320/0206

source /gscratch/srlab/programs/scripts/paths.sh



/gscratch/srlab/programs/supernova-2.0.0/supernova run --id=Geoduck \
--fastqs=/gscratch/scrubbed/sr320/Chrom/geoduck_10x_genomics_20171220/HM2JYBBXX/outs/fastq_path \
--sample=Geoduck-1,Geoduck-2



