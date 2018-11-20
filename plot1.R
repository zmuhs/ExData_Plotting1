#After downloading and unzipping the file
# read the data into a dataframe.
fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#Filtering on the specific date range
plotdata <- fulldata[fulldata$Date %in% c('1/2/2007', '2/2/2007'),]
#Define new column with datetime format from combining two existing columns
fulldatetime <-strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
#Adding the new datetime column
plotdata <- cbind(fulldatetime, plotdata)

#Plot 01
hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

