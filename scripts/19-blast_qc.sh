#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=blast
#SBATCH --output=/data/users/mbessire/annotation_course/logs/blast_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/blast_%j.e

# Define directories and file paths
COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/mbessire/annotation_course"
BLASTDIR="$WORKDIR/blast"

protein="/data/users/mbessire/annotation_course/maker/final2/assembly.all.maker.fasta.all.maker.proteins.fasta.renamed.filtered.fasta"
gff="/data/users/mbessire/annotation_course/maker/final2/filtered.genes.renamed.final.gff3"

MAKERBIN="/data/courses/assembly-annotation-course/CDS_annotation/softwares/Maker_v3.01.03/src/bin/"
uniprot_fasta="/data/courses/assembly-annotation-course/CDS_annotation/data/uniprot/uniprot_viridiplantae_reviewed.fa"

# Load BLAST+ module
module load BLAST+/2.15.0-gompi-2021a

# Change to the BLAST working directory
cd $BLASTDIR

# Run BLASTP
blastp -query $protein -db $uniprot_fasta -num_threads 10 -outfmt 6 -evalue 1e-10 -out blastp_output.txt

# Copy the protein and GFF files with updated paths and append .Uniprot suffix
cp $protein $BLASTDIR/$(basename $protein).Uniprot
cp $gff $BLASTDIR/$(basename $gff).Uniprot

# Run MAKER functional annotation tools and save outputs in the BLAST directory
$MAKERBIN/maker_functional_fasta $uniprot_fasta $BLASTDIR/blastp_output.txt $protein > $BLASTDIR/$(basename $protein).Uniprot
$MAKERBIN/maker_functional_gff $uniprot_fasta $BLASTDIR/blastp_output.txt $gff > $BLASTDIR/$(basename $gff).Uniprot.gff3