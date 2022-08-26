#' Build Interpolated Gene Expression References
#' 
#' Builds the interpolation of the reference datasets.
#' **These functions are internally called by \code{\link[RAPToR]{prepare_refdata}} from RAPToR.**
#' 
#' @param n.inter,by.inter the resolution of the interpolation, as in \code{seq(start, end, length.out = n.inter)} or \code{seq(start, end, by = by.inter)}.
#' 
#' @return A list with \code{interpGE} the interpolated gene expression matrix and 
#' \code{time.series} the time of the interpGE matrix columns.
#' 
#' @seealso \code{\link[RAPToR]{prepare_refdata}} \code{\link[RAPToR]{ge_im}} \code{\link[RAPToR]{make_ref}}
#' 
#' 
#' @name Mmu_prep
NULL

#' @rdname Mmu_prep
#' @export
#' @importFrom RAPToR ge_im make_ref
#' @importFrom stats predict
#' 
.prepref_skel <- function(data, from=NULL, to=NULL){
  # .prepref function factory
  f <- function(n.inter=NULL, by.inter=NULL){
    m <- RAPToR::ge_im(
      X = data$g,
      p = data$p,
      formula = data$geim_params$formula,
      method = data$geim_params$method,
      dim_red = data$geim_params$dim_red,
      nc = data$geim_params$nc
    )
    return(RAPToR::make_ref(m, 
                            n.inter = n.inter,
                            by.inter = by.inter,
                            from = from, 
                            to = to,
                            t.unit = data$t.unit,
                            cov.levels = data$cov.levels,
                            metadata = data$metadata)
    )
  }
  return(f)
}


#' @rdname Mmu_prep
#' @export
#' 
.prepref_Mmu_embryo <- .prepref_skel(mouseRef::Mmu_embryo)