library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
    stringsAsFactors = FALSE) %>% filter(Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png")

hist(as.numeric(data$Global_active_power), main = "Global Active Power", 
    col = 'red', xlab = "Global Active Power (kilowatts)")

dev.off()
