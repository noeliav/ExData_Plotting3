#Plot 3.


#Read Data
data<-read.csv("./household_power_consumption.txt", na.string="?", sep=";")

#Extract subset data
data<-data[(data$Date =="1/2/2007"| data$Date == "2/2/2007"),]

#Combine Date and Time
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Plot
png("plot3.png",width=450, height=450)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
points(data$DateTime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()