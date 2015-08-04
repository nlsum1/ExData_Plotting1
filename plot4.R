library(datasets)
# Read table from txt
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

#convert the value in Date column into Date

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subsetData <- data[which(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")),]

#Created a new column to store Date and Time
subsetData$DateTime <- paste(subsetData$Date, subsetData$Time, sep=" ")
subsetData$DateTime <- strptime(subsetData$DateTime, format="%Y-%m-%d %H:%M:%S")

#Convert character to numeric
subsetData$Global_active_power<- as.numeric(subsetData$Global_active_power)

#plotting plot4
plot.new()

par(mfrow = c(2, 2))

with(subsetData, {
  plot(subsetData$DateTime,subsetData$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(subsetData$DateTime,subsetData$Voltage,type="l", xlab="", ylab="Voltage")
  plot( subsetData$DateTime, subsetData$Sub_metering_1, type="l", xlab= "", ylab="Energy sub metering")
  lines(subsetData$DateTime,subsetData$Sub_metering_2,col="red")
  lines(subsetData$DateTime,subsetData$Sub_metering_3,col="blue")
  legend("top", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.6)  
  plot(subsetData$DateTime,subsetData$Global_reactive_power,type="l", xlab="", ylab="Global_reactive_power")
  })

dev.copy(png, file = "plot4.png")
dev.off() 