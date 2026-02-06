# NGS Variant Calling Pipeline (Nextflow)

This repository contains a modular single-end NGS variant calling pipeline implemented using **Nextflow DSL2**.  
The pipeline performs quality control, adapter trimming, alignment, BAM processing, and variant calling using standard bioinformatics tools.  
Large input data and reference files are intentionally excluded from version control.

---

## Pipeline Overview

### Input
- Single-end FASTQ files (`*.fastq.gz`)
- Reference genome (`ref.fa`)

### Workflow Steps
1. **FastQC** – Quality control of raw reads  
2. **Cutadapt** – Adapter trimming  
3. **FastQC** – Quality control of trimmed reads  
4. **HISAT2** – Alignment to reference genome  
5. **SAMtools** – BAM sorting and indexing  
6. **BCFtools** – Variant calling  

---

## Repository Structure

```text
first-project/
├── main.nf
├── workflow.nf
├── modules/
│   ├── fastqc.nf
│   ├── cutadapt.nf
│   ├── hisat2.nf
│   ├── samtools.nf
│   └── variant_calling.nf
├── nextflow.config
├── README.md
└── .gitignore
---

## Tools Used
Nextflow (DSL2)

FastQC

Cutadapt

HISAT2

SAMtools

BCFtools
---

### Clone the Repository
git clone https://github.com/ShrutiKaginkar/first-project.git
cd first-project

### Setting Up the Environment
1. Create Conda Environment
Create and activate the conda environment using the provided environment.yml file:

conda env create -f environment.yml
conda activate bnf

2. Install Required Tools
conda install -c bioconda nextflow fastqc cutadapt hisat2 samtools bcftools -y
# Verify Installations
nextflow -version
fastqc --version
hisat2 --version
cutadapt --version
samtools --version
bcftools --version

## How to Run the Pipeline
This pipeline runs using Nextflow DSL2 with locally installed tools.

#Input Files (Not Tracked in Git)
Raw reads: data/sample.fastq

Reference genome: reference/ref.fa

# Run the Pipeline
nextflow run main.nf
# Resume a Stopped Run
nextflow run main.nf -resume
---

## Output Files
Pipeline Step     	Output Files
FastQC	          *.html, *.zip quality control reports
Cutadapt         	Trimmed FASTQ files (*_trimmed.fastq.gz)
HISAT2	           Aligned BAM files (*.bam)
SAMtools	         Sorted BAM (*.sorted.bam) and index (*.bai)
Variant Calling	   Variant Call Format files (*.vcf.gz) and index (*.tbi)

## Pushing Code to GitHub Repository
git add .
git commit -m "Added variant calling pipeline"
git push origin main
When prompted, enter your GitHub username and personal access token.

## Ignoring Large Files
Add the following entries to .gitignore:

reference/
results/
work/
*.bam
*.vcf
*.vcf.gz
*.bai










