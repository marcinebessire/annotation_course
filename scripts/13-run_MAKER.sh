#!/bin/bash
#SBATCH --time=4-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=50
#SBATCH --job-name=Maker
#SBATCH --output=/data/users/mbessire/annotation_course/logs/MAKER_run_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/MAKER_run_%j.e

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/mbessire/annotation_course"
REPEATMASKER_DIR="/data/courses/assembly-annotation-course/CDS_annotation/softwares/RepeatMasker"
TMP="/data/users/mbessire/annotation_course/maker/TMP"

export PATH=$PATH:"/data/courses/assembly-annotation-course/CDS_annotation/softwares/RepeatMasker"

module load OpenMPI/4.1.1-GCC-10.3.0
module load AUGUSTUS/3.4.0-foss-2021a

cd /data/users/mbessire/annotation_course/maker

mpiexec --oversubscribe -n 50 apptainer exec --bind /data:/data --bind /data/users/mbessire/annotation_course/maker/TMP:/TMP --bind $COURSEDIR --bind $AUGUSTUS_CONFIG_PATH --bind $REPEATMASKER_DIR \
    ${COURSEDIR}/containers/MAKER_3.01.03.sif \
    maker -mpi --ignore_nfs_tmp -TMP /TMP maker_opts_accession.ctl maker_bopts.ctl maker_evm.ctl maker_exe.ctl
