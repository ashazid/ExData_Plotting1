# reading in the data
hpc <- read.table("household_power_consumption.txt", header = T, sep=';', stringsAsFactors = F, na.strings = '?')

# subsetting the data
hpcsub <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]

# extracting data to be plotted
plotd <- as.numeric(hpcsub$Global_active_power)

# creating the plot plot1.png
png("plot1.png", width=480, height=480)
hist(plotd, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
