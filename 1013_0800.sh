#!/bin/bash
## Job Name
#SBATCH --job-name=bow33
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
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/1013

source /gscratch/srlab/programs/scripts/paths.sh


for fastq in /gscratch/scrubbed/sr320/Phred33_fqs/*1.fq.gz; do
  read1=$(echo "$fastq")
  read1_array+=("$read1")
done

for fastq in /gscratch/scrubbed/sr320/Phred33_fqs/*2.fq.gz; do
  read2=$(echo "$fastq")
  read2_array+=("$read2")
done

for pair in "${!read1_array[@]}"; do
  i=${read1_array[$pair]}
  j=${read2_array[$pair]}
  filename="${i##*/}"
  no_ext="${filename%%.*}"
  /gscratch/srlab/programs/bowtie2-2.3.4.1-linux-x86_64/bowtie2 -x \
  /gscratch/srlab/sr320/data/Chinook_genome_scaffold_masked \
  -1 "$i" \
  -2 "$j" \
  -X 2000 --sensitive  --no-mixed --phred33 --no-discordant --no-unal \
  -S /gscratch/scrubbed/sr320/cw/1013/"$no_ext"_bowtie2.sam \
  -q \
  -p 28
done
