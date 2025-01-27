#!/bin/bash
#SBATCH --job-name=generate_fai      # Job name
#SBATCH --output=/data/users/mbessire/annotation_course/logs/output_fai_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/error_fai_%j.e
#SBATCH --time=01:00:00              # Maximum time (hh:mm:ss)
#SBATCH --mem=16G                     # Memory allocation
#SBATCH --cpus-per-task=1            # Number of CPU cores
#SBATCH --partition=pibu_el8

# Load the SAMtools module
module load SAMtools/1.13-GCC-10.3.0

cd /data/users/mbessire/annotation_course/assembly

# Path to your assembly FASTA file
FASTA_FILE="/data/users/mbessire/annotation_course/assembly/assembly_lja.fasta"

# Generate the .fai index
samtools faidx $FASTA_FILE

