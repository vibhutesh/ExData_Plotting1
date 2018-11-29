DateRange <- c ("1/2/2007",  "2/2/2007" )
dataread <- read.table ( file = "household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE )
DataFrame <- as.data.frame(dataread)
RangeData <- DataFrame[which(DataFrame$Date %in% DateRange),]

RangeData$Global_active_power<- as.numeric(RangeData$Global_active_power)

datetime <- strptime(paste(RangeData$Date, RangeData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetime,RangeData$Global_active_power,type = "l", ylab = "Global Active Power(kilowatts)", xlab ="")

png("plot2.png", width = 480, height = 480)

dev.off()