# Generate the third plot from the week 1 homework set
PATH_TO_DATA = "../power_consumption_data/household_power_consumption.txt"

start_date = strptime("02/01/2007 00:00:00","%m/%d/%Y %H:%M:%S")
end_date = strptime("02/03/2007 00:00:00","%m/%d/%Y %H:%M:%S")

data <- read.csv(PATH_TO_DATA, sep=';')
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(as.character(data$Date), format="%d/%m/%Y %H:%M:%S")
data <- subset(data, Date >= start_date & Date <= end_date)

png("plot4.png")

par(mfrow = c(2,2), mai=c(.65,.65,.65,.65)) # set up a 2 x 2 grid of plots

# Plot 1
plot(data$Date,as.numeric(as.character(data$Global_active_power)),
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")


#plot 3
plot(data$Date, as.numeric(as.character(data$Voltage)), 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

#plot 2
plot(data$Date, data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2, type="l", col="red")
lines(data$Date, data$Sub_metering_3, type="l", col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1),
       col = c("black","red","blue"),
       bty = "n")


#plot 4
plot(data$Date, as.numeric(as.character(data$Global_reactive_power)), 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()
