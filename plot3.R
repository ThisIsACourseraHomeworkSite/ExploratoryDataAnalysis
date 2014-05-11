# open data and label
classes = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
power = read.table(file = "household_power_consumption.csv", sep = ';', colClasses = classes, header= TRUE, na.strings="?")

# use only data for dates 2007-02-01 and 2007-02-02
pow = power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
pow$datetime =  strptime(paste(pow$Date, pow$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Plot 3
par(mfrow = c(1,1))
plot(pow$datetime, pow$Sub_metering_1, xlab="", ylab = "Energy sub metering", col="#ffffff")
lines(pow$datetime, pow$Sub_metering_1, col = "black")
lines(pow$datetime, pow$Sub_metering_2, col = "red")
lines(pow$datetime, pow$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lwd = c(2, 2, 2), col=c("black", "red", "blue"), cex = 1.5,
       lty = c(1,1,1))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
