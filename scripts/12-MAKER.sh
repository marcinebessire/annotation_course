#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=MAKER
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/MAKER_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/MAKER_%j.e

WORKDIR=/data/users/mbessire/annotation_course

cd $WORKDIR

# Generate MAKER control files
apptainer exec --bind $WORKDIR /data/courses/assembly-annotation-course/CDS_annotation/containers/MAKER_3.01.03.sif maker -CTL