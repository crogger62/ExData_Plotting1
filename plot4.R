plot4 <- function() {
    
  ## reads file in dates are factors; call out na.strings as question marks
  epc<-read.delim("household_power_consumption.txt", sep=";", na.strings=c("?"))
  epc$Dates<-as.Date(epc$Date,"%d/%m/%Y")       # add a date column
  
  date1<-as.Date("01/02/2007","%d/%m/%Y")
  date2<-as.Date("02/02/2007","%d/%m/%Y")
    
  dates1 <- c(date1,date2)                     # dates we are interested in
                                               # subset dates
  dateRange<-subset(epc,epc$Dates %in% dates1)
  
  # Beginning of plot
  
  png("plot4.png")                            # png device
  library(lubridate)                          # need this for dates
                                              # create a single date+time field
  dt<-paste(dateRange$Date, dateRange$Time)
  plot_dt<-dmy_hms(dt)                        # and convert using lubridate to a format to plot
                                              # convert the Global active power factors to numbers
  gap<-as.numeric(dateRange$Global_active_power) 

# Setup four quadrant graph
  par(mfrow=c(2,2))

# Top Left
  plot(plot_dt,gap,ylab="Global Active Power",type="o",xlab="",pch=NA)  

# Top Right
  plot(plot_dt,dateRange$Voltage,pch=NA, type="o",xlab="datetime",ylab="Voltage")

# bottom left
  plot(plot_dt, dateRange$Sub_metering_1,type="o",col="black",pch=NA,ylab="Energy sub metering",xlab="")
  lines(plot_dt, dateRange$Sub_metering_2,type="o",col="red",pch=NA)
  lines(plot_dt, dateRange$Sub_metering_3,type="o", col="blue",pch=NA)
  legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
# bottom right
  plot(plot_dt,dateRange$Global_reactive_power,type="o",pch=NA,xlab="datetime",ylab="Global_reactive_power")

  dev.off()                                   # close device!
  
}