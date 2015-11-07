
# plot1.R Creates Histogram for Global Active Power Graph

# We assume data is placed in the working directory
# using first row as header
# Na string is '?'
Rdata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,
                      header = TRUE, sep=';', na.strings = "?")

Rdata$Date <- as.Date(Rdata$Date, "%d/%m/%Y")
# using data from the dates 2007-02-01 and 2007-02-02
Rdata <- Rdata[Rdata$Date>="2007-02-01"&Rdata$Date<="2007-02-02",]


# create the graphic device for png
png(filename = "plot1.png", height=480, width=480)

#create the histogram with labels
hist(Rdata$Global_active_power, col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     breaks = 12)

#close histogram
dev.off()

      