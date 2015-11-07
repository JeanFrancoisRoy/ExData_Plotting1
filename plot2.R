
# plot2.R Creates daily summary for Global Active Power Graph

# We assume data is placed in the working directory
# using first row as header
# Na string is '?'
Rdata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,
                    header = TRUE, sep=';', na.strings = "?")

# Subsetting: using data from the dates 2007-02-01 and 2007-02-02
Rdata$Date <- as.Date(Rdata$Date, "%d/%m/%Y")
Rdata <- Rdata[Rdata$Date>="2007-02-01"&Rdata$Date<="2007-02-02",]
#convert time using days
Rdata$Time <- strptime(sprintf("%s %s", Rdata$Date,Rdata$Time), format = "%Y-%m-%d %H:%M:%S")

# create the graphic device for png
png(filename = "plot2.png", height=480, width=480)

plot(x=Rdata$Time, y=Rdata$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = 'l')

#close gaph
dev.off()

