#!/bin/bash
## Job Name
#SBATCH --job-name=bismark
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=10-100:00:00
## Memory per node
#SBATCH --mem=300G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/0620




source /gscratch/srlab/programs/scripts/paths.sh





find /gscratch/srlab/sr320/data/olurida-bs/[1-8]_*.gz \
| xargs basename -s _L001_R1_001.fastq.gz | xargs -I{} /gscratch/srlab/programs/Bismark-0.19.0/bismark \
--path_to_bowtie /gscratch/srlab/programs/bowtie2-2.1.0 \
-genome /gscratch/srlab/sr320/data/olurida-genomes/v081 \
-p 28 \
/gscratch/srlab/sr320/data/olurida-bs/{}_L001_R1_001.fastq.gz



/gscratch/srlab/programs/Bismark-0.19.0/deduplicate_bismark \
--bam -s \
/gscratch/srlab/sr320/analyses/0620/*.bam


/gscratch/srlab/programs/Bismark-0.19.0/bismark_methylation_extractor \
--bedGraph --counts --scaffolds \
--multicore 14 \
/gscratch/srlab/sr320/analyses/0620/*deduplicated.bam


