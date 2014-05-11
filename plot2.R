# open data and label
classes = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
power = read.table(file = "household_power_consumption.csv", sep = ';', colClasses = classes, header= TRUE, na.strings="?")

# use only data for dates 2007-02-01 and 2007-02-02
pow = power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
pow$datetime =  strptime(paste(pow$Date, pow$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Plot 2
par(mfrow = c(1,1))
plot(pow$datetime, pow$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", col="#ffffff")
lines(pow$datetime, pow$Global_active_power)
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
