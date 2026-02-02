process CUTADAPT {

  input:
  tuple val(sample_id), path(fastq)

  output:
  tuple val(sample_id), path("${sample_id}.trimmed.fastq.gz")

  script:
  """
  ${params.cutadapt_bin} -o ${sample_id}.trimmed.fastq.gz ${fastq}

  """
}


