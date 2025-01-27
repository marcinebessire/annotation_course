#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=Genespace
#SBATCH --output=/data/users/mbessire/annotation_course/logs/Genespacer_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/Genespacer_%j.e

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/mbessire/annotation_course"

# Load the R module
module load R-bundle-IBU/2023121400-foss-2021a-R-4.3.2
module load MariaDB/10.6.4-GCC-10.3.0
module load R-bundle-CRAN/2023.11-foss-2021a

#cd /data/users/mbessire/annotation_course/genespacer

# Step 1: Prepare GENESPACE folder
#Rscript /data/users/mbessire/annotation_course/scripts/21.2-create_genespacer_folder.R

# Step 2: Run GENESPACE
#apptainer exec \
#   --bind $COURSEDIR \
#   --bind $WORKDIR \
#   --bind $SCRATCH:/temp \
#   $COURSEDIR/containers/genespace_latest.sif Rscript $WORKDIR/scripts/21-Genespacer.R genespace

#cd /data/users/mbessire/annotation_course/genespacer/parseothrofinder

# Step 3: Parse orthogroups and create plots
#Rscript $WORKDIR/scripts/23-parse_orthofinder.r 

cd /data/users/mbessire/annotation_course/genespacer/parseothrofinder2

Rscript $WORKDIR/scripts/23.2-parse.orthofinder2.R


