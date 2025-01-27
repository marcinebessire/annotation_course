#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=EDTA
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/EDTA_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/EDTA_%j.e

WORKDIR=/data/users/mbessire/annotation_course
ASSEMBLY=/data/users/mbessire/annotation_course/assembly/assembly_lja.fasta
IMAGE=/data/courses/assembly-annotation-course/containers2/EDTA_v1.9.6.sif
CDS=/data/courses/assembly-annotation-course/CDS_annotation/data/TAIR10_cds_20110103_representative_gene_model_updated

mkdir -p $WORKDIR/output/EDTA_annotation
cd $WORKDIR/output/EDTA_annotation

# Singularity (or Apptainer) command to launch EDTA:
apptainer exec -C --bind /data -H ${pwd}:/work \
 --writable-tmpfs -u $IMAGE EDTA.pl \
 --genome $ASSEMBLY \
 --species others \
 --step all \
 --cds $CDS \
 --anno 1 \
 --threads 20