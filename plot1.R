DateRange <- c ("1/2/2007",  "2/2/2007" )
dataread <- read.table ( file = "household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE )
DataFrame <- as.data.frame(dataread)
RangeData <- DataFrame[which(DataFrame$Date %in% DateRange),]
RangeData$Time <- strptime(do.call(paste0,RangeData[c(1,2)]), "%d/%m/%Y%H:%M:%S")
RangeData$Date <- as.Date(RangeData$Date, "%d/%m/%Y")
hist (as.numeric(RangeData$Global_active_power), col= "red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()