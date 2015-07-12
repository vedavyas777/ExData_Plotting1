content <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
content$Date <- as.Date(content$Date,"%d/%m/%Y")

d1 <- as.Date("01-02-2007","%d-%m-%Y")
d2 <- as.Date("02-02-2007","%d-%m-%Y")

actual_content <- subset(content,Date >= d1 & Date <= d2)
actual_content$days <- weekdays(actual_content$Date)
possible_days <- factor(actual_content[,"days"])
thurs <- length(possible_days[possible_days == "Thursday"])
fri <-  length(possible_days[possible_days == "Friday"])

png('plot2.png')
plot(actual_content$Global_active_power, type='l', xaxt='n',ylab="Global Active Power (Kilowatts)",xlab="")
axis(1, at=c(1, thurs,thurs+fri), labels=c("Thu", "Fri","Sat"))
dev.off()
