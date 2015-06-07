#Read the full amount of data, could not figure out how to filter while reading
Power <- read.table("./data/household_power_consumption.txt", header=TRUE,sep = ";", na.strings = "?",stringsAsFactors=FALSE)

#Combine the Date and Time Fields and convert to Date
Power$DateTime_str <- paste(Power$Date, Power$Time)
Power$DateTime <- as.POSIXlt(Power$DateTime_str, format = "%d/%m/%Y %H:%M:%S")

#Subset the required dates of 1 February 2007 00:00:00 - 2 February 2007 23:59:59
targetData <- subset(Power, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))

#open the png device and create plot in working directory
png(file = "plot2.png") 

## Create Create chart
with(targetData,
     (plot(DateTime, Global_active_power, 
           type="l", 
           ylab="Global Active Power (kilowatts)",
           xlab=""
           )))

#close the file
dev.off()


