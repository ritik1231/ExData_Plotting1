#reading data
datafile <- read.table("./R files/household_power_consumption.txt",header = T , sep=";")

#changing date type
datafile$Date <- as.Date(datafile$Date,format="%d/%m/%Y")

#Subsetting data
subdata <- subset(datafile,datafile$Date == "2007-02-01" | datafile$Date == "2007-02-02")

#changing Global_active_power type into numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

#Adding a column in data having values of date and time combined
Fulltime <- strptime(paste(subdata$Date,subdata$Time , sep =" ") ,format = "%Y-%m-%d %H:%M:%S" )
subdata <- cbind(subdata,Fulltime)

#plotting the data
png("plot2.png" , height = 480 ,width = 480)
plot(subdata$Fulltime,subdata$Global_active_power,type = "l",xlab =" ",ylab = "Global Active Power (Kilowatts)")
dev.off()