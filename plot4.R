# reading in the data
hpc <- read.table("household_power_consumption.txt", header = T, sep=';', stringsAsFactors = F, na.strings = '?')

# subsetting the data
hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]

# extract date data for x axis
plotx <- strptime(paste(hpcsub$Date, hpcsub$Time, sep=' '), "%d/%m/%Y %H:%M:%S")

# extract global active power data for topleft plot
gactp <- as.numeric(hpcsub$Global_active_power)

# extract voltage data for topright plot
voltage <- as.numeric(hpcsub$Voltage)

# extract all 3 submetering data for bottomleft plot
subm1 <- as.numeric(hpcsub$Sub_metering_1)
subm2 <- as.numeric(hpcsub$Sub_metering_2)
subm3 <- as.numeric(hpcsub$Sub_metering_3)

# extract global reactive power data for bottomright plot
greactp <- as.numeric(hpcsub$Global_reactive_power)

# creating plot4.png
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# topleft plot
plot(plotx, gactp, type='l', ylab = "Global Active Power")

# topright plot
plot(plotx, voltage, type='l', ylab = "Voltage")

# bottomleft plot
plot(plotx, subm1, type='l', ylab = "Energy Sub Metering")
lines(plotx, subm2, col="red")
lines(plotx, subm3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# bottom right plot
plot(plotx, greactp, type='l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
