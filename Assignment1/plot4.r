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

#save to png file
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
# panel 1
with(datesdata, plot(DateTime,Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab=""))
# panel 2
with(datesdata, plot(DateTime,Sub_metering_1,type="l",col="black", ylab="Energy Sub Metering",xlab=""))
with(datesdata, points(DateTime,Sub_metering_2, type="l", col="red"))
with(datesdata, points(DateTime,Sub_metering_3, type="l",col="blue"))
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1)
# panel 3
with(datesdata, plot(DateTime,Voltage, type="l",ylab="Voltage"))
# panel 4
with(datesdata, plot(DateTime,Global_reactive_power, type="l"))
dev.off()