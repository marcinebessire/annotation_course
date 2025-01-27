#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=clustal_omega
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/clustal_omega_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/clustal_omega_%j.e

module load Clustal-Omega/1.2.4-GCC-10.3.0


# Define your RT FASTA files (these can be your combined files or individual ones)
rt_gypsy_brassica_file="/data/users/mbessire/annotation_course/LTR_RT_analysis/combined_fasta_gypsy.fasta"
rt_copia_brassica_file="/data/users/mbessire/annotation_course/LTR_RT_analysis/combined_fasta_copia.fasta"

cd /data/users/mbessire/annotation_course/clustal_omega

# Shorten identifiers and replace ":" with "_" for the Gypsy-Brassica file
sed -i 's/#.\+//' "$rt_gypsy_brassica_file"
sed -i 's/:/_/g' "$rt_gypsy_brassica_file"

# Shorten identifiers and replace ":" with "_" for the Copia-Brassica file
sed -i 's/#.\+//' "$rt_copia_brassica_file"
sed -i 's/:/_/g' "$rt_copia_brassica_file"

#align sequences with clustal omega
gypsy_brassica_alignment="gypsy_brassica_alignment.fasta"
copia_brassica_alignment="copia_brassica_alignment.fasta"

# Run Clustal Omega for Gypsy-Brassica sequences, outputting in FASTA format
clustalo -i "$rt_gypsy_brassica_file" -o "$gypsy_brassica_alignment" --outfmt=fasta --threads=4

# Run Clustal Omega for Copia-Brassica sequences, outputting in FASTA format
clustalo -i "$rt_copia_brassica_file" -o "$copia_brassica_alignment" --outfmt=fasta --threads=4
