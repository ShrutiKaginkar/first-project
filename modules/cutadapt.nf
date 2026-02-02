process CUTADAPT {

  input:
  tuple val(sample_id), path(fastq)

  output:
  tuple val(sample_id), path("${sample_id}.trimmed.fastq.gz")

  script:
  """
<<<<<<< HEAD
  cutadapt -o ${sample_id}.trimmed.fastq.gz ${fastq}
=======
  ${params.cutadapt_bin} -o ${sample_id}.trimmed.fastq.gz ${fastq}
>>>>>>> d4710e4 (Initial Nextflow pipeline)
  """
}


