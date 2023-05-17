#! /bin/bash
#SBATCH --chdir=/work/bei/GCEF/MEGAHIT/contigs/
#SBATCH --output=/work/bei/GCEF/MEGAHIT/contigs/%x-%A-%a.out
#SBATCH --error=/work/bei/GCEF/MEGAHIT/contigs/%x-%A-%a.err
#SBATCH --time=24:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=10
#SBATCH -J blastn
#SBATCH --mail-user=qicheng.bei@ufz.de
#SBATCH --mail-type=BEGIN,END,FAIL

module load foss/2019b BLAST+/2.9.0
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-1}

file=$(ls *.fa | sed -n ${SLURM_ARRAY_TASK_ID}p)

blastn -query $file -out $file.out -db V34-big -evalue 1e-5 -num_threads ${SLURM_CPUS_PER_TASK:-1} -perc_identity 90 -max_target_seqs 1 -outfmt "6 qseqid sseqid pident length sseq"