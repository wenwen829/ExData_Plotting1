source("LoadFile.R")

PLOT1<-function(data=NULL){
  if (is.null(data)){
    data<-data_load()
    png(file="plot1.png", width = 480, height = 480)
    with(data, hist(Global_active_power,col="red", main="Global Active Power", 
                    xlab="Global Active Power(kilowatts)", ylab="Frequency"))
    dev.off()
  }
}

PLOT1()
