d <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=F)
d <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]
d$DateTime <- strptime( paste(d$Date, d$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

savepng <- TRUE


if (savepng) png(filename="plot1.png",width=480, height=480, bg="white")
par(mar=c(4.5, 4.5, 2, 1), mfrow=c(1, 1))
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
if (savepng) dev.off()
