createPlot3 <- function() {
  # Reads from the household_power_consumption dataset
  # and makes a plot of the three Sub_metering variables against the Date and Time.
  
  # read data
  hpc <- read.table('household_power_consumption.txt', header= T, sep = ';')
  
  # format Date variable and add  DateTime
  hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
  hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")
  
  # remove all data from days prior to 2007-02-01
  hpc <- hpc[!hpc$Date < as.Date('2007-02-01'),]
  # remove all data from days after to 2007-02-01
  hpc <- hpc[!hpc$Date > as.Date('2007-02-02'),]
  
  # make plot
  sm1 <- as.numeric(as.character(hpc$Sub_metering_1))
  sm2 <- as.numeric(as.character(hpc$Sub_metering_2))
  sm3 <- as.numeric(as.character(hpc$Sub_metering_3))
  png(filename = "plot3.png", bg = "transparent")
  plot(datetime,sm1, type = 'n', ylab = "Energy sub metering", xlab = "", ylim = c(0,30), yaxt = 'n') 
  axis(2, at = c(0,10,20,30))
  lines(datetime,sm1)
  lines(datetime,sm2, col = 'red')
  lines(datetime,sm3, col = 'blue')
  legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd = 1, col = c('black','red','blue'))
  dev.off()
}