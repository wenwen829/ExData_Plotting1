# setwd("C:/Users/pc/Dropbox/JHUdatascience/Rcode/3-exploratorydataanalysis/Peer-graded-Assignment-1-Exploratory-Data-Analysis")
# View(Data)
# View(selected)
# tail(selected)
data_load<-function(){
  if (!file.exists("./data")){dir.create("./data")}
  if (!file.exists("./data/dataset.zip")){download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                                                        destfile = "./data/dataset.zip")}
  if (!file.exists("./data/household_power_consumption.txt")){
    unzip("./data/dataset.zip", exdir = "./data")}
  Data = read.table("./data/household_power_consumption.txt", header = TRUE,  sep= ";" , 
                    na.strings = c('?', 'NA', '<NA>'),  blank.lines.skip = TRUE)
  Data$Time<-strptime(paste(Data$Date,Data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
  Data$Date<-as.Date(Data$Date,"%d/%m/%Y")
  
  period<-as.Date(c("2007-02-01", "2007-02-02"),"%Y-%m-%d")
  selected<-subset(Data, Date %in% period)
}