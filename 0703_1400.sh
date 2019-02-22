#!/bin/bash
## Job Name
#SBATCH --job-name=file_dwn
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0703





source /gscratch/srlab/programs/scripts/paths.sh


cd /gscratch/srlab/sr320/data/

mkdir ks_CP-2

cd ks_CP-2

wget -r --no-parent -A 'CP*.gz' http://owl.fish.washington.edu/nightingales/O_lurida/