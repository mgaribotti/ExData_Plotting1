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

png("plot1.png", width = 480, height = 480,
    units = "px", pointsize = 12)
hist(chartData$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylim = c(0, 1200), col = "red")
dev.off()