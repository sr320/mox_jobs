#!/bin/bash
## Job Name
#SBATCH --job-name=ls-bow
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=5-100:00:00
## Memory per node
#SBATCH --mem=500G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/1117/

source /gscratch/srlab/programs/scripts/paths.sh





bowtie2-build \
-q \
/gscratch/srlab/sr320/data/oly/Olurida_v081.fa \
/gscratch/srlab/sr320/data/oly/Olurida_v081.bowtie-index



find /gscratch/srlab/sr320/data/ls-tag/*.gz | xargs basename -s L006_R1_001.fastq.gz | xargs -I{} \
| bowtie2 \
-x /gscratch/srlab/sr320/data/oly/Olurida_v081.bowtie-index \
-U /gscratch/srlab/sr320/data/ls-tag/{}L006_R1_001.fastq.gz \
#-X 2000 --sensitive --no-mixed --phred33 --no-discordant --no-unal \
-p 28 \
-q \
-S /gscratch/srlab/sr320/analyses/1117/{}_01_bowtie2.sam

