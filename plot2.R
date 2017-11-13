# Generate the second plot from the week 1 homework set
PATH_TO_DATA = "../power_consumption_data/household_power_consumption.txt"

start_date = strptime("02/01/2007 00:00:00","%m/%d/%Y %H:%M:%S")
end_date = strptime("02/03/2007 00:00:00","%m/%d/%Y %H:%M:%S")

data <- read.csv(PATH_TO_DATA, sep=';')
data$Date <- paste(data$Date, data$Time)
data$Date <- strptime(as.character(data$Date), format="%d/%m/%Y %H:%M:%S")
data <- subset(data, Date >= start_date & Date <= end_date)

png("plot2.png")
plot(data$Date,as.numeric(as.character(data$Global_active_power)),
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
