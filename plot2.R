fileName <- 'household_power_consumption.txt'
data <- read.table(file=fileName, sep=";", header=T, na.strings="?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480)

with(data, plot(y=Global_active_power, x=datetime, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(data, lines(y=Global_active_power, x=datetime))

dev.off()