createPlot1 <- function() {
  # Reads from the household_power_consumption dataset
  # and makes a histogram of the Global_active_power variable.

  # read data
  hpc <- read.table('household_power_consumption.txt', header= T, sep = ';')
  hpc$Date <- as.Date(hpc$Date, '%d/%m/%Y')

  # remove all data from days before 2007-02-01 and after 2007-02-02
  hpc <- hpc[!hpc$Date < as.Date('2007-02-01'),]
  hpc <- hpc[!hpc$Date > as.Date('2007-02-02'),]
  
  # make plot
  power <- as.numeric(as.character(hpc$Global_active_power))
  png(filename = "plot1.png", bg = "transparent")
  hist(power, main = "Global Active Power", xlab = 'Global Active Power (kilowatts)', col = 'red', ylim = c(0,1200))
  dev.off()
}