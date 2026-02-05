process SAMTOOLS_SORT{

    publishDir params.output, mode: 'copy'

    input:
    tuple val(sample_id), path(bam)

    output:
    tuple val(sample_id),
          path("${sample_id}.sorted.bam"),
          path("${sample_id}.sorted.bam.bai")

    script:
    """
    ${params.samtools_bin} sort ${bam} -o ${sample_id}.sorted.bam
    ${params.samtools_bin} index ${sample_id}.sorted.bam
    """
}

