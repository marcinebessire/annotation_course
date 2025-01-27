#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=merge_gff
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/merge_gff_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/merge_gff_%j.e

# Directories and paths
COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
MAKERBIN="$COURSEDIR/softwares/Maker_v3.01.03/src/bin"
WORKDIR="/data/users/mbessire/annotation_course/maker"
OUTPUTDIR="${WORKDIR}/assembly_lja.maker.output"

# Merge GFF and FASTA output
$MAKERBIN/gff3_merge -s -d ${OUTPUTDIR}/assembly_lja_master_datastore_index.log > ${WORKDIR}/assembly.all.maker.gff
$MAKERBIN/gff3_merge -n -s -d ${OUTPUTDIR}/assembly_lja_master_datastore_index.log > ${WORKDIR}/assembly.all.maker.noseq.gff
$MAKERBIN/fasta_merge -d ${OUTPUTDIR}/assembly_lja_master_datastore_index.log -o ${WORKDIR}/assembly.all.maker.fasta

