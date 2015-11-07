
# plot4.R Creates multiple graphs on same PNG

# We assume data is placed in the working directory
# using first row as header
# Na string is '?'
Rdata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,
                    header = TRUE, sep=';', na.strings = "?")

# Subsetting: using data from the dates 2007-02-01 and 2007-02-02
Rdata$Date <- as.Date(Rdata$Date, "%d/%m/%Y")
Rdata <- Rdata[Rdata$Date>="2007-02-01"&Rdata$Date<="2007-02-02",]
#convert time using exact days
Rdata$Time <- strptime(sprintf("%s %s", Rdata$Date,Rdata$Time), format = "%Y-%m-%d %H:%M:%S")

# create the graphic device for png
png(filename = "plot4.png", height=480, width=480)
par(mfrow=c(2,2))

#(1,1)
plot(x=Rdata$Time, y=Rdata$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = 'l')

#(1,2)
plot(x=Rdata$Time, y=Rdata$Voltage, xlab = "datetime", ylab = "Voltage", type = 'l')

#(2,1) plot 3 differents lines with same x without Xlabel
plot(x=Rdata$Time, y=Rdata$Sub_metering_1, col = 'black',
     ylab = "Energy sub metering", type = 'l', xlab = "")
lines(x=Rdata$Time, y=Rdata$Sub_metering_2, col = 'red')
lines(x=Rdata$Time, y=Rdata$Sub_metering_3, col = 'blue')
# add legend without border line
legend("topright", legend = sprintf("Sub_metering_%d", 1:3), bty = "n",
       col = c('black',"red","blue"), lty=c(1,1,1))

#(2,2)
plot(x=Rdata$Time, y=Rdata$Global_reactive_power,  xlab = "datetime",
     ylab = "Global_reactive_power", type = 'l')

#close gaph
dev.off()


