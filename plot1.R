#Assumes data file is in the working directory
all.data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Subset just the data we need
#Get data from 2/1/07
my.data<-subset(all.data, Date=="1/2/2007")
#Append data from 2/2/07
my.data<-rbind(my.data,subset(all.data, Date=="2/2/2007"))

#Plot 1
png("plot1.png",width=480,height=480) #Set display to png device
hist(as.numeric(as.character(my.data$Global_active_power)),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")  
dev.off() #Close device
