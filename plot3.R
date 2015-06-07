#Read the full amount of data, could not figure out how to filter while reading
Power <- read.table("./data/household_power_consumption.txt", header=TRUE,sep = ";", na.strings = "?",stringsAsFactors=FALSE)

#Combine the Date and Time Fields and convert to Date
Power$DateTime_str <- paste(Power$Date, Power$Time)
Power$DateTime <- as.POSIXlt(Power$DateTime_str, format = "%d/%m/%Y %H:%M:%S")

#Subset the required dates of 1 February 2007 00:00:00 - 2 February 2007 23:59:59
targetData <- subset(Power, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))

#open the png device and create plot in working directory
png(file = "plot3.png") 

## Create Create chart
plot(targetData$DateTime, targetData$Sub_metering_1, 
   type="n",
   ylab="Energy sub metering",
   xlab="")
points(targetData$DateTime, targetData$Sub_metering_1, type="l",col="black")
points(targetData$DateTime, targetData$Sub_metering_2, type="l",col="red")
points(targetData$DateTime, targetData$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))

#close the file
dev.off()

