library(dplyr)
Mechadata <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Mechadata)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=Mechadata))

SuspensionData <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
Total_Summary <- SuspensionData %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")
Lot_Summary <- SuspensionData %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

Sample_Data <- SuspensionData %>% sample_n(50)
t.test(Sample_Data$PSI, mu=mean(SuspensionData$PSI))
t.test(subset(SuspensionData$PSI, SuspensionData$Manufacturing_Lot == "Lot1"),mu=mean(SuspensionData$PSI))
t.test(subset(SuspensionData$PSI, SuspensionData$Manufacturing_Lot == "Lot2"),mu=mean(SuspensionData$PSI))
t.test(subset(SuspensionData$PSI, SuspensionData$Manufacturing_Lot == "Lot3"),mu=mean(SuspensionData$PSI))
