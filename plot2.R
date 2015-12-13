createPlot2 <- function() {
  # Reads from the household_power_consumption dataset
  # and makes a plot of the Global_active_power variable against the Date and Time.
  
  # read data
  hpc <- read.table('household_power_consumption.txt', header= T, sep = ';')
  hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')
  hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

  # remove all data from days before 2007-02-01 and after 2007-02-02
  hpc <- hpc[!hpc$Date < as.Date('2007-02-01'),]
  hpc <- hpc[!hpc$Date > as.Date('2007-02-02'),]
  
  # make plot
  datetime <- hpc$DateTime
  power <- as.numeric(as.character(hpc$Global_active_power))
  png(filename = "plot2.png", bg = "transparent")
  plot(datetime,power, type = 'n', ylab = "Global Active Power (kilowatts)", xlab = "")  
  lines(datetime,power)
  dev.off()
}