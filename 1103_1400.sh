#!/bin/bash
## Job Name
#SBATCH --job-name=oly_bedgraphs
## Allocation Definition 
#SBATCH --account=coenv
#SBATCH --partition=coenv
## Resources
## Nodes
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=5-00:00:00
## Memory per node
#SBATCH --mem=100G
##turn on e-mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sr320@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/srlab/sr320/analyses/1103

# Load Python Mox module for Python module availability

module load intel-python3_2017

# Document programs in PATH (primarily for program version ID)

date >> system_path.log
echo "" >> system_path.log
echo "System PATH for $SLURM_JOB_ID" >> system_path.log
echo "" >> system_path.log
printf "%0.s-" {1..10} >> system_path.log
echo ${PATH} | tr : \\n >> system_path.log

# Set sorted transcriptome assembly bam file
oly_transcriptome_bam=/gscratch/srlab/sr320/data/oly/20180925_Olurida_v081.sorted.bam


# Set program paths
bedtools=/gscratch/srlab/programs/bedtools-2.27.1/bin
samtools=/gscratch/srlab/programs/samtools-1.9/samtools


# Create bedgraph
## Reports depth at each position (-bg in bedgraph format) and report regions with zero coverage (-a).
## Screens for portions of reads coming from exons (-split).
## Add genome browser track line to header of bedgraph file.
${bedtools}/genomeCoverageBed \
-ibam ${oly_transcriptome_bam} \
-bg \
| awk '$4 > 9' > oly_RNAseq.bedgraph

