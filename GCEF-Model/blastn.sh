#! /bin/bash
#SBATCH --chdir=/work/bei/GCEF/MEGAHIT/contigs/
#SBATCH --output=/work/bei/GCEF/MEGAHIT/contigs/%x-%A-%a.out
#SBATCH --error=/work/bei/GCEF/MEGAHIT/contigs/%x-%A-%a.err
#SBATCH --time=01:00:00
#SBATCH --mem-per-cpu=2G
#SBATCH --cpus-per-task=4
#SBATCH -J blastn

module load foss/2019b BLAST+/2.9.0
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-1}

file=$(ls *.fa | sed -n ${SLURM_ARRAY_TASK_ID}p)

### Build blastn database using: makeblastdb -in Silva-V34s.fasta -dbtype nucl -out Silva-V34s

blastn -query $file -out $file.out -db Silva-V34s -evalue 1e-5 -num_threads ${SLURM_CPUS_PER_TASK:-1} -perc_identity 90 -max_target_seqs 1 -outfmt "6 qseqid sseqid pident length sseq" 
### The sequence identity and output format could be changed according to the purpose of study.
