content <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
content$Date <- as.Date(content$Date,"%d/%m/%Y")

Date1 <- as.Date("01-02-2007","%d-%m-%Y")
Date2 <- as.Date("02-02-2007","%d-%m-%Y")

actual_content <- subset(content,Date >= Date1 & Date <= Date2)
temp_content <- actual_content[!is.na(actual_content$Global_active_power),]
png('plot1.png')
hist(temp_content$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()	
