requireNamespace('biomaRt', quietly = T)

# get gene ids and length info from the biomart
mart <- biomaRt::useMart("ensembl", dataset = "mmusculus_gene_ensembl")
Mmu_genes <- biomaRt::getBM(attributes = c("ensembl_gene_id", 
                                           "ensembl_transcript_id",
                                           "external_gene_name",
                                           "transcript_length"),
                             mart = mart)
colnames(Mmu_genes) <- c("ens_id", "transcript_id", "gene_name", "transcript_length")
rm(mart)


# save object to data
save('Mmu_genes', file = "data/Mmu_genes.RData", compress = "xz")
rm(mart, Mmu_genes)