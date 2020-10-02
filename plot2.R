
#Set language so R doesn't show days in local language
Sys.setlocale("LC_TIME", "English")

#Read data, just 70k rows to save time and memory
data <- read.csv(".\\household_power_consumption.txt", sep = ";",  na.strings = "?", nrows = 70000, header = TRUE)

#Subset of needed dates
data <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")

#Create Datetime from date and time columns
DT <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Open png device
png(filename = ".\\ExData_Plotting1\\plot2.png")

plot(data$Global_active_power~DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""  )

#Close png device
dev.off()
