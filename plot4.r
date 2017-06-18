#Data import
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = '?')

#Selecting rows containing data from 1/2/2007 and 2/2/2007
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

#Creation of date object from date string and time string columns
Date <- strptime(paste(data[,'Date'], data[,'Time']),"%d/%m/%Y %H:%M:%S")

#Creation of dataframe with  Date replacing previous date and time columns
power_data <- data.frame(Date = Date, data[,3:ncol(data)])

#save fig
png(filename = 'plot3.png')

# Two rows, two columns for four plots
par(mfrow=c(2,2))

#Row1,Col1 Plot: Global Active Power vs Time
plot(power_data$Date,power_data$Global_active_power, type = 'l', 
     xlab='', ylab = 'Global Active Power (kilowatts)')


#Row1, Col2 Plot: Voltage vs Time
plot(power_data$Date,power_data$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'Voltage')


#Row2, Col1 Plot: Energy sub-metering vs Time 
#Plots
plot(Date, power_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")
lines(Date,power_data$Sub_metering_2, type = 'l', col = 'red')
lines(Date, power_data$Sub_metering_3, type = 'l', col = 'blue')
#Legend
legend("topright", lty=1, col = c("black", "red", 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


#Row 2, Col2 Plot: Global Reactive Power vs Time
plot(Date,power_data$Global_reactive_power, type = 'l',
     xlab = 'datetime', ylab = 'Global Reactive Power')
dev.off()