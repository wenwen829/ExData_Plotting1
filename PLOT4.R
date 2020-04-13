source("LoadFile.R")

plot4 <- function(data=NULL) {
  if(is.null(data))
    data <- LoadFile()
  
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  # plot one
  plot(data$Time, data$Global_active_power,
       type="l",
       ylab="Global Active Power (kilowatts)")
  # plot two
  with(data, plot(Time, Voltage, type="l", xlab="datetime"))
  # plot three
  with(data, plot(Time, Sub_metering_1,type="l",ylab="Energy sub metering"))
  with(data, lines(Time, Sub_metering_2,type="l",col="red"))
  with(data, lines(Time, Sub_metering_3,type="l",col="blue"))
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"), lty=1, bty="n")
  # plot four
  with(data,plot(Time, Global_reactive_power,type="l"))
  dev.off()
}

plot4()