#======================================================
# [Exploratory Data Analysis] Project 1 
# Plot 2 Version 1.0
# Authur: xinyi.sun
# Date: 2015/01/10
#======================================================

#readin raw data from txt file using fread (library data.table required)
#only read records from 2007/2/1 to 2007/1/2
rawData <- fread(
    "sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt",
    na.strings = c("?", ""));

#convert date and time
convertedData <- rawData;
convertedData$datetime  <- as.POSIXct(paste(convertedData$Date, convertedData$Time), format="%d/%m/%Y %H:%M:%S") 

#plot
plot(x=convertedData$datetime, 
     y=convertedData$Global_active_power,
     xlab="",
     ylab="Global Active Power(kilowatts)",
     type="l");

#copy to an png file
dev.copy(png, file = "plot2.png",width=480,height=480);
dev.off();