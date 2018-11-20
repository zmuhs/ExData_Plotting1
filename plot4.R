#After downloading and unzipping the file
# read the data into a dataframe.
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#Filtering on the specific date range
plotdata <- fulldata[fulldata$Date %in% c('1/2/2007', '2/2/2007'),]
#Define new column with datetime format from combining two existing columns
fulldatetime <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
#Adding the new datetime column
plotdata <- cbind(fulldatetime, plotdata)


#plot04
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plotdata, {
    plot(Global_active_power~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~dateTime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~dateTime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~dateTime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
