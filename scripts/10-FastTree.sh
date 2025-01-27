#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=fast_tree
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/fast_tree_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/fast_tree_%j.e

module load FastTree/2.1.11-GCCcore-10.3.0

# Define the input FASTA protein alignment files (from the Clustal Omega alignment)
gypsy_alignment="/data/users/mbessire/annotation_course/clustal_omega/gypsy_brassicaceae_alignment.fasta"
copia_alignment="/data/users/mbessire/annotation_course/clustal_omega/copia_brassicaceae_alignment.fasta"
gypsy_tree="gypsy_brassicaceae_tree.newick"
copia_tree="copia_brassicaceae_tree.newick"

cd /data/users/mbessire/annotation_course/fast_tree

# Infer phylogenetic tree for Gypsy-Brassica sequences
FastTree -out "$gypsy_tree" "$gypsy_alignment"

# Infer phylogenetic tree for Copia-Brassica sequences
FastTree -out "$copia_tree" "$copia_alignment"


