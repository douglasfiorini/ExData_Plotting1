## load data
source('./util.R')
downloadProject1File()
data = read.csv(file = './household_power_consumption.txt', sep = ';', na.strings = '?', stringsAsFactors = F)
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$DateTime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## start plot
png('plot2.png', width=480, height=480, res=120)
with(data, plot(x = DateTime, y = Global_active_power, type = 'l', ylab = 'Global Active Power(kilowatts)', xlab = '' ))
dev.off()
