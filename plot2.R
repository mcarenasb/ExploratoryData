#Dataset has been renamed like "data.txt"
#The length of dataset is 2075260
#Please set your working directory: setwd("~/.../folder/")
setwd("~/Documents/project-r_Cris/dataset")
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
plot(debug_data$Global_active_power~debug_data$Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()
