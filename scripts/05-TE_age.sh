#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=40G
#SBATCH --cpus-per-task=20
#SBATCH --job-name=TE_age_estimation
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/mbessire/annotation_course/logs/TE_age_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/TE_age_%j.e

# Load the necessary Perl module
module load BioPerl/1.7.8-GCCcore-10.3.0 

cd /data/users/mbessire/annotation_course

# Path to RepeatMasker output and the parseRM.pl script
repeatmasker_output="/data/users/mbessire/annotation_course/output/EDTA_annotation/assembly_lja.fasta.mod.EDTA.anno/assembly_lja.fasta.mod.out"
script_path="/data/users/mbessire/annotation_course/TE_age/parseRM.pl" 

out_dir="/data/users/mbessire/annotation_course/TE_age"

# Run the parseRM.pl script on the RepeatMasker output and save the output in the specified directory
perl $script_path -i $repeatmasker_output -l 50,1 -v > $out_dir/parsed_output.txt