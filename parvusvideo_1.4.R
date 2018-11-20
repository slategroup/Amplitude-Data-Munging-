
amp <- #insert file name here

 colnames(amp) [1] <- "Event"
 colnames(amp) [2] <-"ad-total play"
 colnames(amp) [3] <-"ad-pause"
 colnames(amp) [4] <-"ad-resume"
 colnames(amp) [5] <-"ad-quartile25"
 colnames(amp) [ 6] <-"ad-quartile50"
 colnames(amp) [7] <-"ad-quartile75"
 colnames(amp) [8] <-"ad-complete"
 colnames(amp) [9] <-"ad-unmute"
 colnames(amp) [10] <-"ad-unmute"
 colnames(amp) [11] <-"ad-replay"
 
 library(reshape2)
 
 #removes top rows
 amp <- amp[-c(1:13),]

 #use melt function to transform data frame 
 #melt: keeps the data as it is, Dates are the id and each row shows value of ad_id;creative_id
 ampLong <- melt(amp, id=12:22, measure.vars = 2:11)
 
 #removes empty cells 
 filtered <- na.omit(ampLong)
 
 #creates new column with sum of all rows 
 filtered$total<- rowSums(filtered[,1:11])
 
 #creates new column with product name
 filtered$product <- "parvus_video"
 
 #removes columns
 filtered <- filtered[-c(1:11)]
 
 View(filtered)
 
 #added row names is false 
 write.table(filtered, file = "amplitude_raw1.6.csv", row.names = FALSE, sep = ",")
 
 