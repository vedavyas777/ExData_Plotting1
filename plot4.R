content <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
content$Date <- as.Date(content$Date,"%d/%m/%Y")

D1 <- as.Date("01-02-2007","%d-%m-%Y")
D2 <- as.Date("02-02-2007","%d-%m-%Y")

actual_content <- subset(content,Date >= D1 & Date <= D2)
actual_content$days <- weekdays(actual_content$Date)
possible_days <- factor(actual_content[,"days"])
thurs <- length(possible_days[possible_days == "Thursday"])
fri <-  length(possible_days[possible_days == "Friday"])

png('plot4.png')

par(mfrow = c(2,2))
plot(actual_content$Global_active_power, type='l', xaxt='n',ylab="Global Active Power (Kilowatts)",xlab="")
axis(1, at=c(1, thurs,thurs+fri), labels=c("Thu", "Fri","Sat"))
plot(actual_content$Voltage, type='l',ylab="Voltage",xlab="datetime",xaxt='n')
axis(1, at=c(1, thurs,thurs+fri), labels=c("Thu", "Fri","Sat"))
plot(actual_content$Sub_metering_1, type='l', col="black",xaxt="n",ylab="Energy sub metering",xlab="")
lines(actual_content$Sub_metering_2,col="red",xaxt="n")
lines(actual_content$Sub_metering_3, type='l', col="blue",xaxt="n")
plot_colors <- c("black", "red", "blue")
legend(x = "topright",legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n",lwd = 1, col=plot_colors,lty = c(1, 1, 1), pch = c(NA,NA,NA))
axis(1, at=c(1, thurs,thurs+fri), labels=c("Thu", "Fri","Sat"))
plot(actual_content$Global_reactive_power, type='l',ylab="Global_reactive_power",xlab="datetime",xaxt='n')
axis(1, at=c(1, thurs,thurs+fri), labels=c("Thu", "Fri","Sat"))

dev.off()
