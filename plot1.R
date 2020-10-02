

#Read data, just 70k rows to save time and memory
data <- read.csv(".\\household_power_consumption.txt", sep = ";",  na.strings = "?", nrows = 70000, header = TRUE)

#Subset of needed dates
data <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")

#Open png device
png(filename = ".\\ExData_Plotting1\\plot1.png")

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab  = "Global Active Power(kilowatts)")

#Close png device
dev.off()



