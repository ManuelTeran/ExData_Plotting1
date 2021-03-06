### Graph 4
household<-read.csv2("household_power_consumption.txt")
household2<-household[which (household$Date == '2/2/2007' | household$Date == '1/2/2007'),]
DataTest<- as.data.frame(cbind(index = seq(1:2880),
                               Global_active_power=  as.numeric(as.character(household2$Global_active_power)),
                               Global_reactive_power=  as.numeric(as.character(household2$Global_reactive_power)),
                               Voltaje = as.numeric(as.character(household2$Voltage)),
                               Sub_metering_1 = as.numeric(as.character(household2$Sub_metering_1)),
                               Sub_metering_2 = as.numeric(as.character(household2$Sub_metering_2)),
                               Sub_metering_3 = as.numeric(as.character(household2$Sub_metering_3))
))


### Create Graph 4

par(mfrow=c(2,2),mar= c(4,4,2,1))

plot(DataTest$index,DataTest$Global_active_power,type ="l",ylab = "Global Active Power(kilowatts)",xlab = "",axes = FALSE,frame.plot = TRUE)
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
axis(2)

plot(DataTest$index,DataTest$Voltaje,type = "l",ylab = "Voltaje", xlab = "datetime",axes = FALSE,frame.plot = TRUE)
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
axis(2)

plot(DataTest$index,DataTest$Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "",axes = FALSE,frame.plot = TRUE)
lines(DataTest$index,DataTest$Sub_metering_2,col=2)
lines(DataTest$index,DataTest$Sub_metering_3,col=4)
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
axis(2)
legend("topright",legend = c("sub metering 1","sub metering 2","sub metering 3"),pch = "-",col = c(1,2,4))

plot(DataTest$index,DataTest$Global_reactive_power,type ="l",ylab = "Global reactive Power",xlab = "",axes = FALSE,frame.plot = TRUE)
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
axis(2)

dev.copy(png,file="plot4.png")
dev.off()
