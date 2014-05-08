d <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=F)
d <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]
d$DateTime <- strptime( paste(d$Date, d$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

savepng <- TRUE


linew <- 1.5

if (savepng) png(filename="plot4.png",width=480, height=480, bg="white")

par(mar=c(4.5, 4.5, 1, 1), mfrow=c(2, 2))

plot(d$DateTime, d$Global_active_power, type="l", lwd=linew, col="black", main = NULL, 
     xlab="", ylab='Global Active Power (kilowatts)')

plot(d$DateTime, d$Voltage, type="l", lwd=linew, col="black", main = NULL, 
     xlab="datetime", ylab='Voltage')

plot(d$DateTime, d$Sub_metering_1, type="l", lwd=linew, col="black", main = NULL, 
     xlab="", ylab='Energy sub metering')
lines(d$DateTime, d$Sub_metering_2, type="l", lwd=linew, col="red")
lines(d$DateTime, d$Sub_metering_3, type="l", lwd=linew, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), 
       lwd = 2, lty=1, pch=NA, bty="n")

plot(d$DateTime, d$Global_reactive_power, type="l", lwd=linew, col="black", main = NULL, 
     xlab="datetime", ylab='Global_reactive_power')

if (savepng) dev.off()

