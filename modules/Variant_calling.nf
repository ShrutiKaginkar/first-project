process VARIANT_CALLING {

    tag "${sample_id}"

    publishDir "${params.output}/variant_calling", mode: 'copy'

    input:
    tuple val(sample_id), path(bam), path(bai)
    path ref

    output:
    tuple val(sample_id),
          path("${sample_id}.variants.vcf.gz"),
          path("${sample_id}.variants.vcf.gz.tbi")

    script:
"""
${params.bcftools_bin} mpileup \
    -f ${params.reference_fasta} \
    -Ou ${bam} | \
${params.bcftools_bin} call \
    -mv -Oz \
    -o ${sample_id}.variants.vcf.gz

${params.bcftools_bin} index -t ${sample_id}.variants.vcf.gz
"""
}
