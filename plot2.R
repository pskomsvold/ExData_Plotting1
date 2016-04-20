##Read data
data <- read.table("household_power_consumption.txt", header = FALSE, col.names = 
                     c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                       "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                       "Sub_metering_3"), sep = ";", skip = 66637, nrows = 2880, na.strings = "?",
                   colClasses = c(rep('character', 2), rep('numeric', 5)))

##Concatenate Date and Time and convert to date format
data$Date_Time <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))


##Create plot 2
png("plot2.png", width = 480, height = 480)

with(data, plot(Date_Time, Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power (kilowatts)"))

dev.off()
