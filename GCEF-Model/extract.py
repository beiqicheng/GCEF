import os

# Define the directory containing the BLAST output files
blast_dir = "/work/bei/GCEF/MEGAHIT/contigs/out/"

# Loop over all files in the directory that end with ".out"
for blast_file in os.listdir(blast_dir):
    if blast_file.endswith(".out"):
        # Create the output filename by replacing ".out" with ".fasta"
        fasta_file = blast_file.replace(".out", ".fasta")
        
        # Open the BLAST output file for reading
        with open(os.path.join(blast_dir, blast_file), "r") as blast_input, open(os.path.join(blast_dir, fasta_file), "w") as fasta_output:
            for line in blast_input:
                fields = line.strip().split("\t")
                sseqid = fields[1]
                sseq = fields[4]
                
                # Replace the sseqid with qseqid in the FASTA header
                header = ">{}\n".format(fields[0].replace(" ", "_"))
                
                # Write the sseq sequence to the output file in FASTA format
                fasta_output.write(header + sseq + "\n")
