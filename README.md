# mouseRef

This repo is an R package with the mouse development reference(s) for age estimation using the [`RAPToR` tool](https://github.com/LBMC/RAPToR).

To install the package, you can use the `devtools` R package. This should be done in your R console :

```r
library(devtools)
devtools::install_github("LBMC/mouseRef")
```

If you don't have `devtools` installed, you can do the following :
```r
install.packages("devtools")
```

<hr>

## Update info
### v0.2
 - Built a function factory to simplify ref. building code
 - Added reference metadata to comply with RAPToR v1.2 update.
 - Added time range/unit info in list_refs 
### v0.1
 - Created the data package. 