## Week 1 - Exploratory Data Analysis

## Read in Data
data <- read.table('household_power_consumption.txt',
                header = TRUE, sep = ";", na.strings = "?",
                stringsAsFactors = FALSE)

## Identify dates
data$Datefmt <- strptime(paste(data$Date, data$Time, " "),
                         format = "%d/%m/%Y %H:%M:%S")

## Limit to Feb 1 2007-Feb 2 2007
chartDates <- data$Date == "1/2/2007" | data$Date == "2/2/2007"

## Select Chart Data
chartData <- data[chartDates,]

## Remove large files
rm(data,chartDates)

png("plot3.png", width = 480, height = 480,
    units = "px", pointsize = 12)
with(chartData, plot(Datefmt, Sub_metering_1, type = "l",
                     ylab = "Energy sub metering", 
                     xlab = ""))
with(chartData, lines(Datefmt, Sub_metering_2, type = "l",
                      col = "red"))
with(chartData, lines(Datefmt, Sub_metering_3, type = "l",
                      col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), lty = 1)
dev.off()