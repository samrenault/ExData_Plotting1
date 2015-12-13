library(data.table)
hpc <- fread("household_power_consumption.txt", na.strings = "?",data.table=FALSE)
hpc <- subset(hpc, Date == "1/2/2007"|Date == "2/2/2007")
hpc$Time <- strptime(paste0(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
# we use a 2 x 2 plot grid
par(mfcol=c(2,2))

# first plot 
with(hpc, plot(Time,Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="n"))
with(hpc, lines(Time,Global_active_power))
# second plot
with(hpc, plot(Time,Sub_metering_1, ylab = "Energy Sub Metering", xlab="",type="n"))
with(hpc, lines(Time,Sub_metering_1))
with(hpc, lines(Time,Sub_metering_2, col ="red"))
with(hpc, lines(Time,Sub_metering_3, col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("black","red","blue"))
# third plot
with(hpc, plot(Time,Voltage,xlab="datetime",type="n"))
with(hpc, lines(Time,Voltage))
# fouth plot
with(hpc, plot(Time,Global_reactive_power,xlab="datetime",type="n"))
with(hpc, lines(Time,Global_reactive_power))
# png output
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()