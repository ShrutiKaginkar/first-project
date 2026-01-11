process CUTADAPT {

    input:
    path reads

    output:
    path "trimmed.fastq.gz"

    script:
    """
    cutadapt -o trimmed.fastq.gz ${reads}
    """
}
