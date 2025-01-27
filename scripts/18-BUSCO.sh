#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=50
#SBATCH --job-name=busco
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/busco_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/busco_%j.e

WORKDIR="/data/users/mbessire/annotation_course"
PROTEIN="/data/users/mbessire/annotation_course/maker/assembly.all.maker.fasta.all.maker.proteins.fasta" 
TRANSCRIPT="/data/users/mbessire/annotation_course/maker/assembly.all.maker.fasta.all.maker.transcripts.fasta"
OUTPUT_DIR="/data/users/mbessire/annotation_course/busco"
LINEAGE="brassicales_odb10"

# Load the BUSCO module
module load BUSCO/5.4.2-foss-2021a

cd /data/users/mbessire/annotation_course/busco

# Remember to get the longest isoform from the maker annotation

busco \
    -i $TRANSCRIPT \
    -l $LINEAGE \
    -o Maker_transcripts \
    -m transcriptome \
    --cpu 50 \
    --out_path $WORKDIR/busco \
    --download_path $WORKDIR/busco \
    --force

busco \
    -i $PROTEIN \
    -l $LINEAGE \
    -o Maker_proteins \
    -m proteins \
    --cpu 50 \
    --out_path $WORKDIR/busco \
    --download_path $WORKDIR/busco \
    --force