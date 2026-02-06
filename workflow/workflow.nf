
include { FASTQC as RAW_FASTQC } from '../modules/fastqc.nf'
include { FASTQC as TRIM_FASTQC } from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { HISAT2_ALIGN } from '../modules/hisat2.nf' 
include { SAMTOOLS_SORT } from '../modules/samtools.nf' 
include { VARIANT_CALLING } from '../modules/variant_calling.nf'


workflow CLEAN_READS {

    take:
        reads   // <-- required input channel

    main:
        RAW_FASTQC(reads)
        trimmed = CUTADAPT(reads)
        TRIM_FASTQC(trimmed) 
        aligned = HISAT2_ALIGN(trimmed)
        sorted = SAMTOOLS_SORT(aligned)
        variants = VARIANT_CALLING(sorted, params.reference)

    emit:
        trimmed // output channel if needed 
        aligned
        sorted
        variants
}



