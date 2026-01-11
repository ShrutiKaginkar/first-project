nextflow.enable.dsl=2

process CLEAN_READS_RAW_FASTQC {

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
workflow FASTQC {
    take:
    fastq

    main:
    CLEAN_READS_RAW_FASTQC(fastq)
}
