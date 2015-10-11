library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
    stringsAsFactors = FALSE) %>% filter(Date %in% c("1/2/2007", "2/2/2007"))
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(datetime, as.numeric(data$Global_active_power), 
    type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
