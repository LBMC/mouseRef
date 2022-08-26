sapply(c("utils", "biomaRt", "Biobase", "GEOquery", "limma", "RAPToR"), 
       requireNamespace, quietly = T)


mart <- biomaRt::useMart("ensembl", dataset = "mmusculus_gene_ensembl")
probe_ids <- biomaRt::getBM(attributes = c("ensembl_gene_id", "affy_mouse430_2"),
                            mart = mart)
colnames(probe_ids) <- c("ens_id", "affy")


geo_id <- "GSE39897"
geo_obj <- GEOquery::getGEO(geo_id)[[1]]

pdat <- Biobase::pData(geo_obj)
pdat <- pdat[,c("title", "geo_accession", "developmental stage:ch1")]
colnames(pdat) <- c("title", "geo_accession", "devstage")


pdat$age <- factor(pdat$devstage, levels = unique(pdat$devstage))
levels(pdat$age) <- c(0, 0.5, 6.5, 7.5, 8.5, 10, 11.5, 12.5, 14, 15, 17, 19)
pdat$age <- as.numeric(as.character(pdat$age))

pdat$rep <- factor(gsub(".* (rep\\d)", "\\1", pdat$title))


gdat <- 2^Biobase::exprs(geo_obj)
gdat <- RAPToR::format_ids(gdat, probe_ids, from = "affy", to = "ens_id")

sel <- pdat$age > 1
pdat <- pdat[sel,]
gdat <- gdat[,sel]


# log & normalize
gdat <- log1p(limma::normalizeBetweenArrays(gdat, method = "quantile"))


# get nc for geim 
pca <- summary(stats::prcomp(t(gdat), rank = 10, center = TRUE, scale = FALSE))
nc <- sum(pca$importance["Cumulative Proportion",] < .8) + 1 

p <- pdat[, c("geo_accession", "age", "geo_accession")]
colnames(p) <- c("sname", "age", "accession")

Mmu_embryo <- list(g = gdat,
                   p = p,
                   geim_params = list(formula = "X ~ s(age, bs = 'cr')",
                                      method = "gam",
                                      dim_red = "ica",
                                      nc = nc),
                   t.unit = "days post-coitus",
                   cov.levels = NULL,
                   metadata = list("organism" = "M. musculus",
                                   "profiling" = "whole-organism, single-embryo",
                                   "technology" = "Microarray")
)


save(Mmu_embryo, file = "data/Mmu_embryo.RData", compress = "xz")

# cleanup

rm(pdat, p, gdat, geo_id, geo_obj, 
   mart, probe_ids, sel,
   pca, nc, 
   Mmu_embryo)
