### Course Project 1 - Plot 2

# Obtain data neccesary
dataset <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, col.names=colnames(read.table("household_power_consumption.txt", nrows=1, header=TRUE, sep=";")))
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset$Time <- strptime(dataset$Time, format="%H:%M:%S")

# Set background to "transparent"
par(bg="transparent")
# Set number of graphics in the plot (rows, columns)
par(mfrow=c(1, 1))

# Plot a graphics without labels in X axi (xaxt="n")
plot(dataset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l", xaxt="n")

# Set the labels of X axi in the corresponding position
axis(1, at=c(1, dim(dataset)[1]/2+1, dim(dataset)[1]), labels=c("Thu", "Fri", "Sat"))

# Create a PNG file and close the graphic device
dev.copy(png, file="plot2.png")
dev.off()
