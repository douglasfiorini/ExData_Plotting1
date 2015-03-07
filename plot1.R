## load data
source('./util.R')
downloadProject1File()
data = read.csv(file = './household_power_consumption.txt', sep = ';', na.strings = '?', stringsAsFactors = F)
data = data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data$DateTime = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
## start plot
png('plot1.png', width=480, height=480, res=120)
hist(data$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()