#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=get_genes
#SBATCH --output=/data/users/mbessire/annotation_course/logs/get_geens_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/get_genes_%j.e

cd /data/users/mbessire/annotation_course/maker

#get numebr of genes
grep -P "\tgene\t" assembly.all.maker.noseq.gff | wc -l > total_genes_count.txt

cd /data/users/mbessire/annotation_course/maker/final2

#get number of filtered genes
grep -P "\tgene\t" filtered.genes.renamed.final.gff3 | wc -l > filtered_genes_count.txt 

