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

par(mfcol = c(2, 2))

plot(as.numeric(datarel$Global_active_power)~datarel$dateall, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(as.numeric(datarel$Global_active_power)~datarel$dateall)

plot(as.numeric(datarel$Sub_metering_1)~datarel$dateall, type="n", ylab="Energy Sub Metering", xlab="")
lines(as.numeric(datarel$Sub_metering_1)~datarel$dateall)
lines(as.numeric(datarel$Sub_metering_2)~datarel$dateall, col="red")
lines(as.numeric(datarel$Sub_metering_3)~datarel$dateall, col="blue")

legend("topright" , lty=1, cex=0.5, y.intersp=.15,  col = c("black", "blue", "red"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

plot(as.numeric(datarel$Voltage)~datarel$dateall, type="n", ylab="Voltage", xlab="datetime")
lines(as.numeric(datarel$Voltage)~datarel$dateall)

plot(as.numeric(datarel$Global_reactive_power)~datarel$dateall,type="n", ylab="Global_reactive_power", xlab="datetime")
lines(as.numeric(datarel$Global_reactive_power)~datarel$dateall)

dev.copy(png, file = "plot4.png")
dev.off()