#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=RT_analysis
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/RT_analysis_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/RT_analysis_%j.e

module load SeqKit/2.6.1

BRASSICACEAE="/data/courses/assembly-annotation-course/CDS_annotation/data/Brassicaceae_repbase_all_march2019.fasta"
CONTAINER="/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif"
BRASSICACEAE_FAA="/data/users/mbessire/annotation_course/LTR_RT_analysis/TEsorter_output/Brassicaceae_repbase_all_march2019.fasta.rexdb-plant.dom.faa"
OUTPUT_DIR="/data/users/mbessire/annotation_course/LTR_RT_analysis"

cd /data/users/mbessire/annotation_course/LTR_RT_analysis

#perfrom TE sorter on extracted RT seuqneces(Copia)
#apptainer exec -C --bind /data -H ${PWD}:/work --writable-tmpfs -u $CONTAINER TEsorter $BRASSICACEAE -db rexdb-plant 

#extract RT from Brassicaea 
seqkit grep -r -p "RT" $BRASSICACEAE_FAA -o $OUTPUT_DIR/brassicaceae_RT.fasta