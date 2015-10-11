library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
    stringsAsFactors = FALSE) %>% filter(Date %in% c("1/2/2007", "2/2/2007"))
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow = c(2, 2))

hist(as.numeric(data$Global_active_power), 
    main = "Global Active Power", 
    col = 'red', xlab = "Global Active Power (kilowatts)")

plot(datetime, data$Voltage, type = 'l', ylab = "Voltage")

plot(datetime, data$Sub_metering_1, type = 'l', col = "black", 
    xlab="", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, type = 'l', col = "red")
lines(datetime, data$Sub_metering_3, type = 'l', col = "blue")
legend("topright", lty = 1, bty = 'n', col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, data$Global_reactive_power, type = 'l', ylab = "Global_reactive_power")

dev.off()
