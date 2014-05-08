### Course Project 1 - Plot 3

# Obtain data neccesary
dataset <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880, col.names=colnames(read.table("household_power_consumption.txt", nrows=1, header=TRUE, sep=";")))
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset$Time <- strptime(dataset$Time, format="%H:%M:%S")

# Set background to "transparent"
par(bg="transparent")
# Set using colors
plot_colors <- c("black", "red", "blue")
# Set number of graphics in the plot (rows, columns)
par(mfrow=c(1, 1))


# Plot a graphics without labels in X axi (xaxt="n")
plot(dataset$Sub_metering_1, xlab="", ylab="Energy sub metering", type="s", xaxt="n", col=plot_colors[1])
lines(dataset$Sub_metering_2, type="s", col=plot_colors[2])
lines(dataset$Sub_metering_3, type="s", col=plot_colors[3])

# Set the labels of X axi in the corresponding position
axis(1, at=c(1, dim(dataset)[1]/2+1, dim(dataset)[1]), labels=c("Thu", "Fri", "Sat"))
# Create a legend
#legend(dim(dataset)[1] - 800, 40, names(dataset[7:9]), col=plot_colors, lty=1, y.intersp=0.5)
legend(x="topright", names(dataset[7:9]), col=plot_colors, lty=1, cex=0.7, y.intersp=0.5)

# Create a PNG file and close the graphic device
dev.copy(png, file="plot3.png")
dev.off()
