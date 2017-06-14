##COURSE 4: EDA
##PROJECT 1 - plor3.R
#Please save the file in your current working directory.
#EPC - Electric Power Consumption

#Read data from 2007-02-01 and 2007-02-02
EPC <- read.table("household_power_consumption.txt", sep = ";", col.names =
                          c("Date", "Time", "GAP", "GRP","Voltage", "GInt", "Sub_Met1", 
                            "Sub_Met2","Sub_Met3"), skip = grep("31/1/2007;23:59:00", readLines(
                                    "household_power_consumption.txt")), nrows = 2881,
                  stringsAsFactors = FALSE)

#CONCATENATE DATE AND TIME
EPC$DateTime <- with(EPC, as.POSIXct(paste(Date,Time),
                                     format="%d/%m/%Y %H:%M:%S"))

EPC <- EPC[c("DateTime", "Time", "GAP", "GRP","Voltage", "GInt", "Sub_Met1", 
             "Sub_Met2","Sub_Met3","Date","Time")]

library(dplyr)
EPC <- select(EPC,DateTime:Sub_Met3)
#Plot
par(mar = c(4,2,2,2))
plot(range(EPC$DateTime, EPC$DateTime, EPC$DateTime), range(EPC$Sub_Met1, 
        EPC$Sub_Met2, EPC$Sub_Met3), type = "n", xlab = "", ylab = "Energy sub metering")
lines(EPC$DateTime,EPC$Sub_Met1, col = "Black")
lines(EPC$DateTime, EPC$Sub_Met2, col = "Red")
lines(EPC$DateTime,EPC$Sub_Met3, col = "Blue")
legend("topright", lty = 1, col = c("Black","Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save to png file
dev.copy(png, file = "Plot3.png", width = 480, height = 480) #copy my plot1 to a png file
dev.off() #close the png device

