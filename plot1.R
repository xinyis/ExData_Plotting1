#======================================================
# [Exploratory Data Analysis] Project 1 
# Plot 1 Version 1.1
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
convertedData$datetime  <- as.POSIXct(paste(convertedData$Date, convertedData $Time), format="%d/%m/%Y %H:%M:%S") 

#plot
hist(convertedData$Global_active_power, 
     col  = "red",
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",
     xlim = c(0,6),
     ylim = c(0,1200))
