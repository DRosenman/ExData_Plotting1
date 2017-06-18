#Data import
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = '?')

#Selecting rows containing data from 1/2/2007 and 2/2/2007
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#Creation of date object from date string and time string columns
Date <- strptime(paste(data[,'Date'], data[,'Time']),"%d/%m/%Y %H:%M:%S")

#Creation of dataframe with  Date replacing previous date and time columns
power_data <- data.frame(Date = Date, data[,3:ncol(data)])

png(filename = 'plot3.png')


#Sub_metering_1 black, color: black
plot(Date, power_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")

dev.off()

