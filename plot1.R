# Exploratory Data Analysis Week 1 Project

setwd("G:\\Files\\Coursera\\Exploratory Data Analysis\\Project 1")

# Create dates to filter data set by
dates <- c("01/02/2007","02/02/2007")


# Read in text file
hpc = read.table("hpc.txt", sep =";", header = TRUE,na.strings = "?")

# Set date types
hpc$dateTime <- as.POSIXct(strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S"))

# Filter data set by dates filter above
hpc <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]

# Set device type
png(filename="plot1.png")

# Create histogram
hist(hpc$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# close device
dev.off()