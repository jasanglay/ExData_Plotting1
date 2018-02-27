fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./Data.zip"
txtfile <- "./Data/household_power_consumption.txt"
download.file(fileUrl,zipfile)
unzip(zipfile,overwrite = TRUE,exdir = "./Data")
alldata <- read.table(txtfile,sep = ";",header = TRUE)
pdata <- rbind(alldata[as.character(alldata$Date) == "1/2/2007",],alldata[as.character(alldata$Date) == "2/2/2007",])
png(filename = "plot1.png")
hist(as.numeric(as.character(pdata$Global_active_power)),col = "red",breaks = 12,main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()