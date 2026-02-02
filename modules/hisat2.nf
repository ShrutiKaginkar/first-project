process HISAT2_ALIGN {

    publishDir params.output, mode: 'copy'

    input:
        tuple val(sample_id), path(reads)
<<<<<<< HEAD
       
=======
>>>>>>> d4710e4 (Initial Nextflow pipeline)

    output:
        tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
<<<<<<< HEAD
    hisat2 -x ${params.hisat2_index} -U ${reads} | samtools view -bS - > ${sample_id}.bam
    """
}
=======
     ${params.hisat2_index} -U ${reads} | samtools view -bS - > ${sample_id}.bam
    """
}

>>>>>>> d4710e4 (Initial Nextflow pipeline)
