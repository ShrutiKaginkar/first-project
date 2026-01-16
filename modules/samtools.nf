process SAMTOOLS_SORT {

    publishDir params.output, mode: 'copy'

    input:
        tuple val(sample_id), path(bam)

    output:
        tuple val(sample_id), path("${sample_id}.sorted.bam")

    script:
    """
    samtools sort ${bam} -o ${sample_id}.sorted.bam
    """
}

