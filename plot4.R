DateRange <- c ("1/2/2007",  "2/2/2007" )
dataread <- read.table ( file = "household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE )
DataFrame <- as.data.frame(dataread)
RangeData <- DataFrame[which(DataFrame$Date %in% DateRange),]

RangeData$Global_active_power<- as.numeric(RangeData$Global_active_power)

datetime <- strptime(paste(RangeData$Date, RangeData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

RangeData$Sub_metering_1<- as.numeric(RangeData$Sub_metering_1)
RangeData$Sub_metering_2<- as.numeric(RangeData$Sub_metering_2)
RangeData$Sub_metering_3<- as.numeric(RangeData$Sub_metering_3)
RangeData$Voltage<- as.numeric(RangeData$Voltage)
RangeData$Global_reactive_power<- as.numeric(RangeData$Global_reactive_power)

par(mfrow=c(2,2), mar=c(4,4,2,1))

with(RangeData,{
  plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power",xlab = "")
  plot(datetime,Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering",xlab = "")
  lines(datetime,Sub_metering_2,col='Red')
  lines(datetime,Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), 
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2)
  plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
})
png("plot4.png", width = 480, height = 480)
dev.off()