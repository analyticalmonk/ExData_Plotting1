power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

dates <- power[, "Date"] == "1/2/2007" | power[, "Date"] == "2/2/2007"

power2 <- power[dates, ]

power2$DateTime <- as.POSIXct(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S")

##power2$DateTime <- strptime(power2$DateTime, format = "%Y-%m-%d %H:%M:%S")

power2$Date <- NULL
power2$Time <- NULL

#windows()
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#Plot-1
plot(power2$DateTime, power2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(power2$DateTime, power2$Global_active_power)

#Plot-2
plot(power2$DateTime, power2$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(power2$DateTime, power2$Voltage)

#Plot-3
plot(power2$DateTime, power2$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
lines(power2$DateTime, power2$Sub_metering_1)
lines(power2$DateTime, power2$Sub_metering_2, col = "red")
lines(power2$DateTime, power2$Sub_metering_3, col = "blue")

#Plot-4
plot(power2$DateTime, power2$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(power2$DateTime, power2$Global_reactive_power)

dev.off()