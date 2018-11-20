
amp <- Event_Segmentation_Custom_ad_totalplay_ad_pause_ad_resume_ad_quartile25_ad_quartile50_ad_quartile75_ad_co_2018_01_01_2018_11_19_

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
 View(amp)
 
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
 
 View(filtered)
 
 #added row names is false 
 write.table(filtered, file = "amplitude_raw1.6.csv", row.names = FALSE, sep = ",")
 
 