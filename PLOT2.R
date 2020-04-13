source("LoadFile.R")

plot2 <- function(data=NULL) {
  if(is.null(data))
    data <- LoadFile()
  
  png("plot2.png", width=480, height=480)
  
  plot(data$Time, data$Global_active_power,
       type="l",
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
}

plot2()
