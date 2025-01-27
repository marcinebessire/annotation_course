#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=analysis_LTR
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/LTR_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/LTR_%j.e

module load SeqKit/2.6.1

COPIA_PEP="/data/users/mbessire/annotation_course/Copia_Gypsy/Copia_sequences.fa.rexdb-plant.cls.pep"
COPIA_FAA="/data/users/mbessire/annotation_course/Copia_Gypsy/Copia_sequences.fa.rexdb-plant.dom.faa"
GYPSY_PEP="/data/users/mbessire/annotation_course/Copia_Gypsy/Gypsy_sequences.fa.rexdb-plant.cls.pep"
GYPSY_FAA="/data/users/mbessire/annotation_course/Copia_Gypsy/Gypsy_sequences.fa.rexdb-plant.dom.faa"
BRASSICACEAE="/data/courses/assembly-annotation-course/CDS_annotation/data/Brassicaceae_repbase_all_march2019.fasta"
CONTAINER="/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif"
OUTPUT_DIR="/data/users/mbessire/annotation_course/LTR_RT_analysis"

#step 1 extract RT protein from Copia and Gypsy separately 

cd /data/users/mbessire/annotation_course/LTR_RT_analysis

# Create list of Copia (Ty1-RT) RT proteins from rexdb
grep "Ty1-RT" $COPIA_FAA > $OUTPUT_DIR/copia_rt_list.txt
sed -i 's/>//' $OUTPUT_DIR/copia_rt_list.txt
sed -i 's/ .\+//' $OUTPUT_DIR/copia_rt_list.txt
seqkit grep -f $OUTPUT_DIR/copia_rt_list.txt $COPIA_FAA -o $OUTPUT_DIR/Copia_RT.fasta

# Create list of Gypsy (Ty3-RT) RT proteins from rexdb
grep "Ty3-RT" $GYPSY_FAA > $OUTPUT_DIR/gypsy_rt_list.txt
sed -i 's/>//' $OUTPUT_DIR/gypsy_rt_list.txt
sed -i 's/ .\+//' $OUTPUT_DIR/gypsy_rt_list.txt
seqkit grep -f $OUTPUT_DIR/gypsy_rt_list.txt $GYPSY_FAA -o $OUTPUT_DIR/Gypsy_RT.fasta

