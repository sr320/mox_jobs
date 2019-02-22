#!/bin/bash
## Job Name
#SBATCH --job-name=oakl
## Allocation Definition
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Resources
## Nodes (We only get 1, so this is fixed)
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=00-100:00:00
## Memory per node
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/1024




source /gscratch/srlab/programs/scripts/paths.sh


find /gscratch/srlab/sr320/data/oakl/*_1.fq.gz \
| xargs basename -s _s1_R1_val_1.fq.gz | xargs -I{} /gscratch/srlab/programs/Bismark-0.19.0/bismark \
--path_to_bowtie /gscratch/srlab/programs/bowtie2-2.1.0 \
--score_min L,0,-1.2 \
-genome /gscratch/srlab/sr320/data/Cvirg-genome \
-p 28 \
-1 /gscratch/srlab/sr320/data/oakl/{}_s1_R1_val_1.fq.gz \
-2 /gscratch/srlab/sr320/data/oakl/{}_s1_R2_val_2.fq.gz \

/gscratch/srlab/programs/Bismark-0.19.0/deduplicate_bismark \
--bam -p \
/gscratch/srlab/sr320/analyses/1024/*.bam


/gscratch/srlab/programs/Bismark-0.19.0/bismark_methylation_extractor \
--bedGraph --counts --scaffolds \
--multicore 14 \
/gscratch/srlab/sr320/analyses/1024/*deduplicated.bam



# Bismark processing report

/gscratch/srlab/programs/Bismark-0.19.0/bismark2report

#Bismark summary report

/gscratch/srlab/programs/Bismark-0.19.0/bismark2summary



# Sort files for methylkit and IGV

find /gscratch/srlab/sr320/analyses/1024/*deduplicated.bam | \
xargs basename -s .bam | \
xargs -I{} /gscratch/srlab/programs/samtools-1.9/samtools \
sort --threads 28 /gscratch/srlab/sr320/analyses/1024/{}.bam \
-o /gscratch/srlab/sr320/analyses/1024/{}.sorted.bam

# Index sorted files for IGV
# The "-@ 16" below specifies number of CPU threads to use.

find /gscratch/srlab/sr320/analyses/1024/*.sorted.bam | \
xargs basename -s .sorted.bam | \
xargs -I{} /gscratch/srlab/programs/samtools-1.9/samtools \
index -@ 28 /gscratch/srlab/sr320/analyses/1024/{}.sorted.bam
