##Coursera - Exploring Data - Project 1
##Link for data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## working data directory: C:\\Data\\R\\Coursera_Assignments\\04_exdata\\Proj-1 


rm(list = ls())
wd<-"C:\\Data\\R\\Coursera_Assignments\\04_exdata\\Proj-1"
setwd(wd)
datap1 <-read.table("household_power_consumption.txt", stringsAsFactors=FALSE, sep=";", header = TRUE)
dateall<-strptime(paste (datap1$Date, datap1$Time), "%d/%m/%Y %H:%M:%S")
datap2<-cbind(datap1, dateall)
datarel<-datap2[datap2$dateall>=strptime("20070201 00:00:00", "%Y%m%d %H:%M:%S") & datap2$dateall<=strptime("20070202 23:59:59", "%Y%m%d  %H:%M:%S"),]

hist(as.numeric(datarel$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.copy(png, file = "plot1.png")
dev.off()