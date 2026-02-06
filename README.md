# NGS Variant Calling Pipeline (Nextflow)
This repository contains a modular single-end NGS variant calling pipeline implemented using *Nextflow DSL2*. 
The pipeline performs quality control, adapter trimming, alignment, BAM processing and variant calling using standard bioinformatics tools.
Large input data and reference files are intentionally excluded from version control.
--- 

## Pipeline Overview

### Input 
-Single-end FASTQ files (*.fastq.gz)
-Reference genome (ref.fa)

### Workflow steps
1. **FASTQC** - Quality control of raw reads
2. **CUTADAPT** - Adapter trimming
3. **FASTQC** - Quality control of trimmed reads
4. **HISAT2** - Alignment to reference genome
5. **SAMTOOLS** - BAM sorting and indexing
6. **BCFTOOLS** - Variant calling

---

## Repository structure 
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

## Tools used 
-Nextflow (DSL2)
-FastQC
-Cutadapt
-HISAT2
-Samtools
-Bcftools

---

## Clone the repository
bash
git clone https://github.com/ShrutiKaginkar/first-project.git
cd first-project

---

## Setting up environment 
# 1. Creating conda environment
Create and activate the conda environment using the provided environment.yml file: 
bash
conda env create -f environment.yml 
conda activate bnf 

# 2. Install required tool
bash
conda install -c bioconda nextflow fastqc cutadapt hisat2 samtools bcftools -y

- Verify the installations
nextflow -version
fastqc --version
hisat2 --version
cutadapt --version
samtools --version
bcftools --version 

---

## How to run the pipeline
This pipeline runs using *Nextflow (DSL2) and locally installed tools*
### INPUT files (not tracked in git)
-Raw reads: data/sample.fastq
-Reference genome: reference/ref.fa

### To execute the pipeline use commands: 
bash
nextflow run main.nf

# To resume a stopped run
bash
nextflow run main.nf -resume

---

## Files that were be generated are: 
Pipeline Step	           Output Files
FastQC	               *.html, *.zip quality control reports
Cutadapt	             Trimmed FASTQ files (*_trimmed.fastq.gz)
HISAT2	               Aligned BAM files (*.bam)
SAMtools	             Sorted BAM (*.sorted.bam) and index (*.bai)
Variant Calling	       Variant Call Format files (*.vcf.gz) and index (*.tbi)  

---

## Pushing codes to git repository
git add .
git commit -m "Added variant calling pipeline"
git push origin main
ask for user name and password give it accordingly

## Ignoring large files
Add this to .gitignore: 
reference/
results/
work/
*.bam
*.vcf
*.vcf.gz
*.bai











