datasets_s <- "name, tstart, tend, tunit
Mmu_embryo, 6.5, 19,days post conception
"

devst <- data.frame(name = paste0("TS", seq(9,27)),
                    tstart = c(6.5,7,7.5,8,8.5,9,9.5,10,10.5, 11, 11.5, 12, 13, 14, 15, 16, 17, 18, 19), 
                    stringsAsFactors = F)
devst$tend <- c(devst$tstart[-1], 19.5)
devst$tunit <- "days post conception"
devst$tunit <- factor(devst$tunit)

dss <- read.table(text = datasets_s, h = T, sep = ',', stringsAsFactors = F)
dss$tunit <- factor(dss$tunit)

Mmu_devstages <- list(
  devstages = devst, 
  datasets = dss)

save("Mmu_devstages", file = "data/Mmu_devstages.RData")

rm(devst,
   datasets_s, dss,
   Mmu_devstages)