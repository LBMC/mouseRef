#' Mmu_embryo
#' 
#' Transcriptomic data from *M. musculus* embryonic samples.
#' 
#' One time series is included in this dataset.
#'  - \insertCite{xue2013global}{mouseRef}
#' 
#' 
#' The gene expression matrix is \eqn{log(X + 1)} of quantile-normalized expression data.
#' 
#' @docType data
#' 
#' @eval data_format()
#' 
#' @source \href{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE39897}{GSE39897}
#' 
#' @references
#'    \insertAllCited{}
#' 
#' 
#' @importFrom Rdpack reprompt
"Mmu_embryo"