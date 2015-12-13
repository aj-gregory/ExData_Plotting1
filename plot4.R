createPlot4 <- function() {
  # Reads from the household_power_consumption dataset
  # and makes a grid of four plots from the data.
  
  # read data
  hpc <- read.table('household_power_consumption.txt', header= T, sep = ';')
  hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
  hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")
  
  # remove all data from days before 2007-02-01 and after 2007-02-02
  hpc <- hpc[!hpc$Date < as.Date('2007-02-01'),]
  hpc <- hpc[!hpc$Date > as.Date('2007-02-02'),]
  
  png(filename = "plot4.png", bg = "transparent")
  par(mfrow = c(2,2))
  
  # first plot
  datetime <- hpc$DateTime
  power <- as.numeric(as.character(hpc$Global_active_power))
  plot(datetime,power, type = 'n', ylab = "Global Active Power (kilowatts)", xlab = "")  
  lines(datetime,power)
  
  # second plot
  plot(datetime, voltage, type = 'n')
  lines(datetime, voltage)
  
  # third plot
  sm1 <- as.numeric(as.character(hpc$Sub_metering_1))
  sm2 <- as.numeric(as.character(hpc$Sub_metering_2))
  sm3 <- as.numeric(as.character(hpc$Sub_metering_3))
  plot(datetime,sm1, type = 'n', ylab = "Energy sub metering", xlab = "", ylim = c(0,30), yaxt = 'n') 
  axis(2, at = c(0,10,20,30))
  lines(datetime,sm1)
  lines(datetime,sm2, col = 'red')
  lines(datetime,sm3, col = 'blue')
  legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd = 1, col = c('black','red','blue'), box.lwd = 0)
  
  # fourth plot
  Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
  plot(datetime, Global_reactive_power, type = 'n')
  lines(datetime, Global_reactive_power)
  dev.off()
}