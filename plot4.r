#Plot 4.

#Read Data
data<-read.csv("./household_power_consumption.txt", na.string="?", sep=";")

#Extract subset data
data<-data[(data$Date =="1/2/2007"| data$Date == "2/2/2007"),]

#Combine Date and Time
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Plot 
png("plot4.png",width=450, height=450)
par(mfrow = c(2, 2))

plot(data$DateTime, data$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power")

plot(data$DateTime, data$Voltage, type = "l",xlab = "datetime", ylab = "Voltage")

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(data$DateTime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(data$DateTime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )

plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()