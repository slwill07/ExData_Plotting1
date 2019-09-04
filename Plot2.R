## Create a directory for the project, download, and unzip the data files.
if (!file.exists("EDAWeek1")) {dir.create("./EDAWeek1")}
setwd("C:\\Users\\Shanon\\Coursera-EDA\\EDAWeek1")
filename <- "C:\\Users\\Shanon\\Coursera-EDA\\exdata_data_household_power_consumption.zip"
unzip(filename, exdir = "C:\\Users\\Shanon\\Coursera-EDA\\EDAWeek1")

## Reading, and subsetting files from the Electric Power Consumption data.
Data <- read.table("household_power_consumption.txt", skip=1, sep=";", na.strings="?")
names(Data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
powerData <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
dTime <- paste(powerData$Date, powerData$Time)
dateTime <- strptime(dTime, "%Y-%m-%d %H:%M:%S")

## Creating the file device.
png(file="Plot2.png", width=480, height=480)

## Creating the base plot using lines.
plot(dateTime, as.numeric(powerData$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()