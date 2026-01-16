
process FASTQC {

    input:
    tuple val(sample_id),  path (reads) 

    output:
    tuple val(sample_id), path ("*_fastqc.html"), path( "*_fastqc.zip")

    script:
    """
    fastqc ${reads}
    """
}

