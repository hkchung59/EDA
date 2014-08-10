## Working directory setting and dataset reading
setwd("D:\\Exploratory Data Analysis\\Data")
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

## Subsetting the data
dataforgraph <- subset(data_set, subset=c(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates and times
Date_Time <- paste(as.Date(dataforgraph$Date), dataforgraph$Time)
Datetime <- as.POSIXct(Date_Time)
finalData<-cbind(dataforgraph, Datetime)

## Graph for 4 variables
par(mfrow=c(2,2),mar=c(4,3,2,1))
with(finalData, {
        plot(Global_active_power~Datetime, type="l", 
             xlab="",ylab="Global Active Power (kilowatts)", col="Black")
        plot(Voltage~Datetime, type="l", 
             xlab="datetime",ylab="Voltage (volt)", col="Black")
        plot(Sub_metering_1~Datetime, type="l", 
             xlab="",ylab="Global Active Power (kilowatts)", col="Black")
        lines(Sub_metering_2~Datetime,col="Red")
        lines(Sub_metering_3~Datetime,col="Blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col=c("black", "red", "blue"), lty=1, bty="n")
        plot(Global_reactive_power~Datetime, type="l", 
             xlab="datetime",ylab="Global Rective Power (kilowatts)",col="Black")
})

## Saving graph to a png file: plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off

