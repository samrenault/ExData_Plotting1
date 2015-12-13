library(data.table)
hpc <- fread("household_power_consumption.txt", na.strings = "?",data.table=FALSE)
hpc <- subset(hpc, Date == "1/2/2007"|Date == "2/2/2007")
hpc$Time <- strptime(paste0(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")

hist(hpc$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()