#After downloading and unzipping the file
# read the data into a dataframe.
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#Filtering on the specific date range
plotdata <- fulldata[fulldata$Date %in% c('1/2/2007', '2/2/2007'),]
#Define new column with datetime format from combining two existing columns
fulldatetime <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
#Adding the new datetime column
plotdata <- cbind(fulldatetime, plotdata)


#Plot03
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(plotdata$fulldatetime, plotdata$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(plotdata$fulldatetime, plotdata$Sub_metering_2, col=columnlines[2])
lines(plotdata$fulldatetime, plotdata$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
