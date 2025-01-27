#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=omark
#SBATCH --output=/data/users/mbessire/annotation_course/logs/omark_run_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/omark_run_%j.e


# Initialize Conda using  friend's installation
eval "$(/home/amaalouf/miniconda3/bin/conda shell.bash hook)"
conda activate OMArk

# Rest of your script
COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/mbessire/annotation_course"

protein="/data/users/mbessire/annotation_course/maker/final2/assembly.all.maker.fasta.all.maker.proteins.fasta.renamed.filtered.fasta"
LUCA="/data/users/mbessire/annotation_course/LUCA.h5"
GENE_ANNOTATION="/data/users/mbessire/annotation_course/maker/final2/filtered.genes.renamed.final.gff3"

cd /data/users/mbessire/annotation_course/omark2

# Run OMAmer
omamer search --db "$LUCA" --query "$protein" --out "${protein}.omamer"


# Prepare isoform list from GFF annotation
grep -P "maker\tmRNA" "$GENE_ANNOTATION" | cut -f 9 | cut -d ";" -f 1 | cut -d "=" -f 2 > isoform_list.txt

# Run OMArk
omark -f "${protein}.omamer" -of "$protein" -i isoform_list.txt -d "$LUCA" -o omark_output
