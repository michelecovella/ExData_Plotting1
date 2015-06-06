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

##PLOT 1
png(filename = "plot1.png", width = 480, height = 480)
hist(dfsub$Global_active_power, col="red", main=
      "Global Active Power", xlab="Global Active Power (kilowatts)",
      ylab="Frequency")
dev.off()
