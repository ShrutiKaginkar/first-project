nextflow.enable.dsl=2

include { CLEAN_READS } from './workflow/workflow.nf'

workflow {

    // Define input channel *inside* workflow block
    reads = channel.fromPath('/mnt/c/fastq_nextflow/data/*.fastq.gz')

    // Pass channel to workflow
    CLEAN_READS(reads)
}
