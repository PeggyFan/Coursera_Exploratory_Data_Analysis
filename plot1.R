# plot 1
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

#Alternative more work:
#raw_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
#data2 <- raw_data[raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007",]

library("date")

y <- range(0, 200, 1200)
hist(data$Global_active_power, xlab ="Global Active Power (kilowatts)", 
    main = "Global Active Power", col = "red", ylim=y,)

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
