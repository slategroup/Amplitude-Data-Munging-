#Step 1: Import data set: File > Import Data Set > Browse > Import > add file name below > amp <- file name

#Step 2: run code(highlight code >> Control + Enter)

install.packages("tidyr")
install.packages("reshape2")
install.packages("dplyr")
library("reshape2")
library("tidyr")
library("dplyr")

amp <- #insert file name here
  
colnames(amp) [1] <- "Event"
colnames(amp) [2] <-"ad-total play"
colnames(amp) [3] <-"ad-pause"
colnames(amp) [4] <-"ad-resume"
colnames(amp) [5] <-"ad-quartile25"
colnames(amp) [6] <-"ad-quartile50"
colnames(amp) [7] <-"ad-quartile75"
colnames(amp) [8] <-"ad-complete"
colnames(amp) [9] <-"ad-unmute"
colnames(amp) [10] <-"ad-unmute"
colnames(amp) [11] <-"ad-replay"



#remove top rows
amp <- amp[-c(1:13),]

#create one chart with 4 lines 
#use melt function to transform data frame 
#melt: "keep the data as it is, Dates are the id and each row shows value of ad;creative_id
ampLong <- melt(amp, id=12:22, measure.vars = 2:11)
filtered <- na.omit(ampLong)
filtered$total<- rowSums(filtered[,1:11])
filtered$product <- "parvus_video"
filtered <- filtered[-c(1:11)]

parvus_video_raw <- separate(filtered, value, c("ad_id","creative_id"), sep = ";", remove = TRUE, extra = 'warn', fill = 'warn')

View(parvus_video_raw)

write.table(parvus_video_raw, file = "amplitude_raw1.6.csv", row.names = FALSE, sep = ",")

