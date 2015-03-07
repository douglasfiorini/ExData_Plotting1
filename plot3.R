## load data
source('./util.R')
downloadProject1File()
data = read.csv(file = './household_power_consumption.txt', sep = ';', na.strings = '?', stringsAsFactors = F)
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$DateTime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## start plot
png('plot3.png', width=480, height=480, res=120)
with(data, { 
  plot(x = DateTime, y = Sub_metering_1 , type = 'l', ylab = 'Energy sub metering', xlab = '' ) 
  lines(x = DateTime, y = Sub_metering_2, col='red')
  lines(x = DateTime, y = Sub_metering_3, col='blue')
  legend("topright", lty=c(1,1),  col=c("black", "red", "blue"), legend = c("Sub metering 1","Sub metering 2","Sub metering 3"))
})
dev.off()