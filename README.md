# mouseRef

This repo is an R package with the mouse development reference(s) for age estimation using the [`RAPToR` tool](https://github.com/LBMC/RAPToR).

To install the package, run the following in your R console :

```r
if (!requireNamespace("remotes", quietly = TRUE))
    install.packages("remotes")
remotes::install_github("LBMC/mouseRef", build_vignettes = T)
```

<hr>

## Update info
### v0.2
 - Built a function factory to simplify ref. building code
 - Added reference metadata to comply with RAPToR v1.2 update.
 - Added time range/unit info in list_refs 
### v0.1
 - Created the data package. 