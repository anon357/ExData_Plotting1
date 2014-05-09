## Reconstruct plot 3
## Read data
v <- read.delim("household_power_consumption.txt", sep = ";", 
                header = TRUE, as.is = TRUE, na.strings = "?")

v <- v[which(v$Date %in% c("1/2/2007", "2/2/2007")), ]

png("plot3.png", height = 480, width = 480)
plot(strptime(paste(v$Date, v$Time, sep = ";"),
              format = "%d/%m/%Y;%H:%M:%S"), 
     v$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering", col = "black", 
     ylim = range(v[, c("Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3")]))
lines(strptime(paste(v$Date, v$Time, sep = ";"),
               format = "%d/%m/%Y;%H:%M:%S"), 
      v$Sub_metering_2, col = "red")
lines(strptime(paste(v$Date, v$Time, sep = ";"),
               format = "%d/%m/%Y;%H:%M:%S"), 
      v$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", 
                              "Sub_metering_2",
                              "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))
dev.off()
