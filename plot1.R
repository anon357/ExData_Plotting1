## Reconstruct plot 1
## Read data
v <- read.delim("household_power_consumption.txt", sep = ";", 
                header = TRUE, as.is = TRUE, na.strings = "?")

v <- v[which(v$Date %in% c("1/2/2007", "2/2/2007")), ]

png("plot1.png", height = 480, width = 480)
hist(v$Global_active_power, main = "Global Active Power",
     col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
