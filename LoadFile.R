LoadFile <- function() {
  filename <- "household_power_consumption.txt"
  if (!file.exists("./data")){dir.create("./data")}
  else if (!file.exists("./data/dataset.zip")){download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                                                           destfile = "./data/dataset.zip", )}
  else if (!file.exists("./data/household_power_consumption.txt")){unzip("./data/dataset.zip", exdir = "./data")}
  else if (!file.exists("./data/selected.csv")){
  dataset <- read.table(filename,
                   header=TRUE,
                   sep=";",
                   colClasses=c("character", "character", rep("numeric",7)),
                   na="?")
  # convert date and time variables to Date/Time class
  dataset$Time <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")
  dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

  # only use data from the dates 2007-02-01 and 2007-02-02
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  dataset <- subset(dataset, Date %in% dates)
  write.csv(dataset,file="./data/selected.csv", row.names = FALSE)
  }
  result<-read.table("./data/selected.csv", sep=",",header=TRUE, na="?",colClasses=c("character", "character", rep("numeric",7)))
  result$Time <- strptime(result$Time, "%Y-%m-%d %H:%M:%S")
  return(result)
}
