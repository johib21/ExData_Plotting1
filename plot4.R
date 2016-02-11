##plot4
par(mfrow=c(2,2))
plot(x = x$timestamp,y=x$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")
plot(x=x$timestamp,y=x$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
plot(y=x$Sub_metering_1,x=x$timestamp,type = "l",xlab = "",ylab = "Energy sub metering")
lines(x$timestamp,x$Sub_metering_2,col="red")
lines(x$timestamp,x$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       +lty = c(1,1),lwd = c(1,1))
plot(x=x$timestamp,y=x$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
