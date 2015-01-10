#======================================================
# [Exploratory Data Analysis] Project 1 
# Plot 3 Version 1.0
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

#convert numeric paramerters from string type to numeric type
convertedData$Sub_metering_1 <- as.numeric(convertedData$Sub_metering_1);
convertedData$Sub_metering_2 <- as.numeric(convertedData$Sub_metering_2);
convertedData$Sub_metering_3 <- as.numeric(convertedData$Sub_metering_3);

#plot
plot(x=convertedData$datetime, 
     y=convertedData$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     type="n")

lines(convertedData$datetime, convertedData$Sub_metering_1);
lines(convertedData$datetime, convertedData$Sub_metering_2,col="red");
lines(convertedData$datetime, convertedData$Sub_metering_3,col="blue");

#add lengend to plot
legend("topright",
       lty=c(1,1,1),
       lwd=c(2,2,2),
       col = c("black","blue","red"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=.5);

#copy to an png file
dev.copy(png, file = "plot3.png",width=480,height=480);
dev.off();





