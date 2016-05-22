### Graph 2
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

### Create Graph 2
par(mfrow=c(1,1),mar= c(4,4,2,2))
plot(DataTest$index,DataTest$Global_active_power,type ="l",ylab = "Global Active Power(kilowatts)",xlab = "",axes = FALSE,frame.plot = TRUE)
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
axis(2)
dev.copy(png,file="plot2.png")
dev.off()