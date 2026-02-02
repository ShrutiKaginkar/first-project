process SAMTOOLS_SORT {

    publishDir params.output, mode: 'copy'

    input:
        tuple val(sample_id), path(bam)

    output:
        tuple val(sample_id), path("${sample_id}.sorted.bam")

    script:
    """
   ${params.samtools_bin} sort ${bam} -o ${sample_id}.sorted.bam
    """
}

