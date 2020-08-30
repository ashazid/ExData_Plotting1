# reading in the data
hpc <- read.table("household_power_consumption.txt", header = T, sep=';', stringsAsFactors = F, na.strings = '?')

# subsetting the data
hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]

# extract date data for x axis
plotx <- strptime(paste(hpcsub$Date, hpcsub$Time, sep=' '), "%d/%m/%Y %H:%M:%S")

# extract all 3 metering data for the y axis
ploty1 <- as.numeric(hpcsub$Sub_metering_1)
ploty2 <- as.numeric(hpcsub$Sub_metering_2)
ploty3 <- as.numeric(hpcsub$Sub_metering_3)

# creating plot2.png
png("plot3.png", width=480, height=480)
plot(plotx, ploty1, type='l', ylab="Energy Submetering", xlab="")
lines(plotx, ploty2, col='red')
lines(plotx, ploty3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
