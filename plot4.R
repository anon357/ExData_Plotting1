## Reconstruct plot 4
## Read data
v <- read.delim("household_power_consumption.txt", sep = ";", 
                header = TRUE, as.is = TRUE, na.strings = "?")

v <- v[which(v$Date %in% c("1/2/2007", "2/2/2007")), ]

png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))
## top left
plot(strptime(paste(v$Date, v$Time, sep = ";"),
              format = "%d/%m/%Y;%H:%M:%S"), 
     v$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")

## top right
plot(strptime(paste(v$Date, v$Time, sep = ";"),
              format = "%d/%m/%Y;%H:%M:%S"), 
     v$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

## bottom left
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
       lty = 1, col = c("black", "red", "blue"),
       bty = "n")

## bottom right
plot(strptime(paste(v$Date, v$Time, sep = ";"),
              format = "%d/%m/%Y;%H:%M:%S"), 
     v$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
