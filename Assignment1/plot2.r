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

# save plot to png file 
png("plot2.png", width=480, height=480)
with(datesdata, plot(DateTime,Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()