
# plot3.R Creates daily summaries for Energy sub metering

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
png(filename = "plot3.png", height=480, width=480)

#plot 3 differents lines with same x without Xlabel
plot(x=Rdata$Time, y=Rdata$Sub_metering_1, col = 'black',
     ylab = "Energy sub metering", type = 'l', xlab = "")
lines(x=Rdata$Time, y=Rdata$Sub_metering_2, col = 'red')
lines(x=Rdata$Time, y=Rdata$Sub_metering_3, col = 'blue')

# add legend with a border line
legend("topright", legend = sprintf("Sub_metering_%d", 1:3),
       col = c('black',"red","blue"), lty=c(1,1,1), bty = "y")

#close gaph
dev.off()


