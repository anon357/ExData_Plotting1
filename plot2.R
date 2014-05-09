## Reconstruct plot 2
## Read data
v <- read.delim("household_power_consumption.txt", sep = ";", 
                header = TRUE, as.is = TRUE, na.strings = "?")

v <- v[which(v$Date %in% c("1/2/2007", "2/2/2007")), ]

png("plot2.png", height = 480, width = 480)
plot(strptime(paste(v$Date, v$Time, sep = ";"),
              format = "%d/%m/%Y;%H:%M:%S"), 
     v$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
