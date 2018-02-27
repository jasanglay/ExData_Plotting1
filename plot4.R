fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./Data.zip"
txtfile <- "./Data/household_power_consumption.txt"
download.file(fileUrl,zipfile)
unzip(zipfile,overwrite = TRUE,exdir = "./Data")
alldata <- read.table(txtfile,sep = ";",header = TRUE)
pdata <- rbind(alldata[as.character(alldata$Date) == "1/2/2007",],alldata[as.character(alldata$Date) == "2/2/2007",])
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(strptime(paste(as.character(pdata$Date),as.character(pdata$Time),sep = " "),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(pdata$Global_active_power)),type = "l",col = "black",xlab = " ",ylab = "Global Active Power")
plot(strptime(paste(as.character(pdata$Date),as.character(pdata$Time),sep = " "),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(pdata$Voltage)),type = "l",col = "black",xlab = "datetime",ylab = "Voltage")
plot(strptime(paste(as.character(pdata$Date),as.character(pdata$Time),sep = " "),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(pdata$Sub_metering_1)),col = "black",type = "l",xlab = " ",ylab = "Energy sub metering")
lines(strptime(paste(as.character(pdata$Date),as.character(pdata$Time),sep = " "),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(pdata$Sub_metering_2)),col = "red")
lines(strptime(paste(as.character(pdata$Date),as.character(pdata$Time),sep = " "),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(pdata$Sub_metering_3)),col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1)
plot(strptime(paste(as.character(pdata$Date),as.character(pdata$Time),sep = " "),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(pdata$Global_reactive_power)),type = "l",col = "black",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()