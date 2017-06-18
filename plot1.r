#Data import
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = '?')

#Selecting rows containing data from 1/2/2007 and 2/2/2007
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#Creation of date object from date string and time string columns
Date <- strptime(paste(data[,'Date'], data[,'Time']),"%d/%m/%Y %H:%M:%S")

#Creation of dataframe with  Date replacing previous date and time columns
power_data <- data.frame(Date = Date, data[,3:ncol(data)])

png('plot1.png')

#Global Active Power Histogram
hist(power_data$Global_active_power, col = "red", breaks = 12,main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')


dev.off()