
include { FASTQC as RAW_FASTQC } from '../modules/fastqc.nf'
include { FASTQC as TRIM_FASTQC } from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { HISAT2_ALIGN } from '../modules/hisat2.nf' 
include { SAMTOOLS_SORT } from '../modules/samtools.nf' 

workflow CLEAN_READS {

    take:
        reads   // <-- required input channel

    main:
        RAW_FASTQC(reads)
        trimmed = CUTADAPT(reads)
        TRIM_FASTQC(trimmed) 
        aligned = HISAT2_ALIGN(trimmed,params.hisat2_index)
        sorted = SAMTOOLS_SORT(aligned)

    emit:
        trimmed // output channel if needed 
        aligned
        sorted
}



