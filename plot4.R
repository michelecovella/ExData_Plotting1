### Exploratory Data Analysis Course Project 1 
#Sets weekdays in English Language
Sys.setlocale("LC_TIME", "English")
#set wd
setwd("C:/Users/Michele/Documents/Project1")
#read dataset to df
df<-read.table("household_power_consumption.txt", sep=";", 
header=TRUE, colClasses=c("character"), na.strings="?")
#convert columns 3:9 to numeric class
for (i in 3:9)    {
      df[,i]<-as.numeric(df[,i])
}
#create DateTime variable
df$DateTime<-paste(df$Date, df$Time, sep=" ")
#convert DateTime column to date/time format
df$DateTime<-strptime(df$DateTime, format="%d/%m/%Y %H:%M:%S")
df<-df[,3:10]
#subset to days of interest to dfsub
dfsub<-subset(df, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")

##PLOT 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
#plot4a
plot(dfsub$DateTime, dfsub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
#plot4b
plot(dfsub$DateTime, dfsub$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(dfsub$DateTime, dfsub$Sub_metering_2, col="red")
lines(dfsub$DateTime, dfsub$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4c
plot(dfsub$DateTime, dfsub$Voltage, type="l", xlab="datetime",
     ylab="Voltage")
#plot4d
plot(dfsub$DateTime, dfsub$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")
dev.off()

