#Create Plot1.R

##Read data
data <- read.table("household_power_consumption.txt", header = FALSE, col.names = 
                     c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                       "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                       "Sub_metering_3"), sep = ";", skip = 66637, nrows = 2880, na.strings = "?",
                   colClasses = c(rep('character', 2), rep('numeric', 5)))

##Create plot 1
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()


