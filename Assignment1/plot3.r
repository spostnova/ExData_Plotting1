# read the text file
alldata<-read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
#create an array of dates to read
dates<-c("1/2/2007","2/2/2007")
# subset the data for specified dates
datesdata<-subset(alldata[alldata$Date==dates, ])

#combine date and time in one variable
datesdata$DateTime<-paste(datesdata$Date,datesdata$Time)
# convert character variable to datetime class
datesdata$DateTime<-strptime(datesdata$DateTime, format="%d/%m/%Y %H:%M:%S")

# save to png file
png("plot3.png", width=480, height=480)
with(datesdata, plot(DateTime,Sub_metering_1,type="l",col="black", ylab="Energy Sub Metering", xlab=""))
with(datesdata, points(DateTime,Sub_metering_2, type="l", col="red"))
with(datesdata, points(DateTime,Sub_metering_3, type="l",col="blue"))
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1)
dev.off()