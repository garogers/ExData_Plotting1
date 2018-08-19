setwd("C:/Users/Owner/Documents/Coursera/data/exdata-data-household_power_consumption")

all_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)

plot_data <- subset(all_data, Date %in% c("1/2/2007", "2/2/2007"))

plot_data$Date <- as.Date(plot_data$Date, format = "%d/%m/%Y")

date_time <- paste(as.Date(plot_data$Date), plot_data$Time)

plot_data$Datetime <- as.POSIXct(date_time)

with(plot_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='red')
  lines(Sub_metering_3~Datetime,col='blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
