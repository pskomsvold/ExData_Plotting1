#Create plot3.R

##Read data
data <- read.table("household_power_consumption.txt", header = FALSE, col.names = 
                     c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                       "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                       "Sub_metering_3"), sep = ";", skip = 66637, nrows = 2880, na.strings = "?",
                   colClasses = c(rep('character', 2), rep('numeric', 5)))

##Concatenate Date and Time and convert to date format
data$Date_Time <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))


##Create plot 3
png("plot3.png", width = 480, height = 480)

with(data, plot(Date_Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(data, lines(Date_Time, Sub_metering_2, type = "l", col = "red"))
with(data, lines(Date_Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()
