#======================================================
# [Exploratory Data Analysis] Project 1 
# Plot 4 Version 1.0
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
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0));
with(convertedData, {
    plot(x=datetime, 
         y=Global_active_power,
         xlab="",
         ylab="Global Active Power(kilowatts)",
         type="l",
         cex.axis=0.6,
         cex.names=0.6)
    plot(x=datetime, 
         y=Voltage,
         xlab="",
         ylab="Voltage",
         type="l",
         cex.axis=0.6,
         cex.names=0.6)
    plot(x=datetime, 
         y=Sub_metering_1,
         xlab="",
         ylab="Energy sub metering",
         type="n",
         cex.axis=0.6,
         cex.names=0.6)
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2,col="red")
    lines(datetime, Sub_metering_3,col="blue")
    legend("topright",
           lty=c(1,1,1),
           lwd=c(2,2,2),
           col = c("black","blue","red"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           cex=.5)
    plot(x=datetime, 
         y=Global_reactive_power,
         xlab="datetime",
         ylab="Global reactive power",
         type="l",
         cex.axis=0.6,
         cex.names=0.6)
    }
    );

#copy to an png file
dev.copy(png, file = "plot4.png",width=480,height=480);
dev.off();