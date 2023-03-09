library(dplyr)
library(tidyverse)
library(ggplot2)
library(data.table)
library(ggpubr)

args <- commandArgs(trailingOnly = TRUE)

BED <- args[1]
chr <- args[2]
inv  <- args[3]

name <- paste("Chr", "REP", chr, sep="_")

#centromers <- read.table("Centromeres_LC075745_HA412_no_NA.bed", head=F)
#centromers <- centromers[order(centromers[,1], centromers[,2]), ]
 #       centromers$start <- pmin(centromers$V2, centromers$V3)
 #       centromers$end <- pmax(centromers$V2, centromers$V3)

 #       centromers_1 <- subset(centromers, centromers$V1=="Ha412HOChr01")
 #       centromers_2 <- subset(centromers, centromers$V1=="Ha412HOChr02")
 #       centromers_3 <- subset(centromers, centromers$V1=="Ha412HOChr03")
 #       centromers_4 <- subset(centromers, centromers$V1=="Ha412HOChr04")
 #       centromers_5 <- subset(centromers, centromers$V1=="Ha412HOChr05")
 #       centromers_6 <- subset(centromers, centromers$V1=="Ha412HOChr06")
 #       centromers_7 <- subset(centromers, centromers$V1=="Ha412HOChr07")
 #       centromers_8 <- subset(centromers, centromers$V1=="Ha412HOChr08")
 #       centromers_9 <- subset(centromers, centromers$V1=="Ha412HOChr09")
 #       centromers_10 <- subset(centromers, centromers$V1=="Ha412HOChr10")
 #       centromers_11 <- subset(centromers, centromers$V1=="Ha412HOChr11")
 #       centromers_12 <- subset(centromers, centromers$V1=="Ha412HOChr12")
 #       centromers_13 <- subset(centromers, centromers$V1=="Ha412HOChr13")
 #       centromers_14 <- subset(centromers, centromers$V1=="Ha412HOChr14")
 #       centromers_15 <- subset(centromers, centromers$V1=="Ha412HOChr15")
 #       centromers_16 <- subset(centromers, centromers$V1=="Ha412HOChr16")
 #       centromers_17 <- subset(centromers, centromers$V1=="Ha412HOChr17")

#fake vcf

bed <- read.table(BED)
 bed_1 <- subset(bed, bed$V1=="H1_HiC_scaffold_1")
 bed_2 <- subset(bed, bed$V1=="H1_HiC_scaffold_2")
 bed_3 <- subset(bed, bed$V1=="H1_HiC_scaffold_3")
 bed_4 <- subset(bed, bed$V1=="H1_HiC_scaffold_4")
 bed_5 <- subset(bed, bed$V1=="H1_HiC_scaffold_5")
 bed_6 <- subset(bed, bed$V1=="H1_HiC_scaffold_6")
 bed_7 <- subset(bed, bed$V1=="H1_HiC_scaffold_7")
 bed_8 <- subset(bed, bed$V1=="H1_HiC_scaffold_8")
 bed_9 <- subset(bed, bed$V1=="H1_HiC_scaffold_9")
 bed_10 <- subset(bed, bed$V1=="H1_HiC_scaffold_10")
 bed_11 <- subset(bed, bed$V1=="H1_HiC_scaffold_11")
 bed_12 <- subset(bed, bed$V1=="H1_HiC_scaffold_12")
 bed_13 <- subset(bed, bed$V1=="H1_HiC_scaffold_13")
 bed_14 <- subset(bed, bed$V1=="H1_HiC_scaffold_14")
 bed_15 <- subset(bed, bed$V1=="H1_HiC_scaffold_15")
 bed_16 <- subset(bed, bed$V1=="H1_HiC_scaffold_16")
 bed_17 <- subset(bed, bed$V1=="H1_HiC_scaffold_17")


XLIM_1  <- 77026589
XLIM_2  <- 76204061
XLIM_3  <- 77034262
XLIM_4  <- 85151323
XLIM_5  <- 61227360
XLIM_6  <- 57378241
XLIM_7  <- 65398611
XLIM_8  <- 68935951
XLIM_9  <- 65873613
XLIM_10  <- 83056683
XLIM_11  <- 67913503
XLIM_12  <- 91660686
XLIM_13  <- 82605142
XLIM_14  <- 78367183
XLIM_15  <- 59873676
XLIM_16  <- 64525524
XLIM_17  <- 65531134


INV <- read.table(inv,  header=F)
#INV  <- subset(INV, INV$V8 == "-") #esto lo cambio por el momento por que mi inv está en la hebra positiva
 INV_1 <- subset(INV, INV$V7=="H1_HiC_scaffold_1")
 INV_2 <- subset(INV, INV$V7=="H1_HiC_scaffold_2")
 INV_3 <- subset(INV, INV$V7=="H1_HiC_scaffold_3")
 INV_4 <- subset(INV, INV$V7=="H1_HiC_scaffold_4")
 INV_5 <- subset(INV, INV$V7=="H1_HiC_scaffold_5")
 INV_6 <- subset(INV, INV$V7=="H1_HiC_scaffold_6")
 INV_7 <- subset(INV, INV$V7=="H1_HiC_scaffold_7")
 INV_8 <- subset(INV, INV$V7=="H1_HiC_scaffold_8")
 INV_9 <- subset(INV, INV$V7=="H1_HiC_scaffold_9")
 INV_10 <- subset(INV, INV$V7=="H1_HiC_scaffold_10")
 INV_11 <- subset(INV, INV$V7=="H1_HiC_scaffold_11")
 INV_12 <- subset(INV, INV$V7=="H1_HiC_scaffold_12")
 INV_13 <- subset(INV, INV$V7=="H1_HiC_scaffold_13")
 INV_14 <- subset(INV, INV$V7=="H1_HiC_scaffold_14")
 INV_15 <- subset(INV, INV$V7=="H1_HiC_scaffold_15")
 INV_16 <- subset(INV, INV$V7=="H1_HiC_scaffold_16")
 INV_17 <- subset(INV, INV$V7=="H1_HiC_scaffold_17")

                     # centro <- paste("centromers_", chr, sep="")
                     # VCF <- paste("vcf_chr", chr, sep="")
                     # VCFM <- paste("vcfm_chr", chr, sep="")
                      BED <- paste("bed_", chr, sep="")
                      XLIM <- paste("XLIM_", chr, sep="")
                      INVR <- paste("INV_", chr, sep="")

                      tabla <- c()
                      for (j in 1:nrow(eval(as.name(BED)))) {
                      bed_val <- seq.int(eval(as.name(BED))[j,2], eval(as.name(BED))[j,3])
                      tabla <- c(tabla, bed_val)
                      }


                       if(nrow(eval(as.name(INVR))) == 0){
                      HBED <- ggplot() + aes(tabla) + geom_histogram(colour="black", fill="grey", binwidth = 1000000) + xlim(0, eval(as.name(XLIM))) +
                      # geom_vline(xintercept= eval(as.name(centro))$start, color = "purple", alpha = .05) +
                       ggtitle(paste("Chr", chr, sep=" ")) +  labs(y= "Masked_bp", x = "bp") +
                       theme(axis.text=element_text(size=16,face="bold") , axis.title=element_text(size=16,face="bold"), plot.title = element_text(size = 20, face = "bold") )
                       } else {

                       HBED <- ggplot() + aes(tabla) + geom_histogram(colour="black", fill="grey", binwidth = 1000000) + xlim(0, eval(as.name(XLIM))) +
                      # geom_vline(xintercept= eval(as.name(centro))$start, color = "purple", alpha = .05) +
                       ggtitle(paste("Chr", chr, sep=" ")) +  labs(y= "Masked_bp", x = "bp") +
                       theme(axis.text=element_text(size=16,face="bold") , axis.title=element_text(size=16,face="bold"), plot.title = element_text(size = 20, face = "bold") ) +
                       geom_vline(xintercept=eval(as.name(INVR))$V1, color = "green", size=1) +
                       geom_vline(xintercept=eval(as.name(INVR))$V2, color = "green", size=1)
                      #annotate("rect", ymin = 0, ymax =  max( eval(as.name(BED))$length), xmin = eval(as.name(INVR))$V3, xmax = eval(as.name(INVR))$V4, alpha = 0.2, fill = "green")
                     HBED <- HBED + annotate("rect", ymin = 0, ymax =  max(ggplot_build(HBED)$data[[1]]$count)  , xmin = eval(as.name(INVR))$V1, xmax = eval(as.name(INVR))$V2, alpha = 0.2, f
ill = "green")
                      }


                      #HPL <- ggplot(eval(as.name(VCF)), aes(x = V2)) +  geom_histogram(colour="black", fill="grey", binwidth = 10000) + xlim(0, XLIM) +
                      # geom_vline(xintercept= eval(as.name(centro))$start, color = "purple", alpha = .05) +
                      # ggtitle(paste("Chr", chr, sep=" ")) +  labs(y= "SNP_number", x = "bp") +
                      # theme(axis.text=element_text(size=16,face="bold") , axis.title=element_text(size=16,face="bold"), plot.title = element_text(size = 20, face = "bold") )

                      #HPL2 <- ggplot(eval(as.name(VCFM)), aes(x = V2)) +  geom_histogram(colour="black", fill="grey", binwidth = 10000) + xlim(0, XLIM) +
                       #geom_vline(xintercept= eval(as.name(centro))$start, color = "purple", alpha = .05) +
                       #ggtitle(paste("Chr", chr, sep=" ")) +  labs(y= "SNP_number", x = "bp") +
                       #theme(axis.text=element_text(size=16,face="bold") , axis.title=element_text(size=16,face="bold"), plot.title = element_text(size = 20, face = "bold") )

                       #assign(paste("plot_HB", i, sep=""),HBED)
                       #assign(paste("plot_", i, sep=""),HPL)
                       #assign(paste("plot_H", i, sep=""),HPL2)


    jpeg(paste(name, ".jpg", sep="_"), width=2000, height= 2000)
    HBED
   dev.off()


 #  jpeg(paste(name, MIn_NB, "Anchorwave_SI_pair_wise_div_1Mb_chr4_nospline.jpg", sep="_"), width=2000, height= 1000)
  #print(plot_4)
  # dev.off()

 #jpeg(paste(name, MIn_NB, "Anchorwave_SI_pair_wise_div_1Mb_chr13Nospline.jpg", sep="_"), width=2000, height= 1000)
  #print(plot_13)
   #dev.off()



#write.table(collapsed, file = paste(name, "dxy.txt", sep ="_"), quote = FALSE, row.names = FALSE)

save.image(paste(name, ".Rdata", sep="_"))
