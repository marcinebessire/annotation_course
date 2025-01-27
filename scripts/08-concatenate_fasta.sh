#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=concatenate_fasta
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/concat_fasta_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/concat_fasta_%j.e

WORK_DIR="/data/users/mbessire/annotation_course/LTR_RT_analysis"
OUTPUT_FILE="combined_fasta.fasta"
OUTPUT_FILE_COPIA="combined_fasta_copia.fasta"
OUTPUT_FILE_GYPSY="combined_fasta_gypsy.fasta"

cd $WORK_DIR

#cat *.fasta > "$OUTPUT_FILE"

#or do it seperately for gypsy and copia

cat Gypsy_RT.fasta brassicaceae_RT.fasta > "$OUTPUT_FILE_GYPSY"
cat Copia_RT.fasta brassicaceae_RT.fasta > "$OUTPUT_FILE_COPIA"
