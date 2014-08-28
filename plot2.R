setwd("/Users/peggyfan/Downloads/R_data/Exploratory_data_analysis")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "power.zip", method = "curl", mode ="w",)
unzip("power.zip")
library(data.table)
data1 <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip= 66636, nrow=2880)

names(data1)[1] <- "Date"
names(data1)[2] <- "Time"
names(data1)[3] <- "Global_active_power"
names(data1)[4] <- "Global_reactive_power"
names(data1)[5] <- "voltage"
names(data1)[6] <- "Global_intensity"
names(data1)[7] <- "Sub_metering_1"
names(data1)[8] <- "Sub_metering_2"
names(data1)[9] <- "Sub_metering_3"

data1$Date <- as.character(data1$Date)
data1$Time <- as.character(data1$Time)
data1$Date <- rep(c("1/2/07","2/2/07"), each=1440)
x <- paste(data1$Date,data1$Time)
data1$new_time <- strptime(x,"%d/%m/%y %H:%M:%S")

plot(data1$new_time, as.numeric(data1$Global_active_power)/500, type ="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)" )
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
