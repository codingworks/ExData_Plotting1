library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
    stringsAsFactors = FALSE) %>% filter(Date %in% c("1/2/2007", "2/2/2007"))
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(datetime, data$Sub_metering_1, type = 'l', col = "black", 
    xlab="", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = 'l', col = "red")
lines(datetime, data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
