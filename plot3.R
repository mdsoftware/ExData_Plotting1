d <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=F)
d <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]
d$DateTime <- strptime( paste(d$Date, d$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

savepng <- TRUE

if (savepng) png(filename="plot3.png",width=480, height=480, bg="white")

par(mar=c(3, 4.5, 1, 1), mfrow=c(1, 1))

plot(d$DateTime, d$Sub_metering_1, type="l", lwd=1.5, col="black", main = NULL, 
     xlab="", ylab='Energy sub metering')
lines(d$DateTime, d$Sub_metering_2, type="l", lwd=1.5, col="red")
lines(d$DateTime, d$Sub_metering_3, type="l", lwd=1.5, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), 
       lwd = 2, lty=1, pch=NA)

if (savepng) dev.off()
