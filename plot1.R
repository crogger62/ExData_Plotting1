plot1 <- function() {
    
  ## reads file in dates are factors; call out na.strings as question marks
  epc<-read.delim("household_power_consumption.txt", sep=";", na.strings=c("?"))
  epc$Dates<-as.Date(epc$Date,"%d/%m/%Y")       # add a date column
  
  date1<-as.Date("01/02/2007","%d/%m/%Y")
  date2<-as.Date("02/02/2007","%d/%m/%Y")
    
  dates1 <- c(date1,date2)                     # dates we are interested in
                                               # subset dates
  dateRange<-subset(epc,epc$Dates %in% dates1)
  
  # Beginning of plot
  
  png("plot1.png")
  
  gap<-as.numeric(dateRange$Global_active_power) 
  hist(gap, main="Global Active Power", col="Red",xlab="Global Active Power (kilowatts)")
  
  dev.off()
  
}