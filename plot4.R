## load data
source('./util.R')
downloadProject1File()
data = read.csv(file = './household_power_consumption.txt', sep = ';', na.strings = '?', stringsAsFactors = F)
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$DateTime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## start plot
png('plot4.png', width=480, height=480, res=120)
par(mfrow = c(2, 2),
    mar=c(4.5,4.5,0.5,0.5),
    cex=0.5)
with(data, plot(x = DateTime, y = Global_active_power, type = 'l', ylab = 'Global Active Power(kilowatts)', xlab = '' ))
with(data, plot(x = DateTime, y = Voltage, type = 'l'))
with(data, { 
  plot(x = DateTime, y = Sub_metering_1 , type = 'l', ylab = 'Energy sub metering', xlab = '' ) 
  lines(x = DateTime, y = Sub_metering_2, col='red')
  lines(x = DateTime, y = Sub_metering_3, col='blue')
  legend("topright", lty=c(1,1),  col=c("black", "red", "blue"), legend = c("Sub metering 1","Sub metering 2","Sub metering 3"), cex = 0.8, bty = "n")
})
with(data, plot(x = DateTime, y = Global_reactive_power, type = 'l'))
dev.off()