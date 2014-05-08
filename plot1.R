### Course Project 1 - Plot 1

# Obtain data neccesary
dataset <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, col.names=colnames(read.table("household_power_consumption.txt", nrows=1, header=TRUE, sep=";")))
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset$Time <- strptime(dataset$Time, format="%H:%M:%S")

# Set background to "transparent"
par(bg="transparent")
# Set number of graphics in the plot (rows, columns)
par(mfrow=c(1, 1))

hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")

# Create a PNG file and close the graphic device
dev.copy(png, file="plot1.png")
dev.off()
