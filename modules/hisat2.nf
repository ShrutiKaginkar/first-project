process HISAT2_ALIGN {

    publishDir params.output, mode: 'copy'

    input:
        tuple val(sample_id), path(reads)
       

    output:
        tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    hisat2 -x ${params.hisat2_index} -U ${reads} | samtools view -bS - > ${sample_id}.bam
    """
}
