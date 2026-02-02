
process FASTQC {

    input:
    tuple val(sample_id),  path (reads) 

    output:
    tuple val(sample_id), path ("*_fastqc.html"), path( "*_fastqc.zip")

    script:
    """
<<<<<<< HEAD
    fastqc ${reads}
=======
    ${params.fastqc_bin} ${reads}
>>>>>>> d4710e4 (Initial Nextflow pipeline)
    """
}

