process HISAT2_ALIGN {

    input:
    val sample
    path trimmed_reads
    path index

    output:
    path "${sample}.bam"

    script:
    """
    hisat2 -x ${index} -U ${trimmed_reads} | samtools view -bS - > ${sample}.bam
    """
}
