#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=05:00:00
#SBATCH --job-name=clades
#SBATCH --output=/data/users/mbessire/annotation_course/logs/output_clades_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/error_clades_%j.e
#SBATCH --partition=pibu_el8

WORKDIR=/data/users/mbessire/annotation_course
OUTDIR=$WORKDIR/output/EDTA_annotation/assembly_lja.fasta.mod.EDTA.raw/LTR
IMAGE=/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif
ASSEMBLY=$WORKDIR/assembly/assembly_lja.fasta
DUSTED=$OUTDIR/assembly_lja.fasta.mod.LTR.intact.fa.ori.dusted

cd $OUTDIR

apptainer exec -C --bind /data -H ${pwd}:/work \
 --writable-tmpfs -u $IMAGE TEsorter $DUSTED -db rexdb-plant
