power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

dates <- power[, "Date"] == "1/2/2007" | power[, "Date"] == "2/2/2007"

power2 <- power[dates, ]

power2$DateTime <- as.POSIXct(paste(power2$Date, power2$Time), format="%d/%m/%Y %H:%M:%S")

##power2$DateTime <- strptime(power2$DateTime, format = "%Y-%m-%d %H:%M:%S")

power2$Date <- NULL
power2$Time <- NULL

#windows()
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(power2$DateTime, power2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(power2$DateTime, power2$Global_active_power)

dev.off()