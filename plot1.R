setwd("C:/Users/Owner/Documents/Coursera/data/exdata-data-household_power_consumption")

all_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)

plot_data <- subset(all_data, Date %in% c("1/2/2007", "2/2/2007"))

plot_data$Date <- as.Date(plot_data$Date, format = "%d/%m/%Y")

hist(plot_data$Global_active_power, main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

png("plot1.png", width=480, height=480)
dev.off()