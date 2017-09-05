#Assumes data file is in the working directory
all.data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Subset just the data we need
#Get data from 2/1/07
my.data<-subset(all.data, Date=="1/2/2007")
#Append data from 2/2/07
my.data<-rbind(my.data,subset(all.data, Date=="2/2/2007"))

#Plot 2
png("plot2.png",width=480,height=480) #Set display to png device
my.data$Date <- paste(as.character(my.data$Date),as.character(my.data$Time))
my.data$Date<-as.POSIXct(my.data$Date, tz="", "%d/%m/%Y %H:%M:%S")
plot(my.data$Date,as.numeric(as.character(my.data$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off() #Close device