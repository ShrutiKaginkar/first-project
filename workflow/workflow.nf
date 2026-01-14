nextflow.enable.dsl=2

include { FASTQC as RAW_FASTQC } from '../modules/fastqc.nf'
include { FASTQC as TRIM_FASTQC } from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { HISAT2_ALIGN } from '../modules/hisat2.nf' 

workflow CLEAN_READS {

    take:
        reads   // <-- required input channel

    main:
        RAW_FASTQC(reads)
        trimmed = CUTADAPT(reads)
        TRIM_FASTQC(trimmed) 
        aligned_bam = HISAT2_ALIGN(trimmed, params.hisat2_index)
        

    emit:
        trimmed // output channel if needed 
        aligned_bam
}



