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
#SBATCH --time=5-100:00:00
## Memory per node
#SBATCH --mem=500G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/scrubbed/sr320/cw/out/analyses

source /gscratch/srlab/programs/scripts/paths.sh


for fastq in /gscratch/scrubbed/sr320/cw/*1.fq.gz; do
  read1=$(echo "$fastq")
  read1_array+=("$read1")
done

for fastq in /gscratch/scrubbed/sr320/cw/*2.fq.gz; do
  read2=$(echo "$fastq")
  read2_array+=("$read2")
done

for pair in "${!read1_array[@]}"; do
  i=${read1_array[$pair]}
  j=${read2_array[$pair]}
  filename="${i##*/}"
  no_ext="${filename%%.*}"
  bowtie2 -x \
  /gscratch/scrubbed/sr320/cw/chinook_genome \
  -1 "$i" \
  -2 "$j" \
  -X 2000 --sensitive  --no-mixed --phred33 --no-discordant --no-unal \
  -S /gscratch/scrubbed/sr320/cw/out/"$no_ext"_bowtie2.sam \
  -q \
  -p 28
done
