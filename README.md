# GCEF
# Global Change Experimental Facility (GCEF)

Extreme summers impact soil microbiomes in European cropland and grassland

By Qicheng Bei*, Thomas Reitz, Beatrix Schnabel, Nico Eisenhauer, Martin Schädler, François Buscot, Anna Heintz-Buschart*

# Purpose
Understanding and quantifying the ecological processes that control community assembly is crucial in the field of microbial ecology. Two commonly used models, iCAMP (Ning et al., 2020) and NST (Ning et al., 2019), have been widely applied to assess the relative significance of deterministic and stochastic processes in microbial community assembly. These models primarily rely on the phylogenetic relationships of different groups, often referred to as 'bins,' and are commonly utilized in studies based on amplicon sequencing. Here, we present a pipeline outlining how to prepare GCEF metagenomic datasets for the application of these models.

# This repository includes:
1. Silva-V34s.fasta
* The V3-V4 regions of SILVA release 138.1 for blastn analysis. This fasta was curated based on the primer set 341f/806r (start=6388, end=23444) on "seed" database (https://mothur.org/wiki/silva_reference_files/).
2. Silva-V34b.fasta
* The V3-V4 regions of SILVA release 138.1 for blastn analysis. This fasta was curated based on the primer set 341f/806r (start=6388, end=23444) on "full-length" database.
3. extract.py
* A python script to extract "sseq" from the output of blastn.
4. Sample_blastn.out
* An example for metagenome contig blastn against Silva-V34s.fasta.
5. Sample_V34.fasta
* An example for V3-V4 region of 16S rRNA gene in a metagenome contig file.
6. Following step
* After extraction, several additional steps are required for the application of the iCAMP model, including clustering, mapping, alignment, and phylogenetic tree construction.
