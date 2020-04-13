source("LoadFile.R")

plot3 <- function(data=NULL) {
  if(is.null(data))
    data <- LoadFile()
  
  png("plot3.png", width=480, height=480)
  
  with(data, plot(Time, Sub_metering_1,type="l",ylab="Energy sub metering"))
  with(data, lines(Time, Sub_metering_2,type="l",col="red"))
  with(data, lines(Time, Sub_metering_3,type="l",col="blue"))
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"), lty=1)
  dev.off()
}

plot3()
