
#Set language so R doesn't show days in local language
Sys.setlocale("LC_TIME", "English")

#Read data, just 70k rows to save time and memory
data <- read.csv(".\\household_power_consumption.txt", sep = ";",  na.strings = "?", nrows = 70000, header = TRUE)

#Subset of needed dates
data <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")

#Create Datetime from date and time columns
DT <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Open png device
png(filename = ".\\ExData_Plotting1\\plot4.png")

# 2 by 2 plot matrix
par(mfrow=c(2,2))

#Top left
plot(data$Global_active_power~DT, type = "l", ylab = "Global Active Power", xlab = ""  )

#Top right
plot(data$Voltage~DT, type = "l", ylab = "Voltage", xlab = "datetime"  )

#Bottom left
plot(data$Sub_metering_1~DT, type = "l", ylab = "Energy sub metering", xlab = "" )
lines(data$Sub_metering_2~DT, col = "red")
lines(data$Sub_metering_3~DT, col = "blue")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")

#Bottom right
plot(data$Global_reactive_power~DT, type = "l", ylab = "Global_reactive_power", xlab = "datetime"  )

#Close png device
dev.off()

#Back to default
par(mfrow=c(1,1))

