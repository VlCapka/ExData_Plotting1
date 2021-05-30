library(dplyr)

# check if the data file is already downloaded, if not, download and unzip
if(!file.exists("zipdata.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "zipdata.zip")
        unzip("zipdata.zip")}

data_full <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data <- filter(data_full, Date == "1/2/2007" | Date == "2/2/2007")

#remove large data frame
rm(data_full)

data <- mutate(data, DT = paste(Date, Time))
data$DT <- strptime(data$DT, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", height = 480, width = 480)
plot(data$DT, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowats)", type = "n")
lines(data$DT, data$Global_active_power)
dev.off()

