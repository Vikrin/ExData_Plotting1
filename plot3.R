data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%y")

data <- subset(data_full, subset=(Date >= "2020-02-01" & Date <= "2020-02-02"))
rm(data_full)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, {
    plot(Datetime,Sub_metering, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Datetime,Sub_metering_2,col='Red')
    lines(Datetime,Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
