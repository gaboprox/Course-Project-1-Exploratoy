datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")
sub_power <- datapower[datapower$Date %in% c("1/2/2007","2/2/2007") ,]

date <- strptime(paste(sub_power$Date, sub_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_power$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
