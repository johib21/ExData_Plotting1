plot(y=x$Sub_metering_1,x=x$timestamp,type = "l",xlab = "",ylab = "Energy sub metering")
lines(x$timestamp,x$Sub_metering_2,col="red")
lines(x$timestamp,x$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       +lty = c(1,1),lwd = c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()