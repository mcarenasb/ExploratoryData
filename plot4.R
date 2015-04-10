#Dataset has been renamed like "data.txt"
#The length of dataset is 2075260
#Please set your working directory: setwd("~/.../folder/")
#Import data
data = read.csv("data.txt", sep=';', na.strings="?", nrows=2075259, comment.char="#", quote='\"')
#Date format convert for subset query
data$Date = as.Date(data$Date, format="%d/%m/%Y")
#Query set data
debug_data = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#Link date and time var in as datetime objet
date_with_time <- paste(as.Date(debug_data$Date), debug_data$Time)
debug_data$Date_time <- as.POSIXct(date_with_time)
#Margin setting
par(oma=c(0,2,0,0))
#Plot split screen device into 4 parts (2x2)
par(mfrow=c(2,2))
#Plot1 in first place
plot(debug_data$Global_active_power~debug_data$Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Plot Voltage ~ Date with time in secound place
plot(debug_data$Voltage~debug_data$Date_time, type="l", ylab="Voltage", xlab="datetime")
#Plot2 in third place
plot(debug_data$Sub_metering_1~debug_data$Date_time, type="l", ylab="Energy sub metering", xlab="")
lines(debug_data$Sub_metering_2~debug_data$Date_time,col='Red')
lines(debug_data$Sub_metering_3~debug_data$Date_time,col='Blue')
#PLot Global reactive power with date time in fourth place
plot(debug_data$Global_reactive_power~debug_data$Date_time, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file="plot4.png")
dev.off()
