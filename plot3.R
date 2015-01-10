fileName <- 'household_power_consumption.txt'
data <- read.table(file=fileName, sep=";", header=T, na.strings="?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480)

with(data, plot(y=Sub_metering_1, x=datetime, type="n", xlab="", ylab="Energy sub metering"))
with(data, lines(y=Sub_metering_1, x=datetime, col="black"))
with(data, lines(y=Sub_metering_2, x=datetime, col="red"))
with(data, lines(y=Sub_metering_3, x=datetime, col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()