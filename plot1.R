library(dplyr)

# check if the data file is already downloaded, if not, download and unzip
if(!file.exists("zipdata.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "zipdata.zip")
        unzip("zipdata.zip")}

data_full <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
data <- filter(data_full, Date == "2007-02-01" | Date == "2007-02-02")

#remove large data frame
rm(data_full)

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
