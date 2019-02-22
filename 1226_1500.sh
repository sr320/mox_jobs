#!/bin/bash
## Job Name
#SBATCH --job-name=bgzip
## Allocation Definition 
#SBATCH --account=srlab
#SBATCH --partition=srlab
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/1226




/gscratch/srlab/sr320/programs/htslib/bgzip --threads 20 /gscratch/srlab/sr320/analyses/1226/temp.gz > /gscratch/srlab/sr320/analyses/1226/Combined.SNP.TRSdp5g95FnDNAmaf05.sorted.vcf.gz

