#reading data
datafile <- read.table("./R files/household_power_consumption.txt",header = T , sep=";")

#changing date type
datafile$Date <- as.Date(datafile$Date,format="%d/%m/%Y")

#Subsetting data
subdata <- subset(datafile,datafile$Date == "2007-02-01" | datafile$Date == "2007-02-02")

#changing Global_active_power type into numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

#plotting the data into png file
png("plot1.png" , height = 480 ,width = 480)
hist(subdata$Global_active_power,main="Global Active Power",xlab = "Global Active Power(Kilowatts)",col = "red")
dev.off()