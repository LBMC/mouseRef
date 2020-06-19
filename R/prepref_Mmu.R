#' Build Interpolated Gene Expression References
#' 
#' Builds the interpolation of the reference datasets.
#' **These functions are internally called by \code{\link[RAPToR]{prepare_refdata}} from RAPToR.**
#' 
#' @param n.inter the resolution of the interpolation, as in \code{seq(start, end, length.out = n.inter)}.
#' 
#' @return A list with \code{interpGE} the interpolated gene expression matrix and 
#' \code{time.series} the time of the interpGE matrix columns.
#' 
#' @seealso \code{\link[RAPToR]{prepare_refdata}} \code{\link[RAPToR]{ge_im}}
#' 
#' @name Mmu_prep
NULL

#' @rdname Mmu_prep
#' @export
#' @importFrom RAPToR ge_im
#' @importFrom stats predict
#' 
.prepref_Mmu_embryo <- function(n.inter){
  # utils::data("Mmu_embryo", envir = environment())
  m <- RAPToR::ge_im(
    X = mouseRef::Mmu_embryo$g,
    p = mouseRef::Mmu_embryo$p,
    formula = mouseRef::Mmu_embryo$geim_params$formula,
    method = mouseRef::Mmu_embryo$geim_params$method,
    dim_red = mouseRef::Mmu_embryo$geim_params$dim_red,
    nc = mouseRef::Mmu_embryo$geim_params$nc
  )
  ndat <- data.frame(age = seq(min(mouseRef::Mmu_embryo$p$age),
                               max(mouseRef::Mmu_embryo$p$age),
                               l = n.inter))
  return(
    list(interpGE = predict(m, ndat), time.series = ndat$age)
  )
}
