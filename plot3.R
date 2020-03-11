datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")
sub_power <- datapower[datapower$Date %in% c("1/2/2007","2/2/2007") ,]

date <- strptime(paste(sub_power$Date, sub_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_power$Global_active_power)

subMetering1 <- as.numeric(sub_power$Sub_metering_1)
subMetering2 <- as.numeric(sub_power$Sub_metering_2)
subMetering3 <- as.numeric(sub_power$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date, subMetering2, type="l", col="red")
lines(date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()