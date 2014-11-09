#Plot 1.

#Read Data
data<-read.csv("./household_power_consumption.txt", na.string="?", sep=";")

#Extract subset data
data<-data[(data$Date =="1/2/2007"| data$Date == "2/2/2007"),]

#Combine Date and Time
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Plot 
png("plot1.png",width=450, height=450)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()