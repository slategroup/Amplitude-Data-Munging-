amp <- Event_Segmentation_Custom_ad_totalplay_ad_left_click_ad_pause_ad_resume_ad_quartile50_ad_complete_2018_01_01_2018_11_19_

colnames(amp) [1] <- "Event"
colnames(amp) [2] <- "ad-total play"
colnames(amp) [3] <-"ad-left-click"
colnames(amp) [4] <-"ad-pause"
colnames(amp) [5] <-"ad-resume"
colnames(amp) [6] <-"ad-quartile50"
colnames(amp) [7] <-"ad-complete"

library(reshape2)
View(amp)

#remove top rows
amp <- amp[-c(1:9),]

#create one chart with 4 lines 
#use melt function to transform data frame 
#melt: "keep the data as it is, Dates are the id and each row shows value of ad;creative_id
ampLong <- melt(amp, id=8:18, measure.vars = 2:7)
filtered <- na.omit(ampLong)
filtered$total<- rowSums(filtered[,1:11])
filtered$product <- "euphonia"
filtered <- filtered[-c(1:11)]

View(ampLong)
View(filtered)

#added row names is false 
write.table(filtered, file = "euphonia_(Add date here).csv", row.names = FALSE, sep = ",")

