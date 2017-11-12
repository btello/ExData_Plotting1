# Generate the first plot from the week 1 homework set
PATH_TO_DATA = "C:/Users/Brady/Workspaces/datasciencecoursera/ExploratoryDataAnalysis/Week1/power_consumption_data/household_power_consumption.txt"

start_date = strptime("02/01/2007","%m/%d/%Y")
end_date = strptime("02/02/2007","%m/%d/%Y")

data <- read.csv(PATH_TO_DATA, sep=';')
data$Date <- strptime(as.character(data$Date), format="%d/%m/%Y")
data <- subset(data, Date == start_date | Date == end_date)

png("plot1.png")
hist(as.numeric(as.character(data$Global_active_power)), 
      col="red", 
      xlab = "Global Active Power (kilowatts)", 
      main="Global Active Power")
dev.off()