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
png(filename="plot3.png")

# Create plot
plot(x=hpc$dateTime,y=hpc$Sub_metering_1,type="l", xlab="",ylab="Energy sub meetering")
lines(x=hpc$dateTime,y=hpc$Sub_metering_2, type="l",col="red")
lines(x=hpc$dateTime,y=hpc$Sub_metering_3, type="l",col="blue")
legendTxt <-c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

# close device
dev.off()