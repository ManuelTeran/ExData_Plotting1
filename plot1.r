### Graph 1

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

### Create Graph
par(mfrow=c(1,1),mar= c(4,4,2,2))
hist(DataTest$Global_active_power,col=2,main = "Global Active Power",ylab="Fracuency",xlab="Global Active Power (Kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()