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
#Plot graph with R Base plotting system using debuged data
plot(debug_data$Sub_metering_1~debug_data$Date_time, type="l", ylab="Energy sub metering", xlab="")
lines(debug_data$Sub_metering_2~debug_data$Date_time,col='Red')
lines(debug_data$Sub_metering_3~debug_data$Date_time,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off()
