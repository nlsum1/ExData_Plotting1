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


# plotting plot1

plot.new() 

par(mfrow = c(1, 1))

plot1 <- hist(subsetData$Global_active_power)

with(subsetData, plot(plot1, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red"))

dev.copy(png, file = "plot1.png")
dev.off() 
