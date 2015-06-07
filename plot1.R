source("plot1.R")
filename<-"household_power_consumption.txt"

colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering1", "sub_metering2", "sub_metering3")
colClasses = c("character", "character", rep("numeric",7) )

data <- read.table(filename, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")
data$date <- as.Date(data$date, format="%d/%m/%Y")
data<-  data[data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02"),]

png(filename="plot1.png", width=480, height=480, units="px", bg="transparent")
hist(data$global_active_power, col="red",  xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
