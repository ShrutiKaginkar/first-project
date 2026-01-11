nextflow.enable.dsl=2

include { FASTQC as RAW_FASTQC } from '../modules/fastqc.nf'
include { FASTQC as TRIM_FASTQC } from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'

workflow CLEAN_READS {

    take:
        reads   // <-- required input channel

    main:
        RAW_FASTQC(reads)
        trimmed = CUTADAPT(reads)
        TRIM_FASTQC(trimmed)

    emit:
        trimmed // output channel if needed
}



