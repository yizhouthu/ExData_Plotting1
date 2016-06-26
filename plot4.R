### This program is aimed to construct plot4.png

## First, read the data (from 2007-02-01 to 2007-02-02 only)
data <- read.table("household_power_consumption.txt", header = FALSE,
                   sep = ";",na.strings = "?", nrows=2880, skip=66637)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                    "Sub_metering_3")

## Second, cleaning the data
data$Time <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Third, construst the plot and save it into plot4.png
png(filename = "plot4.png")
par(mfrow = c(2, 2))

# The upleft plot
plot(x = data$Time, y = data$Global_active_power, type = "n", xlab = "",
     ylab = "Global Active Power")
lines(x = data$Time, y = data$Global_active_power)

# The upright plot
plot(x = data$Time, y = data$Voltage, type = "n", xlab = "datetime",
     ylab = "Voltage")
lines(x = data$Time, y = data$Voltage)

# The downleft plot
plot(x = data$Time, y = data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(x = data$Time, y = data$Sub_metering_1, col = "black")
lines(x = data$Time, y = data$Sub_metering_2, col = "red")
lines(x = data$Time, y = data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend =
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# The downright plot
plot(x = data$Time, y = data$Global_reactive_power, type = "n", xlab = "datetime",
     ylab = "")
lines(x = data$Time, y = data$Global_reactive_power)
dev.off()