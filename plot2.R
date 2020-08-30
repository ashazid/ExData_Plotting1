# reading in the data
hpc <- read.table("household_power_consumption.txt", header = T, sep=';', stringsAsFactors = F, na.strings = '?')

# subsetting the data
hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]

# extract date data for x axis
plotx <- strptime(paste(hpcsub$Date, hpcsub$Time, sep=' '), "%d/%m/%Y %H:%M:%S")
# extract global active power data for y axis
ploty <- as.numeric(hpcsub$Global_active_power)

# creating plot2.png
png("plot2.png", width=480, height=480)
plot(plotx, ploty, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
