##Read the Data

library(dplyr)
if(!file.exists("household_power_consumption.txt")){
        temp<-tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        x<-unzip(temp)
        x<-read.table(x,header=T,sep = ";")
        unlink(temp)
}else {x<-read.table("household_power_consumption.txt",header = T,sep = ";")}

x$Date<-as.Date(x$Date,"%d/%m/%Y")
x<-x[(x$Date=="2007-02-01")|(x$Date=="2007-02-02"),]
x<-mutate(x,timestamp=as.POSIXct(paste(x$Date,x$Time),"%Y-%m-%d %H:%M:%S"))
x$Sub_metering_1<-as.numeric(as.character(x$Sub_metering_1))
x$Sub_metering_2<-as.numeric(as.character(x$Sub_metering_2))
x$Sub_metering_3<-as.numeric(as.character(x$Sub_metering_3))
x$Voltage<-as.numeric(as.character(x$Voltage))
x$Global_reactive_power<-as.numeric(as.character(x$Global_reactive_power))
x$Global_active_power<-as.numeric(as.character(x$Global_active_power))

##Plot graph 3

plot(y=x$Sub_metering_1,x=x$timestamp,type = "l",xlab = "",ylab = "Energy sub metering")
lines(x$timestamp,x$Sub_metering_2,col="red")
lines(x$timestamp,x$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1),lwd = c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()