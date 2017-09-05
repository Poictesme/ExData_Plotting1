#Assumes data file is in the working directory
all.data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Subset just the data we need
#Get data from 2/1/07
my.data<-subset(all.data, Date=="1/2/2007")
#Append data from 2/2/07
my.data<-rbind(my.data,subset(all.data, Date=="2/2/2007"))

#Convert Date to POSIXct
my.data$Date <- paste(as.character(my.data$Date),as.character(my.data$Time))
my.data$Date<-as.POSIXct(my.data$Date, tz="", "%d/%m/%Y %H:%M:%S")

#Plot 4
png("plot4.png",width=480,height=480) #Set display to png device
par(mfrow=c(2,2))
with(my.data, {
  plot(my.data$Date,as.numeric(as.character(my.data$Global_active_power)),type="l",ylab="Global Active Power",xlab="")
  plot(Date,as.numeric(as.character(Voltage)),type="l",ylab="Voltage",xlab="datetime")
  plot(Date,as.numeric(as.character(Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="")
  lines(Date,as.numeric(as.character(Sub_metering_2)),col="red")
  lines(Date,as.numeric(as.character(Sub_metering_3)),col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Date,as.numeric(as.character(Global_reactive_power)),type="l",ylab="Global_reactive_power",xlab="datetime")
  }
)
dev.off() #Close device