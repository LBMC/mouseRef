#' Mmu_genes
#' 
#' A gene ID table for *D. melanogaster*.
#' 
#' This table was built directly from the ensembl biomaRt.
#' 
#' 
#' @docType data
#' 
#' @section Format:
#' A dataframe with the folowing columns :
#' 
#'  - `ens_id`: Ensembl ID (*e.g* `ENSMUSG00000064367`)
#'  - `transcript_id`: Transcript ID (*e.g* `ENSMUST00000082418`)
#'  - `public_name`: Gene name (*e.g* `mt-Nd5`)
#'  - `transcript_length`: Transcript length from 5'UTR start to 3'UTR end (*e.g* `1824`)
#' 
#' 
#' @source \href{https://www.ensembl.org/index.html}{ensembl biomaRt} 
#' 
"Mmu_genes"