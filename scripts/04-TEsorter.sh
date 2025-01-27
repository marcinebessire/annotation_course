#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=05:00:00
#SBATCH --job-name=TEsorter
#SBATCH --output=/data/users/mbessire/annotation_course/logs/output_tesorter_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/error_tesorter_%j.e
#SBATCH --partition=pibu_el8

module load SeqKit/2.6.1

#Define the necessary paths
genome="/data/users/mbessire/annotation_course/output/EDTA_annotation/assembly_lja.fasta.mod.EDTA.TElib.fa"  
WORKDIR="/data/users/mbessire/annotation_course"                                  
CONTAINER="/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif" 

# Extract Copia sequences
seqkit grep -r -p "Copia" $genome > Copia_sequences.fa
# Extract Gypsy sequences
seqkit grep -r -p "Gypsy" $genome > Gypsy_sequences.fa

# Step 2: Run TEsorter for Copia and Gypsy sequences
apptainer exec -C --bind /data -H ${PWD}:/work --writable-tmpfs -u $CONTAINER TEsorter Copia_sequences.fa -db rexdb-plant

echo "Running TEsorter for Gypsy sequences..."
apptainer exec -C --bind /data -H ${PWD}:/work --writable-tmpfs -u $CONTAINER TEsorter Gypsy_sequences.fa -db rexdb-plant