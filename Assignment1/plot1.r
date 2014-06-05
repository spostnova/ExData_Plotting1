# read the text file
alldata<-read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#create an array of dates to read
dates<-c("1/2/2007","2/2/2007")

# subset the data for specified dates
datesdata<-subset(alldata[alldata$Date==dates, ])

#save plot to png file
png("plot1.png", width=480, height=480)
hist(datesdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
