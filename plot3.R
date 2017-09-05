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

#Plot 3
png("plot3.png",width=480,height=480) #Set display to png device
with(my.data,plot(Date,as.numeric(as.character(Sub_metering_1)),type="l",ylab="Energy sub metering",xlab=""))
with(my.data,lines(Date,as.numeric(as.character(Sub_metering_2)),col="red"))
with(my.data,lines(Date,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() #Close device