#Step 1: Import data set: File > Import Data Set > Browse > Import > add file name below > amp <- file name

#Step 2: run code(highlight code >> Control + Enter)

install.packages("tidyr")
install.packages("reshape2")
install.packages("dplyr")
install.packages("readxl")
library("reshape2")
library("tidyr")
library("dplyr")
library("readxl")

?readxl

setwd ("/Users/josepicon/Downloads")
amp <- read_xlsx("parvusvid11.1.xlsx")
  
colnames(amp) <- c("Event", "ad-total play", "ad-pause", "ad-resume", "ad-quartile25", "ad-quartile50", "ad-quartile75", "ad-complete", "ad-unmute", "ad-unmute", "ad-replay")

View(amp)
#remove top rows
amp <- amp[-c(1:13),]

#create one chart with 4 lines 
#use melt function to transform data frame 
#melt: keeps the data as it is, Dates are the id and each row shows value of ad;creative_id
ampLong <- melt(amp, id=12:22, measure.vars = 2:11)
filtered <- na.omit(ampLong)
filtered$total<- rowSums(filtered[,1:11])
filtered$product <- "parvus_video"
filtered <- filtered[-c(1:11)]

parvus_video_raw <- separate(filtered, value, c("ad_id","creative_id"), sep = ";", remove = TRUE, extra = 'warn', fill = 'warn')

write.table(parvus_video_raw, file = "amplitude_raw1.9.csv", row.names = FALSE, sep = ",")

?merge



