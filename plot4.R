source("plot4.R")
filename<-"household_power_consumption.txt"

colNames <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering1", "sub_metering2", "sub_metering3")
colClasses = c("character", "character", rep("numeric",7) )

data <- read.table(filename, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

data$date <- as.Date(data$date, format="%d/%m/%Y")
data <-  data[data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02"),]

png(filename="plot4.png", width=480, height=480, units="px",bg="transparent")

par(mfrow=c(2,2))


with(data,{
  plot(global_active_power, type="l",xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
})
axis(1, at=c(1, length(data$date)/2, length(data$date)), labels=c("Thu", "Fri", "Sat"))


plot(data$voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, length(data$date)/2, length(data$date)), labels=c("Thu", "Fri", "Sat"))


with(data, {
  plot(sub_metering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(sub_metering2, col="red")
  lines(sub_metering3, col="blue")
})
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
axis(1, at=c(1, length(data$date)/2, length(data$date)), labels=c("Thu", "Fri", "Sat"))


plot(data$global_reactive_power, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, length(data$date)/2, length(data$date)), labels=c("Thu", "Fri", "Sat"))
dev.off()