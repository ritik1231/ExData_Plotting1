#reading data
datafile <- read.table("./R files/household_power_consumption.txt",header = T , sep=";")

#changing date type
datafile$Date <- as.Date(datafile$Date,format="%d/%m/%Y")

#Subsetting data
subdata <- subset(datafile,datafile$Date == "2007-02-01" | datafile$Date == "2007-02-02")

#changing the type of columns
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

#Plotting the data
png("plot3.png" , height = 480 , width = 480)
plot(subdata$Fulltime,subdata$Sub_metering_1,type = "l",xlab =" ",ylab = "Energy sub metering")
lines(subdata$Fulltime,subdata$Sub_metering_2,type = "l",col = "red")
lines(subdata$Fulltime,subdata$Sub_metering_3,type = "l",col = "blue")
legend("topright" , legend =c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3") , col = c("black" , "red" , "blue") , lwd = 1)
dev.off()
