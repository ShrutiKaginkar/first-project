nextflow.enable.dsl=2

process FASTQC {

    input:
    path fastq

    output:
    path "*_fastqc.html"
    path "*_fastqc.zip"

    script:
    """
    fastqc ${fastq}
    """
}

