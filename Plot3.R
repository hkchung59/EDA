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

## Line graph with legend
with(finalData, {
        plot(Sub_metering_1~Datetime, type="l",
             xlab="",ylab="Global Active Power (kilowatts)", col="Black")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="o")

## Saving graph to a png file: plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

?legend
