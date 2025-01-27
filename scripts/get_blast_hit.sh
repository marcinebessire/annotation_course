#!/bin/bash
#SBATCH --time=1-0
#SBATCH --mem=64G
#SBATCH -p pibu_el8
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=blast_hit
#SBATCH --output=/data/users/mbessire/annotation_course/logs/blast_hit_%j.o
#SBATCH --error=/data/users/mbessire/annotation_course/logs/blast_hit_%j.e
#!/bin/bash

# Input files
BLAST_OUTPUT="/data/users/mbessire/annotation_course/blast/blastp_output.txt" # Path to BLAST output file (outfmt 6)
PROTEIN_FILE="/data/users/mbessire/annotation_course/maker/final2/assembly.all.maker.fasta.all.maker.proteins.fasta.renamed.filtered.fasta" # Path to protein FASTA file

# Output files
GENES_WITH_HITS="genes_with_hits.txt"
GENES_WITHOUT_HITS="genes_without_hits.txt"
ALL_GENES="all_genes.txt"

# Step 1: Extract genes with BLAST hits
echo "Extracting genes with BLAST hits..."
awk '{print $1}' "$BLAST_OUTPUT" | sort | uniq > "$GENES_WITH_HITS"

# Step 2: Extract all gene IDs from the protein FASTA file
echo "Extracting all gene IDs from the protein file..."
grep ">" "$PROTEIN_FILE" | sed 's/>//' > "$ALL_GENES"

# Step 3: Identify genes without BLAST hits
echo "Identifying genes without BLAST hits..."
comm -23 <(sort "$ALL_GENES") <(sort "$GENES_WITH_HITS") > "$GENES_WITHOUT_HITS"

# Step 4: Count genes in each category
echo "Counting genes..."
NUM_WITH_HITS=$(wc -l < "$GENES_WITH_HITS")
NUM_WITHOUT_HITS=$(wc -l < "$GENES_WITHOUT_HITS")

echo "Summary:"
echo "Genes with BLAST hits: $NUM_WITH_HITS"
echo "Genes without BLAST hits: $NUM_WITHOUT_HITS"

# Optional: Print output file locations
echo "Genes with hits saved in: $GENES_WITH_HITS"
echo "Genes without hits saved in: $GENES_WITHOUT_HITS"
