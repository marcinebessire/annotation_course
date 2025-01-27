#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=annotation
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/annotation_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/annotation_%j.e

REXDB_TSV_COPIA="/data/users/mbessire/annotation_course/Copia_Gypsy/Copia_sequences.fa.rexdb-plant.cls.tsv"
GYPSY="/data/users/mbessire/annotation_course/Copia_Gypsy/Gypsy_sequences.fa.rexdb-plant.cls.tsv"
GENOME_SUM="/data/users/mbessire/annotation_course/output/EDTA_annotation/assembly_lja.fasta.mod.EDTA.TEanno.sum"
COLOR_TEMPLAT="/data/users/mbessire/annotation_course/annotation/dataset_color_strip_template.txt"
BAR_TEMPLATE="/data/users/mbessire/annotation_course/annotation/dataset_simplebar_template.txt"

cd /data/users/mbessire/annotation_course/annotation

# gypsy clades
# for brassicacea family
grep -e "Retand" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FF0000 Retand/' > Retand_ID.txt 
grep -e "Athila" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #00FF00 Athila/' > Athila_ID.txt 
grep -e "CRM" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #0000FF CRM/' > CRM_ID.txt 
grep -e "Reina" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FFA500 Reina/' > Reina_ID.txt 
grep -e "Tekay" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #800080 Tekay/' > Tekay_ID.txt 
grep -e "Galadriel" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #008080 Galadriel/' > Galadriel_ID.txt 
grep -e "unknown" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #808080 unknown/' > unknown_ID.txt 

# for arabidopsis
grep -e "Retand" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FF0000 Retand/' >> Retand_ID.txt 
grep -e "Athila" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #00FF00 Athila/' >> Athila_ID.txt 
grep -e "CRM" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #0000FF CRM/' >> CRM_ID.txt 
grep -e "Reina" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FFA500 Reina/' >> Reina_ID.txt 
grep -e "Tekay" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #800080 Tekay/' >> Tekay_ID.txt 
grep -e "Galadriel" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #008080 Galadriel/' >> Galadriel_ID.txt 
grep -e "unknown" $REXDB_TSV_GYPSY | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #808080 unknown/' >> unknown_ID.txt 


cd $OUTDIR2

# copia clades
# for brassicacea family
grep -e "Ale" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FF6347 Ale/' > Ale_ID.txt 
grep -e "Alesia" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #00FF00 Alesia/' > Alesia_ID.txt 
grep -e "Angela" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #0000FF Angela/' > Angela_ID.txt 
grep -e "Bianca" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FFA500 Bianca/' > Bianca_ID.txt 
grep -e "Ikeros" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #800080 Ikeros/' > Ikeros_ID.txt 
grep -e "Ivana" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #808080 Ivana/' > Ivana_ID.txt 
grep -e "SIRE" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FFD700 SIRE/' > SIRE_ID.txt 
grep -e "TAR" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #00CED1 TAR/' > TAR_ID.txt 
grep -e "Tork" $COPIA | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FF1493 Tork/' > Tork_ID.txt

# for arabidopsis
grep -e "Ale" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FF6347 Ale/' >> Ale_ID.txt 
grep -e "Alesia" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #00FF00 Alesia/' >> Alesia_ID.txt 
grep -e "Angela" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #0000FF Angela/' >> Angela_ID.txt 
grep -e "Bianca" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FFA500 Bianca/' >> Bianca_ID.txt 
grep -e "Ikeros" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #800080 Ikeros/' >> Ikeros_ID.txt 
grep -e "Ivana" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #808080 Ivana/' >> Ivana_ID.txt 
grep -e "SIRE" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FFD700 SIRE/' >> SIRE_ID.txt 
grep -e "TAR" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #00CED1 TAR/' >> TAR_ID.txt 
grep -e "Tork" $COPIA_ARAB | cut -f 1 | sed 's/:/_/' | sed 's/#.*//' | sed 's/$/ #FF1493 Tork/' >> Tork_ID.txt



