
include { CLEAN_READS } from './workflow/workflow.nf'

workflow {

    // Define input channel *inside* workflow block
    reads = channel.fromPath("/mnt/c/fastq_nextflow/data/*.fastq.gz")
                    .map { file -> tuple(file.baseName,file) }
                    
    // Pass channel to workflow
    CLEAN_READS(reads)
}
