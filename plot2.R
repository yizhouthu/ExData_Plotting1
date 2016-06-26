### This program is aimed to construct plot2.png

#First, read the data (from 2007-02-01 to 2007-02-02 only)
data <- read.table("household_power_consumption.txt", header = FALSE,
                   sep = ";",na.strings = "?", nrows=2880, skip=66637)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                    "Sub_metering_3")

#Second, cleaning the data
data$Time <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Third, construst the plot and save it into plot2.png
png(filename = "plot2.png")
plot(x = data$Time, y = data$Global_active_power, type = "n", xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(x = data$Time, y = data$Global_active_power)
dev.off()