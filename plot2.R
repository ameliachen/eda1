source("plot2.R")
filename<-"household_power_consumption.txt"

colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering1", "sub_metering2", "sub_metering3")
colClasses = c("character", "character", rep("numeric",7) )

data <- read.table(filename, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

data$date <- as.Date(data$date, format="%d/%m/%Y")
data <-  data[data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02"),]

png(filename="plot2.png", width=480, height=480, units="px",bg="transparent")
with(data,{
  plot(global_active_power, type="l",xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
})
axis(1, at=c(1, length(data$date)/2, length(data$date)), labels=c("Thu", "Fri", "Sat"))
dev.off()