##COURSE 4: EDA
##PROJECT 1 - plor2.R
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
plot(EPC$Date,EPC$GAP, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#save to png file
dev.copy(png, file = "Plot2.png", width = 480, height = 480) #copy my plot1 to a png file
dev.off() #close the png device
