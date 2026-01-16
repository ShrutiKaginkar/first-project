process HISAT2_ALIGN {

    publishDir params.output, mode: 'copy'

    input:
        tuple val(sample_id), path(trimmed_reads)
        path index

    output:
        tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    hisat2 -x ${index} -U ${trimmed_reads} | samtools view -bS - > ${sample_id}.bam
    """
}
